<?php

/**
* Mno Organization Class
*/
class MnoSoaOrganization extends MnoSoaBaseOrganization
{
  protected $_local_entity_name = "account";

  protected function pushId() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start");
    $id = $this->getLocalEntityIdentifier();

    if (!empty($id)) {
      $mno_id = $this->getMnoIdByLocalId($id);

      if ($this->isValidIdentifier($mno_id)) {
        $this->_log->debug(__FUNCTION__ . " this->getMnoIdByLocalId(id) = " . json_encode($mno_id));
        $this->_id = $mno_id->_id;
      }
    }
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end");
  }

  protected function pullId() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start");
    if (!empty($this->_id)) {
      $local_id = $this->getLocalIdByMnoId($this->_id);
      $this->_log->debug(__FUNCTION__ . " this->getLocalIdByMnoId(this->_id) = " . json_encode($local_id));

      if ($this->isValidIdentifier($local_id)) {
        $this->_local_entity = new Account();
        $this->_local_entity->retrieve($local_id->_id);
        $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " is STATUS_EXISTING_ID");
        return constant('MnoSoaBaseEntity::STATUS_EXISTING_ID');
      } else if ($this->isDeletedIdentifier($local_id)) {
        $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " is STATUS_DELETED_ID");
        return constant('MnoSoaBaseEntity::STATUS_DELETED_ID');
      } else {
        $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " before new account");
        $this->_local_entity = new Account();
        $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " after new account");
        $this->pullName();
        return constant('MnoSoaBaseEntity::STATUS_NEW_ID');
      }
    }
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " return STATUS_ERROR");
    return constant('MnoSoaBaseEntity::STATUS_ERROR');
  }

  protected function pushName() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_name = $this->push_set_or_delete_value($this->_local_entity->name);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pullName() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_local_entity->name = $this->pull_set_or_delete_value($this->_name);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pushIndustry() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $industry = $this->push_set_or_delete_value($this->_local_entity->industry);
    if (strcmp($industry, '--None--') == 0 || strcmp($industry, 'Other') == 0) { $industry = ""; }
    $this->_industry = $industry;
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pullIndustry() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_local_entity->industry = $this->pull_set_or_delete_value($this->_industry);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pushAnnualRevenue() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $annual_revenue = $this->getNumeric($this->_local_entity->annual_revenue);
    $this->_annual_revenue = $this->push_set_or_delete_value($annual_revenue);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pullAnnualRevenue() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_local_entity->annual_revenue = $this->pull_set_or_delete_value($this->_annual_revenue);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pushCapital() {
// DO NOTHING
  }

  protected function pullCapital() {
// DO NOTHING
  }

  protected function pushNumberOfEmployees() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $number_of_employees = $this->getNumeric($this->_local_entity->employees);
    $this->_number_of_employees = $this->push_set_or_delete_value($number_of_employees);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pullNumberOfEmployees() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_local_entity->employees = $this->pull_set_or_delete_value($this->_number_of_employees);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pushAddresses() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
// BILLING ADDRESS -> POSTAL ADDRESS
    $this->_address->postalAddress->streetAddress = $this->push_set_or_delete_value($this->_local_entity->billing_address_street);
    $this->_address->postalAddress->locality = $this->push_set_or_delete_value($this->_local_entity->billing_address_city);
    $this->_address->postalAddress->region = $this->push_set_or_delete_value($this->_local_entity->billing_address_state);
    $this->_address->postalAddress->postalCode = $this->push_set_or_delete_value($this->_local_entity->billing_address_postalcode);
    $this->_address->postalAddress->country = $this->push_set_or_delete_value($this->_local_entity->billing_address_country);
// SHIPPING ADDRESS -> STREET ADDRESS
    $this->_address->streetAddress->streetAddress = $this->push_set_or_delete_value($this->_local_entity->shipping_address_street);
    $this->_address->streetAddress->locality = $this->push_set_or_delete_value($this->_local_entity->shipping_address_city);
    $this->_address->streetAddress->region = $this->push_set_or_delete_value($this->_local_entity->shipping_address_state);
    $this->_address->streetAddress->postalCode = $this->push_set_or_delete_value($this->_local_entity->shipping_address_postalcode);
    $this->_address->streetAddress->country = $this->push_set_or_delete_value($this->_local_entity->shipping_address_country);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pullAddresses() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
// POSTAL ADDRESS -> BILLING ADDRESS
    $this->_local_entity->billing_address_street = $this->pull_set_or_delete_value($this->_address->postalAddress->streetAddress);
    $this->_local_entity->billing_address_city = $this->pull_set_or_delete_value($this->_address->postalAddress->locality);
    $this->_local_entity->billing_address_state = $this->pull_set_or_delete_value($this->_address->postalAddress->region);
    $this->_local_entity->billing_address_postalcode = $this->pull_set_or_delete_value($this->_address->postalAddress->postalCode);
    $this->_local_entity->billing_address_country = $this->pull_set_or_delete_value($this->_address->postalAddress->country);
// STREET ADDRESS -> SHIPPING ADDRESS
    $this->_local_entity->shipping_address_street = $this->pull_set_or_delete_value($this->_address->streetAddress->streetAddress);
    $this->_local_entity->shipping_address_city = $this->pull_set_or_delete_value($this->_address->streetAddress->locality);
    $this->_local_entity->shipping_address_state = $this->pull_set_or_delete_value($this->_address->streetAddress->region);
    $this->_local_entity->shipping_address_postalcode = $this->pull_set_or_delete_value($this->_address->streetAddress->postalCode);
    $this->_local_entity->shipping_address_country = $this->pull_set_or_delete_value($this->_address->streetAddress->country);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pushEmails() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_email->emailAddress = $this->push_set_or_delete_value($this->_local_entity->email1);
    $this->_email->emailAddress2 = $this->push_set_or_delete_value($this->_local_entity->email2);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pullEmails() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_local_entity->email1 = $this->pull_set_or_delete_value($this->_email->emailAddress);
    $this->_local_entity->email2 = $this->pull_set_or_delete_value($this->_email->emailAddress2);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }


  protected function pushTelephones() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_telephone->voice = $this->push_set_or_delete_value($this->_local_entity->phone_office);
    $this->_telephone->fax = $this->push_set_or_delete_value($this->_local_entity->phone_fax);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pullTelephones() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_local_entity->phone_office = $this->pull_set_or_delete_value($this->_telephone->voice);
    $this->_local_entity->phone_fax = $this->pull_set_or_delete_value($this->_telephone->fax);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pushWebsites() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_website->url = $this->push_set_or_delete_value($this->_local_entity->website);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pullWebsites() {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_local_entity->website = $this->pull_set_or_delete_value($this->_website->url);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  protected function pushEntity() {
    $account_type = $this->push_set_or_delete_value($this->_local_entity->account_type);
    if(isset($account_type) && $account_type == 'Customer') { $this->_entity = array('customer'=>true); }
    if(isset($account_type) && $account_type == 'Supplier') { $this->_entity = array('supplier'=>true); }
  }

  protected function pullEntity() {
    $entity_type = $this->pull_set_or_delete_value($this->_entity);
    if(isset($entity_type) && isset($entity_type->customer) && $entity_type->customer == true) { $this->_local_entity->account_type = 'Customer'; }
    if(isset($entity_type) && isset($entity_type->supplier) && $entity_type->supplier == true) { $this->_local_entity->account_type = 'Supplier'; }
  }

  protected function saveLocalEntity($push_to_maestrano) {
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " start ");
    $this->_local_entity->save(false, $push_to_maestrano);
    $this->_log->debug(__CLASS__ . ' ' . __FUNCTION__ . " end ");
  }

  public function getLocalEntityIdentifier() {
    return $this->_local_entity->id;
  }
}

?>