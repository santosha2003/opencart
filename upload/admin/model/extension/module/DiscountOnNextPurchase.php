<?php
class ModelExtensionModuleDiscountOnNextPurchase extends Model {
	public function getAllOrderStatuses($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "order_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'";

			$sql .= " ORDER BY name";	

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}	

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$order_status_data = $this->cache->get('order_status.' . (int)$this->config->get('config_language_id'));

			if (!$order_status_data) {
				$query = $this->db->query("SELECT order_status_id, name FROM " . DB_PREFIX . "order_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY name");

				$order_status_data = $query->rows;

				$this->cache->set('order_status.' . (int)$this->config->get('config_language_id'), $order_status_data);
			}	

			return $order_status_data;				
		}
	}
	
	private function logCoupon($coupon_id, $couponCode, $order_id)  {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "discountonnextpurchase_coupon` 
							SET
						 	coupon_id='". $coupon_id ."',
						 	code='".$couponCode."',
						 	order_id='" .(int)$order_id . "'");   
	}

	public function getOriginCoupons() {
		$originCoupons = $this->db->query("SELECT * FROM `".DB_PREFIX."coupon` 
										WHERE coupon_id NOT IN (SELECT coupon_id 
										FROM `" . DB_PREFIX."discountonnextpurchase_coupon`) ");
		return $originCoupons->rows;
	}

	public function getGivenCoupons($data=array()) {
		$givenCoupons = $this->db->query("SELECT *
		 								  FROM `" . DB_PREFIX . "discountonnextpurchase_coupon` AS dc 
										  JOIN `" . DB_PREFIX . "coupon` AS oc ON dc.coupon_id=oc.coupon_id
										  JOIN `" . DB_PREFIX . "order` AS ord ON dc.order_id=ord.order_id
										  ORDER BY " . $data['sort'] . "  ". $data['order'] . " 
										  LIMIT " . $data['start'].", " . $data['limit'] );
										 
		return $givenCoupons->rows;
	}
	
	public function getSentCoupons() {
		$sentCoupons = $this->db->query("SELECT dc.order_id
		 								  FROM `" . DB_PREFIX . "discountonnextpurchase_coupon` AS dc 
										  JOIN `" . DB_PREFIX . "coupon` AS oc ON dc.coupon_id=oc.coupon_id
										  JOIN `" . DB_PREFIX . "order` AS ord ON dc.order_id=ord.order_id");
										 

		return $sentCoupons->rows;
	}
	
	public function getTotalGivenCoupons() {
		
		$givenCoupons = $this->db->query("SELECT COUNT(*) as count FROM `" . DB_PREFIX . "discountonnextpurchase_coupon` as dc
											JOIN `" . DB_PREFIX . "coupon` AS oc ON dc.coupon_id=oc.coupon_id"); 
		return $givenCoupons->row['count'];
	}
	
	public function getUsedCoupons($data=array()) { 
		
		$usedCoupons = $this->db->query("SELECT *
		 								  FROM `" . DB_PREFIX . "discountonnextpurchase_coupon` AS dc 
										  JOIN `" . DB_PREFIX . "coupon` AS oc ON dc.coupon_id=oc.coupon_id
										  JOIN `" . DB_PREFIX . "order` AS ord ON dc.order_id=ord.order_id
										  JOIN `" . DB_PREFIX . "coupon_history` AS ch ON dc.coupon_id=ch.coupon_id
										  ORDER BY " . $data['sort'] . " ". $data['order'] . " 
										  LIMIT " . $data['start'].", " . $data['limit'] );
		return $usedCoupons->rows;
	}
	
	public function getTotalUsedCoupons() {
		
		$givenCoupons = $this->db->query("SELECT COUNT(*) as count FROM `" . DB_PREFIX . "discountonnextpurchase_coupon` as dc
											JOIN `" . DB_PREFIX . "coupon_history` AS ch ON dc.coupon_id=ch.coupon_id"); 
		return $givenCoupons->row['count'];
	}
	
	public function install(){
		$this->db->query(
			"CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "discountonnextpurchase_coupon` (
			`coupon_id` INT(11) NULL DEFAULT NULL,
			`code` VARCHAR(10) NULL DEFAULT NULL,
			`order_id` INT(11) NULL DEFAULT NULL)
			COLLATE='utf8_general_ci'
			ENGINE=MyISAM"
			);
		$this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=1 WHERE `name` LIKE'%DiscountOnNextPurchase by iSenseLabs%'"); 
 		$modifications = $this->load->controller('extension/modification/refresh');
	}

	public function uninstall(){
		$this->db->query("DELETE FROM `" . DB_PREFIX . "coupon` WHERE coupon_id IN (SELECT coupon_id FROM `" . DB_PREFIX . "discountonnextpurchase_coupon`) ");
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "discountonnextpurchase_coupon`");
		
		$this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=0 WHERE `name` LIKE'%DiscountOnNextPurchase by iSenseLabs%'"); 
 		$modifications = $this->load->controller('extension/modification/refresh');
	}
	
	public function isUniqueCode($randomCode) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon` WHERE code='" . $this->db->escape($randomCode) . "'");
		if($query->num_rows == 0) {
			return true;
		} else {
			return false;
		}	
	}

	public function generateUniqueRandomVoucherCode() {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$couponCode = '';
		for ($i = 0; $i < 10; $i++) {	
			$couponCode .= $characters[rand(0, strlen($characters) - 1)]; 
		} 
		if($this->isUniqueCode($couponCode)) {	
			return $couponCode; 
		} else {	
			return $this->generateUniqueRandomVoucherCode();
		};
	}

	public function addCoupon($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "coupon SET name = '" . $this->db->escape($data['name']) . "', code = '" . $this->db->escape($data['code']) . "', discount = '" . (float)$data['discount'] . "', type = '" . $this->db->escape($data['type']) . "', total = '" . (float)$data['total'] . "', logged = '" . (int)$data['logged'] . "', shipping = '" . (int)$data['shipping'] . "', date_start = '" . $this->db->escape($data['date_start']) . "', date_end = '" . $this->db->escape($data['date_end']) . "', uses_total = '" . (int)$data['uses_total'] . "', uses_customer = '" . (int)$data['uses_customer'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$coupon_id = $this->db->getLastId();

		if (isset($data['coupon_product'])) {
			foreach ($data['coupon_product'] as $product_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "coupon_product SET coupon_id = '" . (int)$coupon_id . "', product_id = '" . (int)$product_id . "'");
			}
		}

		if (isset($data['coupon_category'])) {
			foreach ($data['coupon_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "coupon_category SET coupon_id = '" . (int)$coupon_id . "', category_id = '" . (int)$category_id . "'");
			}
		}	
		return $coupon_id;	
	}
} 
?>