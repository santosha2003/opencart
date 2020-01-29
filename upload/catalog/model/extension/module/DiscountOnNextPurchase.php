<?php
class ModelExtensionModuleDiscountOnNextPurchase extends Model {
	public function sendDiscountCouponByMail($order_id, $new_order_status_id) {
		$this->load->model('checkout/order');
		$this->load->model('setting/setting');
		
		$setting = $this->model_setting_setting->getSetting('DiscountOnNextPurchase');
		$setting = $setting['DiscountOnNextPurchase'];
		$discounts = (!empty($setting['Discount'])) ? $setting['Discount'] : array();
		
		foreach ($discounts as $key => $row)
			{
				$sort_name[$key] = $row['order_total'];
			}
			array_multisort($sort_name, SORT_DESC, $discounts);
			//echo '<pre>';
			//var_dump($discounts);exit;
		if($setting['Enabled']=='yes' ) {
			foreach($discounts as $discount){
				$sent_discounts = $this->db->query("SELECT * FROM " . DB_PREFIX . "discountonnextpurchase_coupon WHERE order_id = '" . (int)$order_id . "'")->num_rows;
				if($discount['Enabled'] == 'yes' && $sent_discounts < 1){
					$order = $this->model_checkout_order->getOrder($order_id);
				
					if(empty($discount['coupon_product'])) {
						$discount['coupon_product'] = NULL;
					}
					if(empty($discount['coupon_category'])) {
						$discount['coupon_category'] = NULL;
					}
					
					if($new_order_status_id == $discount['order_status_id'] && $order['total']>=$discount['order_total']) {
														
						$couponCode  = $this->generateUniqueRandomVoucherCode();
						$couponInfo = array(
							'name' => 'DiscountOnNextPurchase [' . $order['email'] . ']',
							'code' => $couponCode,
							'discount' => (int)$discount['discount'],
							'type' => $discount['discount_type'],
							'total' => $discount['total_amount'],
							'logged' => $discount['customer_login'],
							'shipping' => '0',
							'date_start' => date('Y-m-d', time()),
							'date_end' => date('Y-m-d', time() + $discount['days_after'] * 24 * 60 * 60),
							'uses_total' => '1',
							'uses_customer' => '1',
							'status' => '1',
							'coupon_product' => $discount['coupon_product'],
							'coupon_category' => $discount['coupon_category']
						); 
						
						$coupon_id = $this->addCoupon($couponInfo); 
		
						$this->logCoupon($coupon_id, $couponCode, $order_id);			
									
						$messageToCustomer = html_entity_decode($discount['message'][$order['language_id']], ENT_QUOTES, 'UTF-8');
						$wordTemplates = array("{firstname}", "{lastname}", "{coupon_code}","{start_date}","{end_date}");
						$words   = array($order['firstname'], $order['lastname'], $couponCode, date('d.m.Y', strtotime($couponInfo['date_start'])), date('d.m.Y', strtotime($couponInfo['date_end'])));					
						$messageToCustomer = str_replace($wordTemplates, $words, $messageToCustomer);
						
						$mailToUser = new \vendor\isenselabs\discountonnextpurchase\DNPMail($this->config->get('config_mail_engine'));
						$mailToUser->protocol = $this->config->get('config_mail_protocol');
						$mailToUser->parameter = $this->config->get('config_mail_parameter');
						$mailToUser->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
						$mailToUser->smtp_username = $this->config->get('config_mail_smtp_username');
						$mailToUser->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
						$mailToUser->smtp_port = $this->config->get('config_mail_smtp_port');
						$mailToUser->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
						
						$mailToUser->setTo($order['email']);
						$mailToUser->setFrom($this->config->get('config_email'));
						if($setting['admin_notification'] == 'yes') { 
							$mailToUser->setBcc($this->config->get('config_email'));
						}
						$mailToUser->setSender($order['store_name']);
						$mailToUser->setSubject(html_entity_decode($discount['subject'][$order['language_id']], ENT_QUOTES, 'UTF-8'));
						$mailToUser->setHtml($messageToCustomer);						
						$mailToUser->send();
					}
				}
			}
		}
	}

	private function logCoupon($coupon_id, $couponCode, $order_id)  {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "discountonnextpurchase_coupon` 
							SET
						 	coupon_id='". $coupon_id ."',
						 	code='".$couponCode."',
						 	order_id='" .(int)$order_id . "'");   
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