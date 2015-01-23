<?php

/**
 * Mno Tax Class
 */
class MnoSoaTax extends MnoSoaBaseTax {
  protected $_local_entity_name = "TAX";

  protected function pushTax() {
    $this->_log->debug("start pushTax " . json_encode($this->_local_entity));
    $mno_id = $this->getMnoIdByLocalId($this->_local_entity->id);
    if ($this->isValidIdentifier($mno_id)) {
      $this->_id = $mno_id->_id;
    }

    $this->_name = $this->_local_entity->name;
    $this->_rate = $this->_local_entity->rate;
    $this->_log->debug("after pushTax");
  }

  protected function pullTax() {
    $this->_log->debug("start " . __FUNCTION__ . " for " . json_encode($this->_id));
        
    if (!empty($this->_id)) {
      $local_id = $this->getLocalIdByMnoId($this->_id);
      $this->_log->debug(__FUNCTION__ . " this->getLocalIdByMnoId(this->_id) = " . json_encode($local_id));
      
      if ($this->isValidIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " updating tax rate " . json_encode($local_id));
        $status = constant('MnoSoaBaseEntity::STATUS_EXISTING_ID');
      } else if ($this->isDeletedIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " is STATUS_DELETED_ID");
        $status = constant('MnoSoaBaseEntity::STATUS_DELETED_ID');
      } else {
        $this->_log->debug(__FUNCTION__ . " creating new tax rate " . json_encode($local_id));
        $status = constant('MnoSoaBaseEntity::STATUS_NEW_ID');
      }
    } else {
      $status = constant('MnoSoaBaseEntity::STATUS_ERROR');
    }

    return $status;
  }

  protected function saveLocalEntity($push_to_maestrano, $status) {
    $this->_log->debug("start saveLocalEntity status=$status");

    $local_id = $this->getLocalIdByMnoId($this->_id);
    $tax_name = $this->pull_set_or_delete_value($this->_name);
    $tax_rate = $this->pull_set_or_delete_value($this->_rate);

    $this->_log->debug("creating or updating tax $tax_name => $tax_rate with id " . json_encode($local_id));

    if(!isset($tax_rate) || $tax_rate == 0.0) { return null; }

    if($status == constant('MnoSoaBaseEntity::STATUS_NEW_ID')) {
      // Try to find any existing tax rate with same name
      $local_tax = $this->findTaxByLabel($tax_name);
      if(isset($local_tax)) {
        $tax_id = $local_tax['id'];
        $query = "UPDATE mno_taxes SET rate=? AND name=? WHERE id=?";
        $this->_db->pquery($query, array($tax_rate, $tax_name, $tax_id));
      } else {
        $tax_id = $this->addTaxType($tax_name, $tax_rate);
      }

      // Map Tax ID
      $this->addIdMapEntry($tax_id, $this->_id);
    }

    if($status == constant('MnoSoaBaseEntity::STATUS_EXISTING_ID')) {
      // Update tax rate
      $tax_id = $local_id->_id;
      if(isset($tax_id)) {
        $update_query = "UPDATE mno_taxes SET rate=? AND name=? WHERE id=?";
        $this->_db->pquery($update_query, array($tax_rate, $tax_name, $tax_id));
      }
    }
  }

  public function getLocalEntityIdentifier() {
    return $this->_local_entity->id;
  }

  public function getAllTaxes() {
    $taxes = array();
    $query = "SELECT * from mno_taxes";
    $result = $this->_db->query($query);
    while($row = $this->_db->fetchByAssoc($result)) {
      array_push($taxes, $row);
    }
    return $taxes;
  }

  public function findTaxByLabel($tax_name) {
    $taxes = $this->getAllTaxes();
    foreach ($taxes as $tax) {
      if($tax['name'] == $tax_name) {
        return $tax;
      }
    }
    return null;
  }

  public function findTaxById($tax_id) {
    $taxes = $this->getAllTaxes();
    foreach ($taxes as $tax) {
      if($tax['id'] == $tax_id) {
        return $tax;
      }
    }
    return null;
  }

  private function addTaxType($tax_name, $tax_rate) {
    $guid = create_guid();
    $query = "INSERT INTO mno_taxes (id, name, date_entered, date_modified, modified_user_id, created_by, description, deleted, assigned_user_id, rate) VALUES (" . 
      $this->_db->quoted($guid) . ", " .
      $this->_db->quoted($tax_name) . ", UTC_TIMESTAMP, UTC_TIMESTAMP, NULL, NULL, NULL, false, NULL, " . $tax_rate . ")";
    $result = $this->_db->query($query);
    $this->_log->debug("Add tax query = ".$query);
    $this->_db->pquery($query, array());

    return $guid;
  }
}

?>