<?php

/**
 * Mno Item Class
 */
class MnoSoaItem extends MnoSoaBaseItem
{
    protected $_local_entity_name = "products";
    
    protected function pushId() {
        $this->_log->debug(__FUNCTION__ . " start");
        
        $id = $this->getLocalEntityIdentifier();
        if (empty($id)) { return; }

        // Get previous versions IDs of the product
        $previous_product_ids = $this->_local_entity->getAllPreviousVersions();
        foreach ($previous_product_ids as $product_id) {
          $mno_id = $this->getMnoIdByLocalId($product_id);
          // Relink previous ID to the new one
          if ($this->isValidIdentifier($mno_id)) {
            $this->_log->debug("relink product_id $product_id from mno_id " . json_encode($mno_id));
            $this->_mno_soa_db_interface->relinkIdMapEntry($id, $product_id, $this->_local_entity_name);
          }
        }

        $mno_id = $this->getMnoIdByLocalId($id);
        if ($this->isValidIdentifier($mno_id)) {
          $this->_log->debug(__FUNCTION__ . " this->getMnoIdByLocalId(id) = " . json_encode($mno_id));
          $this->_id = $mno_id->_id;
        }

        $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullId() {
      $this->_log->debug(__FUNCTION__ . " start " . $this->_id);
        
      if (!empty($this->_id)) {
        $local_id = $this->getLocalIdByMnoId($this->_id);
        $this->_log->debug(__FUNCTION__ . " this->getLocalIdByMnoId(this->_id) = " . json_encode($local_id));
        
        $status = nil;
        if ($this->isValidIdentifier($local_id)) {
          $this->_log->debug(__FUNCTION__ . " is STATUS_EXISTING_ID");
          $this->_local_entity = new oqc_Product();
          $this->_local_entity->retrieve($local_id->_id);
          $status = constant('MnoSoaBaseEntity::STATUS_EXISTING_ID');
        } else if ($this->isDeletedIdentifier($local_id)) {
          $this->_log->debug(__FUNCTION__ . " is STATUS_DELETED_ID");
          $status = constant('MnoSoaBaseEntity::STATUS_DELETED_ID');
        } else {
          $this->_local_entity = new oqc_Product();
          $this->_local_entity->version = 1;
          $this->_local_entity->published_state = 'published';

          $result = $this->_db->fetchByAssoc($this->_db->query("SELECT MAX(unique_identifier) FROM oqc_product;"));
          $max_unique_identifier = $result["MAX(unique_identifier)"];
          $this->_local_entity->unique_identifier = $max_unique_identifier + 1;

          $status = constant('MnoSoaBaseEntity::STATUS_NEW_ID');
        }

        $this->pullName();
        $this->pullCode();
        $this->pullDescription();
        $this->pullType();
        $this->pullStatus();
        $this->pullUnit();
        $this->pullSalePrice();

        // Map sale tax rate
        if(isset($this->_sale_tax_code)) {
          $local_tax_id_map = $this->getLocalIdByMnoIdName($this->_sale_tax_code->id, "TAX_CODES");
          $mno_tax = new MnoSoaTax($this->_db, $this->_log);
          $mno_tax = $mno_tax->findTaxById($local_tax_id_map->_id);
          $tax_rate100 = floatval($mno_tax['rate']) / 100.0;
          $this->_local_entity->oqc_vat = "$tax_rate100";
        }

        return $status;
      }
      $this->_log->debug(__FUNCTION__ . " return STATUS_ERROR");
      return constant('MnoSoaBaseEntity::STATUS_ERROR');
    }
    
    protected function pushName() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_name = $this->push_set_or_delete_value($this->_local_entity->name);
        $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullName() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_local_entity->name = $this->pull_set_or_delete_value($this->_name);
        $this->_log->debug(__FUNCTION__ . " end");
    }

    protected function pushCode() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_code = $this->push_set_or_delete_value($this->_local_entity->svnumber);
        $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullCode() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_local_entity->svnumber = $this->pull_set_or_delete_value($this->_code);
        $this->_log->debug(__FUNCTION__ . " end");
    }

    protected function pushDescription() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_description = $this->push_set_or_delete_value($this->_local_entity->description);
        $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullDescription() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_local_entity->description = $this->pull_set_or_delete_value($this->_description);
        $this->_log->debug(__FUNCTION__ . " end");
    }

    protected function pushStatus() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_status = 'ACTIVE';
        $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullStatus() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_local_entity->status = 'New';
        $this->_log->debug(__FUNCTION__ . " end");
    }

    protected function pushType() {
        $this->_log->debug(__FUNCTION__ . " start");
        // TODO ?
        $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullType() {
        $this->_log->debug(__FUNCTION__ . " start");
        // TODO ?
        $this->_log->debug(__FUNCTION__ . " end");
    }

    protected function pushUnit() {
        $this->_log->debug(__FUNCTION__ . " start");
        // TODO: What is unit?
        $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullUnit() {
        $this->_log->debug(__FUNCTION__ . " start");
        // TODO: What is unit?
        $this->_log->debug(__FUNCTION__ . " end");
    }

    protected function pushSalePrice() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_sale_price = $this->push_set_or_delete_value($this->_local_entity->price);
        $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullSalePrice() {
        $this->_log->debug(__FUNCTION__ . " start");
        $this->_local_entity->price = $this->pull_set_or_delete_value($this->_sale_price);
        $this->_log->debug(__FUNCTION__ . " end");
    }

    protected function pushPurchasePrice() {
      $this->_log->debug(__FUNCTION__ . " start");
      $this->_purchase_price = $this->push_set_or_delete_value($this->_local_entity->cost);
      $this->_log->debug(__FUNCTION__ . " end");
    }
    
    protected function pullPurchasePrice() {
      $this->_log->debug(__FUNCTION__ . " start");
      $this->_local_entity->cost = $this->pull_set_or_delete_value($this->_purchase_price);
      $this->_log->debug(__FUNCTION__ . " end");
    }

    protected function pushTax() {
      // SugarCRM stores only the tax rate against product, find first tax matching rate
      $mno_tax = new MnoSoaTax($this->_db, $this->_log);
      $taxes = $mno_tax->getAllTaxes();
      foreach ($taxes as $tax) {
        // Find first tax matching rate
        $oqc_tax_rate = floatval($tax['rate']) / 100.0;
        if($oqc_tax_rate == $this->_local_entity->oqc_vat) {
          $mno_id = $this->getMnoIdByLocalIdName($tax['id'], 'TAX');
          if(isset($mno_id)) {
            $this->_sale_tax_code = $mno_id->_id;
          }
        }
      }
    }
    
    protected function pushEntity() {
      // DO NOTHING
    }
    
    protected function pullEntity() {
      // DO NOTHING
    }

    protected function saveLocalEntity($push_to_maestrano) {
      $this->_local_entity->save(false, false, $push_to_maestrano);
    }
    
    public function getLocalEntityIdentifier() {
      return $this->_local_entity->id;
    }
}

?>
