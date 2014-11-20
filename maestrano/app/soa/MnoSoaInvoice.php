<?php

/**
 * Mno Invoice Class
 */
class MnoSoaInvoice extends MnoSoaBaseInvoice {
  protected $_local_entity_name = "INVOICE";

  protected function pushInvoice() {
    $this->_log->debug("start pushInvoice " . json_encode($this->_local_entity->column_fields));

    $id = $this->getLocalEntityIdentifier();
    if (empty($id)) { return; }

    // Get previous versions IDs of the invoice
    $previous_invoice_ids = $this->_local_entity->getAllPreviousVersions();
    foreach ($previous_invoice_ids as $invoice_id) {
      $mno_id = $this->getMnoIdByLocalId($invoice_id);
      // Relink previous ID to the new one
      if ($this->isValidIdentifier($mno_id)) {
        $this->_log->debug("relink invoice_id $invoice_id from mno_id " . json_encode($mno_id));
        $this->_mno_soa_db_interface->relinkIdMapEntry($id, $invoice_id, $this->_local_entity_name);
      }
    }

    $mno_id = $this->getMnoIdByLocalId($id);
    if ($this->isValidIdentifier($mno_id)) {
      $this->_log->debug(__FUNCTION__ . " this->getMnoIdByLocalId(id) = " . json_encode($mno_id));
      $this->_id = $mno_id->_id;
    }

    // TODO!

    // Invoice or Sales Order
    if(isset($this->_local_entity->column_fields['salesorder_no'])) {
      $this->_type = 'SUPPLIER';
    } else if(isset($this->_local_entity->column_fields['invoice_no'])) {
      $this->_type = 'CUSTOMER';
    }

    if(isset($this->_local_entity->column_fields['subject'])) { 
      $this->_title = $this->push_set_or_delete_value($this->_local_entity->column_fields['subject']);
    }
    if(isset($this->_local_entity->column_fields['customerno'])) { 
      $this->_transaction_number = $this->push_set_or_delete_value($this->_local_entity->column_fields['customerno']);
    }
    if(isset($this->_local_entity->column_fields['invoicedate'])) {
      $this->_transaction_date = strtotime($this->push_set_or_delete_value($this->_local_entity->column_fields['invoicedate']));
    }
    if(isset($this->_local_entity->column_fields['duedate'])) {
      $this->_due_date = strtotime($this->push_set_or_delete_value($this->_local_entity->column_fields['duedate']));
    }
    
    $this->_amount = array();
    if(isset($this->_local_entity->column_fields['total'])) { $this->_amount["price"] = $this->_local_entity->column_fields['total']; }

    // Map status
    $invoicestatus = $this->_local_entity->column_fields['invoicestatus'];
    if(isset($invoicestatus)) {
      if($invoicestatus == 'Sent') {
        $this->_status = 'SUBMITTED';
      } else if($invoicestatus == 'Approved') {
        $this->_status = 'AUTHORISED';
      } else if($invoicestatus == 'Paid') {
        $this->_status = 'PAID';
      } else {
        $this->_status = 'DRAFT';
      }
    } else {
      $this->_status = 'DRAFT';
    }

    // Map Organization
    if(isset($this->_local_entity->column_fields['account_id'])) {
      $mno_oragnization_id = $this->getMnoIdByLocalIdName($this->_local_entity->column_fields['account_id'], "ACCOUNTS");
      $this->_organization_id = $mno_oragnization_id->_id;
    }

    // Map Contact
    if(isset($this->_local_entity->column_fields['contact_id'])) {
      $mno_person_id = $this->getMnoIdByLocalIdName($this->_local_entity->column_fields['contact_id'], "CONTACTS");
      $this->_person_id = $mno_person_id->_id;
    }

    // Map invoice lines
    $this->_invoice_lines = array();
    $current_line_number = 0;
    $tot_no_prod = $this->_local_entity->column_fields['totalProductCount'];
    for($i=1; $i<=$tot_no_prod; $i++) {
      $invoice_line = array();

      // vTiger recreates the invoice lines on every save, so local IDs are not mappable
      // Use InvoiceID#LineNumber instead
      $invoice_line_id = $id . "#" . $i;
      $this->_log->debug("processing invoice line " . $invoice_line_id);
      $mno_invoice_line_id = $this->getMnoIdByLocalIdName($invoice_line_id, "INVOICE_LINE");
      if($this->isValidIdentifier($mno_invoice_line_id)) {
        $invoice_line_id_parts = explode("#", $mno_invoice_line_id->_id);
        $invoice_line_mno_id = $invoice_line_id_parts[1];
      } else {
        // Generate and save ID
        $invoice_line_mno_id = uniqid();
        $invoice_line_mno_id_local = $this->_id . "#" . uniqid();
        $this->_mno_soa_db_interface->addIdMapEntry($invoice_line_id, "INVOICE_LINE", $invoice_line_mno_id_local, "INVOICE_LINE");
      }

      if($this->_local_entity->column_fields["deleted".$i] == 1) {
        $this->_log->debug("invoice line " . $invoice_line_id . " marked for deletion");
        // Invoice line has been deleted
        $invoice_line = '';
        // Delete local mapping
        $this->_mno_soa_db_interface->hardDeleteIdMapEntry($invoice_line_id, "INVOICE_LINE");

      } else {
        $current_line_number = $current_line_number + 1;

        // If a previous line has been deleted, we need to shift the line ids
        if($i != $current_line_number) {
          $new_local_id = $id . "#" . $current_line_number;
          $this->_log->debug("shifting invoice line " . $invoice_line_id . " to position " . $new_local_id);
          $this->_mno_soa_db_interface->updateIdMapEntry($invoice_line_id, $new_local_id, "INVOICE_LINE");
        }

        $invoice_line['lineNumber'] = $current_line_number;
        $invoice_line['description'] = $this->_local_entity->column_fields['comment'.$i];

        $quantity = floatval($this->_local_entity->column_fields['qty'.$i]);
        $invoice_line['quantity'] = $quantity;

        // Line discount
        $discount = 0;
        if($this->_local_entity->column_fields["discount_type".$i] == 'percentage') {
          $discount = floatval($this->_local_entity->column_fields['discount_percentage'.$i]);
          $invoice_line['reductionPercent'] = $discount;
        }

        // Line total tax
        $total_line_tax = 0;
        if(isset($this->_local_entity->column_fields['popup_tax_row'.$i])) {
          $total_line_tax = floatval($this->_local_entity->column_fields['popup_tax_row'.$i]);
        }

        // Map line prices
        $unit_price = floatval($this->_local_entity->column_fields['listPrice'.$i]);
        $invoice_line['unitPrice']['netAmount'] = $unit_price;

        $discount_factor = (1 - ($discount / 100));
        $invoice_line['totalPrice']['taxAmount'] = $total_line_tax;
        $invoice_line['totalPrice']['netAmount'] = $unit_price * $quantity * $discount_factor;
        $invoice_line['totalPrice']['price'] = ($unit_price * $quantity) * $discount_factor + $total_line_tax;

        // Map item id
        $product_id = $this->_local_entity->column_fields['hdnProductId'.$i];
        if(isset($product_id)) {
          $mno_product_id = $this->getMnoIdByLocalIdName($product_id, "PRODUCTS");
          $item_id = $mno_product_id->_id;
          $invoice_line['item']->id = $mno_product_id->_id;
        }

        // Map taxes
        $total_tax_rate = 0;
        $product_taxes = getTaxDetailsForProduct($product_id);
        foreach ($product_taxes as $key => $product_tax) {
          if($product_tax['percentage'] > 0) {
            $total_tax_rate += $product_tax['percentage'];

            $mno_id = $this->getMnoIdByLocalIdName($product_tax['taxid'], 'TAX');
            if(isset($mno_id)) {
              $invoice_line['taxCode'] = array('id' => $mno_id->_id);
            }
          }
        }

        $invoice_line['unitPrice']['taxRate'] = $total_tax_rate;
        $invoice_line['unitPrice']['taxAmount'] = $unit_price * ($total_tax_rate / 100);
        $invoice_line['unitPrice']['price'] = $unit_price * (1 + ($total_tax_rate / 100));
        $invoice_line['totalPrice']['taxRate'] = $total_tax_rate;
      }

      $this->_invoice_lines[$invoice_line_mno_id] = $invoice_line;
    }

    $this->_log->debug("after pushInvoice");
  }

  protected function pullInvoice() {
    $this->_log->debug("start " . __FUNCTION__ . " for " . json_encode($this->_id));
    
    if (!empty($this->_id)) {
      $local_id = $this->getLocalIdByMnoId($this->_id);
      $this->_log->debug(__FUNCTION__ . " this->getLocalIdByMnoId(this->_id) = " . json_encode($local_id));

      $this->_log->debug("processing supplier sale order");
      if ($this->isValidIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " is STATUS_EXISTING_ID");
        $this->_local_entity = new oqc_Contract();
        $this->_local_entity->retrieve($local_id->_id);
        $status = constant('MnoSoaBaseEntity::STATUS_EXISTING_ID');
      } else if ($this->isDeletedIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " is STATUS_DELETED_ID");
        $status = constant('MnoSoaBaseEntity::STATUS_DELETED_ID');
      } else {
        $this->_local_entity = new oqc_Contract();
        $this->_local_entity->version = 1;
        $this->_local_entity->status = 'Draft';
        $this->_local_entity->shipment_terms = 'Default';
        
        $result = $this->_db->fetchByAssoc($this->_db->query("SELECT MAX(unique_identifier) FROM oqc_contract;"));
        $max_unique_identifier = $result["MAX(unique_identifier)"];
        $this->_local_entity->unique_identifier = $max_unique_identifier + 1;
        
        $status = constant('MnoSoaBaseEntity::STATUS_NEW_ID');
      }
    } else {
      // Unknown invoice type
      return constant('MnoSoaBaseEntity::STATUS_ERROR');
    }

    // Map invoice attributes
    $this->_local_entity->name = $this->pull_set_or_delete_value($this->_title);
    $this->_local_entity->svnumber = $this->pull_set_or_delete_value($this->_transaction_number);
    if($this->_transaction_date) { $this->_local_entity->startdate = date('Y-m-d', $this->_transaction_date); }
    if($this->_due_date) { $this->_local_entity->enddate = date('Y-m-d', $this->_due_date); }
    
    // Map status
    if($this->_status == 'SUBMITTED') {
      $this->_local_entity->column_fields['invoicestatus'] = 'Sent';
    } else if($this->_status == 'AUTHORISED') {
      $this->_local_entity->column_fields['invoicestatus'] = 'Accepted';
    } else if($this->_status == 'PAID') {
      $this->_local_entity->column_fields['invoicestatus'] = 'Accepted';
    } else {
      $this->_local_entity->column_fields['invoicestatus'] = 'Draft';
    }

    // Map local organization
    if($this->_organization_id) {
      $local_id = $this->getLocalIdByMnoIdName($this->_organization_id, "organizations");
      if ($this->isValidIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " organization local_id = " . json_encode($local_id));
        $this->_local_entity->company_id = $local_id->_id;
      } else {
        // Fetch remote Organization if missing
        $notification->entity = "organizations";
        $notification->id = $this->_organization_id;
        $organization = new MnoSoaOrganization($this->_db);   
        $status = $organization->receiveNotification($notification);
        if ($status) {
          $this->_local_entity->company_id = $organization->_local_entity->id;
        }
      }
    }

    // Map local contact
    if($this->_person_id) {
      $local_id = $this->getLocalIdByMnoIdName($this->_person_id, "persons");
      if ($this->isValidIdentifier($local_id)) {
        $this->_log->debug(__FUNCTION__ . " person local_id = " . json_encode($local_id));
        $this->_local_entity->clientcontact_id = $local_id->_id;
        $this->_local_entity->clienttechnicalcontact_id = $local_id->_id;
      } else {
        // Fetch remote person if missing
        $notification->entity = "persons";
        $notification->id = $this->_person_id;
        $person = new MnoSoaPerson($this->_db);   
        $status = $person->receiveNotification($notification);
        if ($status) {
          $this->_local_entity->clientcontact_id = $person->_local_entity->id;
          $this->_local_entity->clienttechnicalcontact_id = $person->_local_entity->id;
        }
      }
    }

    // Total amount
    $this->_local_entity->total_cost = $this->_amount->netAmount;
    $this->_local_entity->grand_total_vat = $this->_amount->taxAmount;
    $this->_local_entity->grand_total = $this->_amount->price;

    return $status;
  }

  protected function saveLocalEntity($push_to_maestrano, $status) {
    $this->_log->debug("start saveLocalEntity status=$status " . json_encode($this->_local_entity->column_fields));
    $this->_local_entity->save(false);

    // Map invoice ID
    if ($status == constant('MnoSoaBaseEntity::STATUS_NEW_ID')) {
      $local_entity_id = $this->getLocalEntityIdentifier();
      $mno_entity_id = $this->_id;
      $this->addIdMapEntry($local_entity_id, $mno_entity_id);
    }

    $this->mapInvoiceLines();
  }

  protected function mapInvoiceLines() {
    $local_invoice_id = $this->getLocalEntityIdentifier();
    $mno_entity_id = $this->_id;
    $servicesTableName = 'oqc_service';

    // Map invoice lines
    if(!empty($this->_invoice_lines)) {
      foreach($this->_invoice_lines as $line_id => $line) {
        // Map item
        if(!empty($line->item)) {
          $local_item_id = $this->getLocalIdByMnoIdName($line->item->id, "ITEMS");
        }

        $product_id = $local_item_id->_id;
        $unit_price = floatval($line->unitPrice->netAmount);
        $quantity = floatval($line->quantity);
        $description = trim($line->description);
        $discount = floatval($line->reductionPercent);
        $line_number = intval($line->lineNumber);

        $tax = 0;
        $unit = 'pieces';
        $recurrence = 'once';
        $discount_type = 'rel';
        $currency = -99;

        // Fetch existing invoice line
        $mno_invoice_line_id = $this->_id . "#" . $line_id;
        $invoice_line_id_map = $this->getLocalIdByMnoIdName($mno_invoice_line_id, "INVOICE_LINE");
        if ($this->isValidIdentifier($invoice_line_id_map)) {
          // Fetch existing service
          $invoice_line_local_id = $invoice_line_id_map->_id;
          $service = new oqc_Service();
          $service->retrieve($invoice_line_local_id);

          // Udpate and save service
          $service->description = (null == $description) ? '' : $description;
          $service->product_id = (null == $product_id) ? '' : $product_id;
          $service->quantity = (null == $quantity) ? 1 : $quantity;
          $service->price = (null == $unit_price) ? 0.0 : $unit_price;
          $service->name = (null == $description) ? '' : $description;
          $service->vat = (true == $tax) ? true : false;
          $service->zeitbezug = (null == $recurrence) ? 'once' : $recurrence;
          $service->unit = (null == $unit) ? 'pieces' : $unit;
          $service->discount_value = $discount;
          $service->discount_select = $discount_type;
          $service->position = $line_number;
          $service->service_currency_id = $currency;
          $service->save();
        } else {
          // Create new service
          $service = new oqc_Service($product_id, $unit_price, $quantity, $description, $description, $tax, $recurrence, $unit, $discount, $discount_type, $line_number, $currency);
          $service->save();
          $this->_local_entity->$servicesTableName->add($service->id);
          // Map invoice line ID
          $this->_mno_soa_db_interface->addIdMapEntry($service->id, "INVOICE_LINE", $mno_invoice_line_id, "INVOICE_LINE");
        }
      }
    }
  }

  public function getLocalEntityIdentifier() {
    return $this->_local_entity->id;
  }
}

?>