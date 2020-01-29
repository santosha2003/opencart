<?php

class ControllerExtensionModuleDiscountonnextpurchase extends Controller {

	/* Event handlers */
	public function CatalogModelCheckoutOrderAddOrderHistoryAfter(&$route, &$args, &$output) {
		$order_id = $args[0];
		$order_status_id = $args[1];
		$order_info = $this->model_checkout_order->getOrder($order_id); // model should be already loaded, since we've hooked the event to its method call
		$this->load->config('isenselabs/discountonnextpurchase');
		$this->load->model($this->config->get('discountonnextpurchase_path'));
		$this->load->model('setting/setting');
		$this->{$this->config->get('discountonnextpurchase_model')}->sendDiscountCouponByMail($order_id, $order_status_id);
		$DiscountOnNextPurchaseSetting = $this->model_setting_setting->getSetting('DiscountOnNextPurchase');
		$DiscountOnNextPurchaseSetting = $DiscountOnNextPurchaseSetting['DiscountOnNextPurchase'];

		if($DiscountOnNextPurchaseSetting['Enabled']=='yes') {
			$coupon_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_id . "' AND code = 'coupon' ORDER BY sort_order ASC");
			$this->load->model('extension/total/coupon');
			if (method_exists($this->model_extension_total_coupon, 'confirm')) {  
				foreach ($coupon_query->rows as $order_total) {
					$this->model_extension_total_coupon->confirm($order_info, $order_total);
				}
			}
		} 
	}

	public function CatalogControllerControllerCheckoutSuccessBefore(&$route, &$args) {
		if (isset($this->session->data['order_id'])) {
			$this->load->config('isenselabs/discountonnextpurchase');
			$this->load->model($this->config->get('discountonnextpurchase_path'));
			$this->load->model('checkout/order');
			$dONP = $this->model_checkout_order->getOrder($this->session->data['order_id']);
			$this->{$this->config->get('discountonnextpurchase_model')}->sendDiscountCouponByMail($dONP['order_id'], $dONP['order_status_id']);
		}
	}
}