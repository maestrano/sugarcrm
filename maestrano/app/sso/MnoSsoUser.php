<?php

/**
 * Configure App specific behavior for 
 * Maestrano SSO
 */
class MnoSsoUser extends MnoSsoBaseUser
{
  /**
   * Database connection
   * @var PDO
   */
  public $connection = null;
  
  /**
   * SugarCRM unique key
   * @var String
   */
  public $app_unique_key = '';
  
  
  /**
   * Extend constructor to inialize app specific objects
   *
   * @param OneLogin_Saml_Response $saml_response
   *   A SamlResponse object from Maestrano containing details
   *   about the user being authenticated
   */
  public function __construct(OneLogin_Saml_Response $saml_response, &$session = array(), $opts = array())
  {
    // Call Parent
    parent::__construct($saml_response,$session);
    
    // Assign new attributes
    $this->connection = $opts['db_connection'];
    $this->app_unique_key = $opts['app_unique_key'];
  }
  
  
  /**
   * Sign the user in the application. 
   * Parent method deals with putting the mno_uid, 
   * mno_session and mno_session_recheck in session.
   *
   * @return boolean whether the user was successfully set in session or not
   */
  protected function setInSession()
  {
    // Retrieve the user
    $user = new User();
    $user->retrieve($this->local_id);
    
    if ($user && $user->id) {
        
        // Set session
        $this->session['authenticated_user_id'] = $user->id;
        $this->session['login_user_name'] = $user->user_name;
		    $this->session['login_password'] = $user->user_hash;
        $this->session['unique_key'] = $this->app_unique_key;
        
        return true;
    } else {
        return false;
    }
  }
  
  
  /**
   * Used by createLocalUserOrDenyAccess to create a local user 
   * based on the sso user.
   * If the method returns null then access is denied
   *
   * @return the ID of the user created, null otherwise
   */
  protected function createLocalUser()
  {
    $lid = null;
    
    if ($this->accessScope() == 'private') {
      // Build user
      $user = $this->buildLocalUser();
      
      // Save user and retrieve local id
      $user->save();
      $lid = $user->id;
    }
    
    return $lid;
  }
  
  /**
   * Build a local user for creation
   *
   * @return a SugarCRM user
   */
  protected function buildLocalUser()
  {
    $user = new User();
    $user->user_name       = $this->uid;
    $user->first_name      = $this->name;
    $user->last_name       = $this->surname;
    $user->status          = 'Active';
    $user->is_admin        = $this->isUserAdmin();
    $user->email1          = $this->email;
    $user->employee_status = 'Active';
    $user->user_hash       = md5($this->generatePassword());
    
    return $user;
  }
  
  /**
   * Return wether the user is admin or not
   *
   * @return integer 1 if admin and 0 otherwise
   */
  protected function isUserAdmin()
  {
    $is_admin = 0; // User
    
    if ($this->app_owner) {
      $is_admin = 1; // Admin
    } else {
      foreach ($this->organizations as $organization) {
        if ($organization['role'] == 'Admin' || $organization['role'] == 'Super Admin') {
          $is_admin = 1;
        } else {
          $is_admin = 0;
        }
      }
    }
    
    return $is_admin;
  }
  
  /**
   * Get the ID of a local user via Maestrano UID lookup
   *
   * @return a user ID if found, null otherwise
   */
  protected function getLocalIdByUid()
  {
    $arg = addslashes($this->uid);
    $result = $this->connection->query("SELECT id FROM users WHERE mno_uid = '{$arg}' LIMIT 1");
    $result = $this->connection->fetchByAssoc($result);
    
    if ($result && $result['id']) {
      return $result['id'];
    }
    
    return null;
  }
  
  /**
   * Get the ID of a local user via email lookup
   *
   * @return a user ID if found, null otherwise
   */
  protected function getLocalIdByEmail()
  {
    $arg = addslashes($this->email);
    $result = $this->connection->query("SELECT u.id
      FROM users u, email_addr_bean_rel r, email_addresses e
      WHERE e.id = r.email_address_id
      AND r.primary_address = 1
      AND r.bean_module = 'Users'
      AND u.id = r.bean_id
      AND e.email_address = '{$arg}' LIMIT 1");
    $result = $this->connection->fetchByAssoc($result);
    
    if ($result && $result['id']) {
      return $result['id'];
    }
    
    return null;
  }
  
  /**
   * Set all 'soft' details on the user (like name, surname, email)
   * Implementing this method is optional.
   *
   * @return boolean whether the user was synced or not
   */
   protected function syncLocalDetails()
   {
     if($this->local_id) {
       // Sync the user first
       $data = Array(
         'id'         => addslashes($this->local_id),
         'user_name'  => addslashes($this->uid),
         'first_name' => addslashes($this->name),
         'last_name'  => addslashes($this->surname),
         'email'      => addslashes($this->email),
         'email_caps' => addslashes(strtoupper($this->email)),
       );
       
       $upd1 = $this->connection->query("UPDATE users 
         SET user_name = '{$data['user_name']}',
         first_name = '{$data['first_name']}',
         last_name = '{$data['last_name']}'
         WHERE id = '{$data['id']}'");
       
       // Sync the user primary email then
       $upd2 = $this->connection->query("UPDATE users u, email_addr_bean_rel r, email_addresses e
         SET e.email_address = '{$data['email']}',
         e.email_address_caps = '{$data['email_caps']}'
         WHERE e.id = r.email_address_id
         AND r.primary_address = 1
         AND r.bean_module = 'Users'
         AND u.id = r.bean_id
         AND u.id = '{$data['id']}'");
       
       return $upd1 && $upd2;
     }
     
     return false;
   }
  
  /**
   * Set the Maestrano UID on a local user via id lookup
   *
   * @return a user ID if found, null otherwise
   */
  protected function setLocalUid()
  {
    if($this->local_id) {
      $data = Array(
        'id'       => addslashes($this->local_id),
        'mno_uid'  => addslashes($this->uid),
      );
      
      $upd = $this->connection->query("UPDATE users 
        SET mno_uid = '{$data['mno_uid']}'
        WHERE id = '{$data['id']}'");
      
      return $upd;
    }
    
    return false;
  }
}