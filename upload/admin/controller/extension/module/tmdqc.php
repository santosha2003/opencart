<?php
class ControllerExtensionModuleTmdqc extends Controller {
	private $error = array();
	
	public function index() {
		$this->load->language('extension/module/tmdqc');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		$this->load->model('tool/image');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_setting_setting->editSetting('tmdqc', $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['token'] = $this->session->data['token'];

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_guest'] = $this->language->get('text_guest');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		
		
		
		
		
		//Tab
		$data['tab_layout'] = $this->language->get('tab_layout');
		$data['tab_cart'] = $this->language->get('tab_cart');
		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_register'] = $this->language->get('tab_register');
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_bill_address'] = $this->language->get('tab_bill_address');
		$data['tab_delivery_address'] = $this->language->get('tab_delivery_address');
		$data['tab_guest'] = $this->language->get('tab_guest');
		$data['tab_shipping'] = $this->language->get('tab_shipping');
		$data['tab_payment'] = $this->language->get('tab_payment');
		$data['tab_custom'] = $this->language->get('tab_custom');
		$data['tab_google_tracking'] = $this->language->get('tab_google_tracking');
		$data['tab_color_picker'] = $this->language->get('tab_color_picker');
		$data['tab_title'] = $this->language->get('tab_title');
		$data['tab_link'] = $this->language->get('tab_link');
		
		
		
		

		
		$data['entry_default_select'] = $this->language->get('entry_default_select');
		$data['entry_shipping_label'] = $this->language->get('entry_shipping_label');
		$data['entry_payment_label'] = $this->language->get('entry_payment_label');
		$data['entry_payment_comment'] = $this->language->get('entry_payment_comment');
		$data['entry_shipping_comment'] = $this->language->get('entry_shipping_comment');
		$data['entry_account'] = $this->language->get('entry_account');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_checkout'] = $this->language->get('entry_checkout');
		$data['entry_google_tracking'] = $this->language->get('entry_google_tracking');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_login'] = $this->language->get('entry_login');
		$data['entry_register'] = $this->language->get('entry_register');
		$data['entry_paymeny_a'] = $this->language->get('entry_paymeny_a');
		$data['entry_shipping_a'] = $this->language->get('entry_shipping_a');
		$data['entry_shipping_m']= $this->language->get('entry_shipping_m');
		$data['entry_payment_a'] = $this->language->get('entry_payment_a');
		$data['entry_image'] 		 = $this->language->get('entry_image');
		$data['entry_name'] 		 = $this->language->get('entry_name');
		$data['entry_model'] 		 = $this->language->get('entry_model');
		$data['entry_isbn'] 		 = $this->language->get('entry_isbn');
		$data['entry_qty'] 			 = $this->language->get('entry_qty');
		$data['entry_ean'] 			 = $this->language->get('entry_ean');
		$data['entry_upc']       = $this->language->get('entry_upc');
		$data['entry_unit_price']= $this->language->get('entry_unit_price');
		$data['entry_total']     = $this->language->get('entry_total');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname']  = $this->language->get('entry_lastname');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_cpassword'] = $this->language->get('entry_cpassword');
		$data['entry_fax'] 		   = $this->language->get('entry_fax');
		$data['entry_company']   = $this->language->get('entry_company');
		$data['entry_address1']  = $this->language->get('entry_address1');
		$data['entry_address2']  = $this->language->get('entry_address2');
		$data['entry_city'] 		 = $this->language->get('entry_city');
		$data['entry_postal_code'] = $this->language->get('entry_postal_code');
		$data['entry_country'] 	= $this->language->get('entry_country');
		$data['entry_state'] = $this->language->get('entry_state');
		$data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_guest'] = $this->language->get('entry_guest');
		$data['entry_label'] = $this->language->get('entry_label');
		$data['entry_required'] = $this->language->get('entry_required');
		$data['entry_delivery_address_status'] = $this->language->get('entry_delivery_address_status');
		$data['entry_bill_address_status'] = $this->language->get('entry_bill_address_status');
		$data['entry_coupan'] = $this->language->get('entry_coupan');
		$data['entry_gift'] = $this->language->get('entry_gift');
		$data['entry_taxess'] = $this->language->get('entry_taxess');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_icon'] = $this->language->get('entry_icon');
		$data['entry_account_option'] = $this->language->get('entry_account_option');
		
		
		
		///Help
		$data['help_image'] = $this->language->get('help_image');
		$data['help_name'] = $this->language->get('help_name');
		$data['help_model'] = $this->language->get('help_model');
		$data['help_isbn'] = $this->language->get('help_isbn');
		$data['help_qty'] = $this->language->get('help_qty');
		$data['help_ean'] = $this->language->get('help_ean');
		$data['help_upc'] = $this->language->get('help_upc');
		$data['help_unitprice'] = $this->language->get('help_unitprice');
		$data['help_total'] = $this->language->get('help_total');
		$data['help_firstname'] = $this->language->get('help_firstname');
		$data['help_lastname'] = $this->language->get('help_lastname');
		$data['help_telephone'] = $this->language->get('help_telephone');
		$data['help_password'] = $this->language->get('help_password');
		$data['help_cpassword'] = $this->language->get('help_cpassword');
		$data['help_fax'] = $this->language->get('help_fax');
		$data['help_company'] = $this->language->get('help_company');
		$data['help_address1'] = $this->language->get('help_address1');
		$data['help_address2'] = $this->language->get('help_address2');
		$data['help_city'] = $this->language->get('help_city');
		$data['help_posta_code'] = $this->language->get('help_posta_code');
		$data['help_country'] = $this->language->get('help_country');
		$data['help_state'] = $this->language->get('help_state');
		$data['help_newsletter'] = $this->language->get('help_newsletter');
		$data['help_country_default'] = $this->language->get('help_country_default');
		$data['help_zone_default'] = $this->language->get('help_zone_default');
		$data['help_guest'] = $this->language->get('help_guest');
		$data['help_deliveryaddress'] = $this->language->get('help_deliveryaddress');
		$data['help_billaddress'] = $this->language->get('help_billaddress');
		$data['help_coupan'] = $this->language->get('help_coupan');
		$data['help_gift'] = $this->language->get('help_gift');
		$data['help_taxess'] = $this->language->get('help_taxess');
		$data['help_email'] = $this->language->get('help_email');
		$data['help_account_option'] = $this->language->get('help_account_option');
		$data['help_account'] = $this->language->get('help_account');
		$data['help_chkout'] = $this->language->get('help_chkout');
		$data['entry_logintextcolor'] = $this->language->get('entry_logintextcolor');
		$data['entry_afterlogincustomer'] = $this->language->get('entry_afterlogincustomer');
		$data['entry_selectaddress'] = $this->language->get('entry_selectaddress');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_install_setting'] = $this->language->get('button_install_setting');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/tmdqc', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('extension/module/tmdqc', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		$data['install_setting'] = $this->url->link('extension/module/tmdqc/installsetting', 'token=' . $this->session->data['token'], 'SSL');
		
		if(!$this->config->has('tmdqc_status')) {
			$data['install_setting_permission'] = true;
		}else{
			$data['install_setting_permission'] = false;
		}

		
		//Layout
		if(isset($this->request->post['tmdqc_layout_description'])){
			$data['tmdqc_layout_description'] = $this->request->post['tmdqc_layout_description'];
		}else{
			$data['tmdqc_layout_description'] = $this->config->get('tmdqc_layout_description');
		}
		
		///Cart Page Setting
		if(isset($this->request->post['tmdqc_cart_image_status'])){
			$data['tmdqc_cart_image_status'] = $this->request->post['tmdqc_cart_image_status'];
		}else{
			$data['tmdqc_cart_image_status'] = $this->config->get('tmdqc_cart_image_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_name_status'])){
			$data['tmdqc_cart_name_status'] = $this->request->post['tmdqc_cart_name_status'];
		}else{
			$data['tmdqc_cart_name_status'] = $this->config->get('tmdqc_cart_name_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_model_status'])){
			$data['tmdqc_cart_model_status'] = $this->request->post['tmdqc_cart_model_status'];
		}else{
			$data['tmdqc_cart_model_status'] = $this->config->get('tmdqc_cart_model_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_isbn_status'])){
			$data['tmdqc_cart_isbn_status'] = $this->request->post['tmdqc_cart_isbn_status'];
		}else{
			$data['tmdqc_cart_isbn_status'] = $this->config->get('tmdqc_cart_isbn_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_qty_status'])){
			$data['tmdqc_cart_qty_status'] = $this->request->post['tmdqc_cart_qty_status'];
		}else{
			$data['tmdqc_cart_qty_status'] = $this->config->get('tmdqc_cart_qty_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_ean_status'])){
			$data['tmdqc_cart_ean_status'] = $this->request->post['tmdqc_cart_ean_status'];
		}else{
			$data['tmdqc_cart_ean_status'] = $this->config->get('tmdqc_cart_ean_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_upc_status'])){
			$data['tmdqc_cart_upc_status'] = $this->request->post['tmdqc_cart_upc_status'];
		}else{
			$data['tmdqc_cart_upc_status'] = $this->config->get('tmdqc_cart_upc_status');
		}

		if(isset($this->request->post['tmdqc_cart_unitprice_status'])){
			$data['tmdqc_cart_unitprice_status'] = $this->request->post['tmdqc_cart_unitprice_status'];
		}else{
			$data['tmdqc_cart_unitprice_status'] = $this->config->get('tmdqc_cart_unitprice_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_total_status'])){
			$data['tmdqc_cart_total_status'] = $this->request->post['tmdqc_cart_total_status'];
		}else{
			$data['tmdqc_cart_total_status'] = $this->config->get('tmdqc_cart_total_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_coupan_status'])){
			$data['tmdqc_cart_coupan_status'] = $this->request->post['tmdqc_cart_coupan_status'];
		}else{
			$data['tmdqc_cart_coupan_status'] = $this->config->get('tmdqc_cart_coupan_status');
		}

		if(isset($this->request->post['tmdqc_cart_gift_status'])){
			$data['tmdqc_cart_gift_status'] = $this->request->post['tmdqc_cart_gift_status'];
		}else{
			$data['tmdqc_cart_gift_status'] = $this->config->get('tmdqc_cart_gift_status');
		}
		
		if(isset($this->request->post['tmdqc_cart_reward_status'])){
			$data['tmdqc_cart_reward_status'] = $this->request->post['tmdqc_cart_reward_status'];
		}else{
			$data['tmdqc_cart_reward_status'] = $this->config->get('tmdqc_cart_reward_status');
		}
		
		
		
		
		
		///Register Page Setting
		$this->load->model('localisation/language');
	  $data['languages'] = $this->model_localisation_language->getLanguages();
		
		if(isset($this->request->post['tmdqc_register_firstname'])){
			$data['tmdqc_register_firstname'] = $this->request->post['tmdqc_register_firstname'];
		}elseif($this->config->has('tmdqc_register_firstname')){
			$data['tmdqc_register_firstname'] = $this->config->get('tmdqc_register_firstname');
		}else{
			$data['tmdqc_register_firstname'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_lastname'])){
			$data['tmdqc_register_lastname'] = $this->request->post['tmdqc_register_firstname'];
		}elseif($this->config->has('tmdqc_register_lastname')){
			$data['tmdqc_register_lastname'] = $this->config->get('tmdqc_register_lastname');
		}else{
			$data['tmdqc_register_lastname'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_email'])){
			$data['tmdqc_register_email'] = $this->request->post['tmdqc_register_email'];
		}elseif($this->config->has('tmdqc_register_email')){
			$data['tmdqc_register_email'] = $this->config->get('tmdqc_register_email');
		}else{
			$data['tmdqc_register_email'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_telephone'])){
			$data['tmdqc_register_telephone'] = $this->request->post['tmdqc_register_telephone'];
		}elseif($this->config->has('tmdqc_register_telephone')){
			$data['tmdqc_register_telephone'] = $this->config->get('tmdqc_register_telephone');
		}else{
			$data['tmdqc_register_telephone'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_password'])){
			$data['tmdqc_register_password'] = $this->request->post['tmdqc_register_password'];
		}elseif($this->config->has('tmdqc_register_password')){
			$data['tmdqc_register_password'] = $this->config->get('tmdqc_register_password');
		}else{
			$data['tmdqc_register_password'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_cpassword'])){
			$data['tmdqc_register_cpassword'] = $this->request->post['tmdqc_register_cpassword'];
		}elseif($this->config->has('tmdqc_register_cpassword')){
			$data['tmdqc_register_cpassword'] = $this->config->get('tmdqc_register_cpassword');
		}else{
			$data['tmdqc_register_cpassword'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_fax'])){
			$data['tmdqc_register_fax'] = $this->request->post['tmdqc_register_fax'];
		}elseif($this->config->has('tmdqc_register_fax')){
			$data['tmdqc_register_fax'] = $this->config->get('tmdqc_register_fax');
		}else{
			$data['tmdqc_register_fax'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_company'])){
			$data['tmdqc_register_company'] = $this->request->post['tmdqc_register_company'];
		}elseif($this->config->has('tmdqc_register_company')){
			$data['tmdqc_register_company'] = $this->config->get('tmdqc_register_company');
		}else{
			$data['tmdqc_register_company'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_address1'])){
			$data['tmdqc_register_address1'] = $this->request->post['tmdqc_register_address1'];
		}elseif($this->config->has('tmdqc_register_address1')){
			$data['tmdqc_register_address1'] = $this->config->get('tmdqc_register_address1');
		}else{
			$data['tmdqc_register_address1'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_address2'])){
			$data['tmdqc_register_address2'] = $this->request->post['tmdqc_register_address2'];
		}elseif($this->config->has('tmdqc_register_address2')){
			$data['tmdqc_register_address2'] = $this->config->get('tmdqc_register_address2');
		}else{
			$data['tmdqc_register_address2'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_city'])){
			$data['tmdqc_register_city'] = $this->request->post['tmdqc_register_city'];
		}elseif($this->config->has('tmdqc_register_city')){
			$data['tmdqc_register_city'] = $this->config->get('tmdqc_register_city');
		}else{
			$data['tmdqc_register_city'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_postal_code'])){
			$data['tmdqc_register_postal_code'] = $this->request->post['tmdqc_register_postal_code'];
		}elseif($this->config->has('tmdqc_register_postal_code')){
			$data['tmdqc_register_postal_code'] = $this->config->get('tmdqc_register_postal_code');
		}else{
			$data['tmdqc_register_postal_code'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_country'])){
			$data['tmdqc_register_country'] = $this->request->post['tmdqc_register_country'];
		}elseif($this->config->has('tmdqc_register_country')){
			$data['tmdqc_register_country'] = $this->config->get('tmdqc_register_country');
		}else{
			$data['tmdqc_register_country'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_state'])){
			$data['tmdqc_register_state'] = $this->request->post['tmdqc_register_state'];
		}elseif($this->config->has('tmdqc_register_state')){
			$data['tmdqc_register_state'] = $this->config->get('tmdqc_register_state');
		}else{
			$data['tmdqc_register_state'] = array();
		}
		
		if(isset($this->request->post['tmdqc_register_newsletter'])){
			$data['tmdqc_register_newsletter'] = $this->request->post['tmdqc_register_newsletter'];
		}elseif($this->config->has('tmdqc_register_newsletter')){
			$data['tmdqc_register_newsletter'] = $this->config->get('tmdqc_register_newsletter');
		}else{
			$data['tmdqc_register_newsletter'] = array();
		}
		
		///Guest
		
		
		if(isset($this->request->post['tmdqc_guest_firstname'])){
			$data['tmdqc_guest_firstname'] = $this->request->post['tmdqc_guest_firstname'];
		}elseif($this->config->has('tmdqc_guest_firstname')){
			$data['tmdqc_guest_firstname'] = $this->config->get('tmdqc_guest_firstname');
		}else{
			$data['tmdqc_guest_firstname'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_lastname'])){
			$data['tmdqc_guest_lastname'] = $this->request->post['tmdqc_guest_firstname'];
		}elseif($this->config->has('tmdqc_guest_lastname')){
			$data['tmdqc_guest_lastname'] = $this->config->get('tmdqc_guest_lastname');
		}else{
			$data['tmdqc_guest_lastname'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_email'])){
			$data['tmdqc_guest_email'] = $this->request->post['tmdqc_guest_email'];
		}elseif($this->config->has('tmdqc_guest_email')){
			$data['tmdqc_guest_email'] = $this->config->get('tmdqc_guest_email');
		}else{
			$data['tmdqc_guest_email'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_telephone'])){
			$data['tmdqc_guest_telephone'] = $this->request->post['tmdqc_guest_telephone'];
		}elseif($this->config->has('tmdqc_guest_telephone')){
			$data['tmdqc_guest_telephone'] = $this->config->get('tmdqc_guest_telephone');
		}else{
			$data['tmdqc_guest_telephone'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_fax'])){
			$data['tmdqc_guest_fax'] = $this->request->post['tmdqc_guest_fax'];
		}elseif($this->config->has('tmdqc_guest_fax')){
			$data['tmdqc_guest_fax'] = $this->config->get('tmdqc_guest_fax');
		}else{
			$data['tmdqc_guest_fax'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_company'])){
			$data['tmdqc_guest_company'] = $this->request->post['tmdqc_guest_company'];
		}elseif($this->config->has('tmdqc_guest_company')){
			$data['tmdqc_guest_company'] = $this->config->get('tmdqc_guest_company');
		}else{
			$data['tmdqc_guest_company'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_address1'])){
			$data['tmdqc_guest_address1'] = $this->request->post['tmdqc_guest_address1'];
		}elseif($this->config->has('tmdqc_guest_address1')){
			$data['tmdqc_guest_address1'] = $this->config->get('tmdqc_guest_address1');
		}else{
			$data['tmdqc_guest_address1'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_address2'])){
			$data['tmdqc_guest_address2'] = $this->request->post['tmdqc_guest_address2'];
		}elseif($this->config->has('tmdqc_guest_address2')){
			$data['tmdqc_guest_address2'] = $this->config->get('tmdqc_guest_address2');
		}else{
			$data['tmdqc_guest_address2'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_city'])){
			$data['tmdqc_guest_city'] = $this->request->post['tmdqc_guest_city'];
		}elseif($this->config->has('tmdqc_guest_city')){
			$data['tmdqc_guest_city'] = $this->config->get('tmdqc_guest_city');
		}else{
			$data['tmdqc_guest_city'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_postal_code'])){
			$data['tmdqc_guest_postal_code'] = $this->request->post['tmdqc_guest_postal_code'];
		}elseif($this->config->has('tmdqc_guest_postal_code')){
			$data['tmdqc_guest_postal_code'] = $this->config->get('tmdqc_guest_postal_code');
		}else{
			$data['tmdqc_guest_postal_code'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_country'])){
			$data['tmdqc_guest_country'] = $this->request->post['tmdqc_guest_country'];
		}elseif($this->config->has('tmdqc_guest_country')){
			$data['tmdqc_guest_country'] = $this->config->get('tmdqc_guest_country');
		}else{
			$data['tmdqc_guest_country'] = array();
		}
		
		if(isset($this->request->post['tmdqc_guest_state'])){
			$data['tmdqc_guest_state'] = $this->request->post['tmdqc_guest_state'];
		}elseif($this->config->has('tmdqc_guest_state')){
			$data['tmdqc_guest_state'] = $this->config->get('tmdqc_guest_state');
		}else{
			$data['tmdqc_guest_state'] = array();
		}
		

		
		////Bill Address
		if(isset($this->request->post['tmdqc_billaddress_firstname'])){
			$data['tmdqc_billaddress_firstname'] = $this->request->post['tmdqc_billaddress_firstname'];
		}elseif($this->config->has('tmdqc_billaddress_firstname')){
			$data['tmdqc_billaddress_firstname'] = $this->config->get('tmdqc_billaddress_firstname');
		}else{
			$data['tmdqc_billaddress_firstname'] = array();
		}

		if(isset($this->request->post['tmdqc_billaddress_lastname'])){
			$data['tmdqc_billaddress_lastname'] = $this->request->post['tmdqc_billaddress_lastname'];
		}elseif($this->config->has('tmdqc_billaddress_lastname')){
			$data['tmdqc_billaddress_lastname'] = $this->config->get('tmdqc_billaddress_lastname');
		}else{
			$data['tmdqc_billaddress_lastname'] = array();
		}
		
		if(isset($this->request->post['tmdqc_billaddress_company'])){
			$data['tmdqc_billaddress_company'] = $this->request->post['tmdqc_billaddress_company'];
		}elseif($this->config->has('tmdqc_billaddress_company')){
			$data['tmdqc_billaddress_company'] = $this->config->get('tmdqc_billaddress_company');
		}else{
			$data['tmdqc_billaddress_company'] = array();
		}
		
		if(isset($this->request->post['tmdqc_billaddress_address1'])){
			$data['tmdqc_billaddress_address1'] = $this->request->post['tmdqc_billaddress_address1'];
		}elseif($this->config->has('tmdqc_billaddress_address1')){
			$data['tmdqc_billaddress_address1'] = $this->config->get('tmdqc_billaddress_address1');
		}else{
			$data['tmdqc_billaddress_address1'] = array();
		}
		
		if(isset($this->request->post['tmdqc_billaddress_address2'])){
			$data['tmdqc_billaddress_address2'] = $this->request->post['tmdqc_billaddress_address2'];
		}elseif($this->config->has('tmdqc_billaddress_address2')){
			$data['tmdqc_billaddress_address2'] = $this->config->get('tmdqc_billaddress_address2');
		}else{
			$data['tmdqc_billaddress_address2'] = array();
		}
		
		if(isset($this->request->post['tmdqc_billaddress_city'])){
			$data['tmdqc_billaddress_city'] = $this->request->post['tmdqc_billaddress_city'];
		}elseif($this->config->has('tmdqc_billaddress_city')){
			$data['tmdqc_billaddress_city'] = $this->config->get('tmdqc_billaddress_city');
		}else{
			$data['tmdqc_billaddress_city'] = array();
		}

		if(isset($this->request->post['tmdqc_billaddress_postal_code'])){
			$data['tmdqc_billaddress_postal_code'] = $this->request->post['tmdqc_billaddress_postal_code'];
		}elseif($this->config->has('tmdqc_billaddress_postal_code')){
			$data['tmdqc_billaddress_postal_code'] = $this->config->get('tmdqc_billaddress_postal_code');
		}else{
			$data['tmdqc_billaddress_postal_code'] = array();
		}

		if(isset($this->request->post['tmdqc_billaddress_country'])){
			$data['tmdqc_billaddress_country'] = $this->request->post['tmdqc_billaddress_country'];
		}elseif($this->config->has('tmdqc_billaddress_country')){
			$data['tmdqc_billaddress_country'] = $this->config->get('tmdqc_billaddress_country');
		}else{
			$data['tmdqc_billaddress_country'] = array();
		}
		
		if(isset($this->request->post['tmdqc_billaddress_state'])){
			$data['tmdqc_billaddress_state'] = $this->request->post['tmdqc_billaddress_state'];
		}elseif($this->config->has('tmdqc_billaddress_state')){
			$data['tmdqc_billaddress_state'] = $this->config->get('tmdqc_billaddress_state');
		}else{
			$data['tmdqc_billaddress_state'] = array();
		}
		
	  ////Delivery Address
		if(isset($this->request->post['tmdqc_deliveryaddress_status'])){
			$data['tmdqc_deliveryaddress_status'] = $this->request->post['tmdqc_deliveryaddress_status'];
		}else{
			$data['tmdqc_deliveryaddress_status'] = $this->config->get('tmdqc_deliveryaddress_status');
		}
		
		if(isset($this->request->post['tmdqc_deliveryaddress_firstname'])){
			$data['tmdqc_deliveryaddress_firstname'] = $this->request->post['tmdqc_deliveryaddress_firstname'];
		}elseif($this->config->has('tmdqc_deliveryaddress_firstname')){
			$data['tmdqc_deliveryaddress_firstname'] = $this->config->get('tmdqc_deliveryaddress_firstname');
		}else{
			$data['tmdqc_deliveryaddress_firstname'] = array();
		}

		if(isset($this->request->post['tmdqc_deliveryaddress_lastname'])){
			$data['tmdqc_deliveryaddress_lastname'] = $this->request->post['tmdqc_deliveryaddress_lastname'];
		}elseif($this->config->has('tmdqc_deliveryaddress_lastname')){
			$data['tmdqc_deliveryaddress_lastname'] = $this->config->get('tmdqc_deliveryaddress_lastname');
		}else{
			$data['tmdqc_deliveryaddress_lastname'] = array();
		}
		
		if(isset($this->request->post['tmdqc_deliveryaddress_company'])){
			$data['tmdqc_deliveryaddress_company'] = $this->request->post['tmdqc_deliveryaddress_company'];
		}elseif($this->config->has('tmdqc_deliveryaddress_company')){
			$data['tmdqc_deliveryaddress_company'] = $this->config->get('tmdqc_deliveryaddress_company');
		}else{
			$data['tmdqc_deliveryaddress_company'] = array();
		}
		
		if(isset($this->request->post['tmdqc_deliveryaddress_address1'])){
			$data['tmdqc_deliveryaddress_address1'] = $this->request->post['tmdqc_deliveryaddress_address1'];
		}elseif($this->config->has('tmdqc_deliveryaddress_address1')){
			$data['tmdqc_deliveryaddress_address1'] = $this->config->get('tmdqc_deliveryaddress_address1');
		}else{
			$data['tmdqc_deliveryaddress_address1'] = array();
		}
		
		if(isset($this->request->post['tmdqc_deliveryaddress_address2'])){
			$data['tmdqc_deliveryaddress_address2'] = $this->request->post['tmdqc_deliveryaddress_address2'];
		}elseif($this->config->has('tmdqc_deliveryaddress_address2')){
			$data['tmdqc_deliveryaddress_address2'] = $this->config->get('tmdqc_deliveryaddress_address2');
		}else{
			$data['tmdqc_deliveryaddress_address2'] = array();
		}
		
		if(isset($this->request->post['tmdqc_deliveryaddress_city'])){
			$data['tmdqc_deliveryaddress_city'] = $this->request->post['tmdqc_deliveryaddress_city'];
		}elseif($this->config->has('tmdqc_deliveryaddress_city')){
			$data['tmdqc_deliveryaddress_city'] = $this->config->get('tmdqc_deliveryaddress_city');
		}else{
			$data['tmdqc_deliveryaddress_city'] = array();
		}

		if(isset($this->request->post['tmdqc_deliveryaddress_postal_code'])){
			$data['tmdqc_deliveryaddress_postal_code'] = $this->request->post['tmdqc_deliveryaddress_postal_code'];
		}elseif($this->config->has('tmdqc_deliveryaddress_postal_code')){
			$data['tmdqc_deliveryaddress_postal_code'] = $this->config->get('tmdqc_deliveryaddress_postal_code');
		}else{
			$data['tmdqc_deliveryaddress_postal_code'] = array();
		}

		if(isset($this->request->post['tmdqc_deliveryaddress_country'])){
			$data['tmdqc_deliveryaddress_country'] = $this->request->post['tmdqc_deliveryaddress_country'];
		}elseif($this->config->has('tmdqc_deliveryaddress_country')){
			$data['tmdqc_deliveryaddress_country'] = $this->config->get('tmdqc_deliveryaddress_country');
		}else{
			$data['tmdqc_deliveryaddress_country'] = array();
		}
		
		if(isset($this->request->post['tmdqc_deliveryaddress_state'])){
			$data['tmdqc_deliveryaddress_state'] = $this->request->post['tmdqc_deliveryaddress_state'];
		}elseif($this->config->has('tmdqc_deliveryaddress_state')){
			$data['tmdqc_deliveryaddress_state'] = $this->config->get('tmdqc_deliveryaddress_state');
		}else{
			$data['tmdqc_deliveryaddress_state'] = array();
		}
		
		//General Setting
		$this->load->model('localisation/country');
		$data['countries'] = $this->model_localisation_country->getCountries();
		
		if (isset($this->request->post['tmdqc_country_id'])) {
			$data['tmdqc_country_id'] = $this->request->post['tmdqc_country_id'];
		} else {
			$data['tmdqc_country_id'] = $this->config->get('tmdqc_country_id');
		}
		
		
		if (isset($this->request->post['tmdqc_zone_id'])) {
			$data['tmdqc_zone_id'] = $this->request->post['tmdqc_zone_id'];
		} else {
			$data['tmdqc_zone_id'] = $this->config->get('tmdqc_zone_id');
		}

		
		if (isset($this->request->post['tmdqc_payment_comment'])) {
			$data['tmdqc_payment_comment'] = $this->request->post['tmdqc_payment_comment'];
		} else {
			$data['tmdqc_payment_comment'] = $this->config->get('tmdqc_payment_comment');
		}
		
		if (isset($this->request->post['tmdqc_shipping_comment'])) {
			$data['tmdqc_shipping_comment'] = $this->request->post['tmdqc_shipping_comment'];
		} else {
			$data['tmdqc_shipping_comment'] = $this->config->get('tmdqc_shipping_comment');
		}
		
		if (isset($this->request->post['tmdqc_account_option'])) {
			$data['tmdqc_account_option'] = $this->request->post['tmdqc_account_option'];
		} else {
			$data['tmdqc_account_option'] = $this->config->get('tmdqc_account_option');
		}
		
		if (isset($this->request->post['tmdqc_account_id'])) {
			$data['tmdqc_account_id'] = $this->request->post['tmdqc_account_id'];
		} else {
			$data['tmdqc_account_id'] = $this->config->get('tmdqc_account_id');
		}
		
		if (isset($this->request->post['tmdqc_checkout_id'])) {
			$data['tmdqc_checkout_id'] = $this->request->post['tmdqc_checkout_id'];
		} else {
			$data['tmdqc_checkout_id'] = $this->config->get('tmdqc_checkout_id');
		}
		
		if (isset($this->request->post['tmdqc_customer_group_id'])) {
			$data['tmdqc_customer_group_id'] = $this->request->post['tmdqc_customer_group_id'];
		} else {
			$data['tmdqc_customer_group_id'] = $this->config->get('tmdqc_customer_group_id');
		}

		$this->load->model('catalog/information');

		$data['informations'] = $this->model_catalog_information->getInformations();
		
		$this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();
		
		if (isset($this->request->post['tmdqc_status'])) {
			$data['tmdqc_status'] = $this->request->post['tmdqc_status'];
		} else {
			$data['tmdqc_status'] = $this->config->get('tmdqc_status');
		}
		
		if (isset($this->request->post['tmdqc_guest_status'])) {
			$data['tmdqc_guest_status'] = $this->request->post['tmdqc_guest_status'];
		} else {
			$data['tmdqc_guest_status'] = $this->config->get('tmdqc_guest_status');
		}
		
		
		// Color Picker
		if (isset($this->request->post['tmdqc_content_background'])) {
			$data['tmdqc_content_background'] = $this->request->post['tmdqc_content_background'];
		} else {
			$data['tmdqc_content_background'] = $this->config->get('tmdqc_content_background');
		}
		
		if (isset($this->request->post['tmdqc_content_heading_color'])) {
			$data['tmdqc_content_heading_color'] = $this->request->post['tmdqc_content_heading_color'];
		} else {
			$data['tmdqc_content_heading_color'] = $this->config->get('tmdqc_content_heading_color');
		}
		
		if (isset($this->request->post['tmdqc_cart_heading_color'])) {
			$data['tmdqc_cart_heading_color'] = $this->request->post['tmdqc_cart_heading_color'];
		} else {
			$data['tmdqc_cart_heading_color'] = $this->config->get('tmdqc_cart_heading_color');
		}
		if (isset($this->request->post['tmdqc_cart_table_color'])) {
			$data['tmdqc_cart_heading_background'] = $this->request->post['tmdqc_cart_heading_background'];
		} else {
			$data['tmdqc_cart_heading_background'] = $this->config->get('tmdqc_cart_heading_background');
		}
		
		if (isset($this->request->post['tmdqc_cart_table_color'])) {
			$data['tmdqc_cart_table_color'] = $this->request->post['tmdqc_cart_table_color'];
		} else {
			$data['tmdqc_cart_table_color'] = $this->config->get('tmdqc_cart_table_color');
		}
		
		if (isset($this->request->post['tmdqc_cart_table_border'])) {
			$data['tmdqc_cart_table_border'] = $this->request->post['tmdqc_cart_table_border'];
		} else {
			$data['tmdqc_cart_table_border'] = $this->config->get('tmdqc_cart_table_border');
		}
		
		if (isset($this->request->post['tmdqc_cart_table_background'])) {
			$data['tmdqc_cart_table_background'] = $this->request->post['tmdqc_cart_table_background'];
		} else {
			$data['tmdqc_cart_table_background'] = $this->config->get('tmdqc_cart_table_background');
		}
		
		if (isset($this->request->post['tmdqc_block_heading_color'])) {
			$data['tmdqc_block_heading_color'] = $this->request->post['tmdqc_block_heading_color'];
		} else {
			$data['tmdqc_block_heading_color'] = $this->config->get('tmdqc_block_heading_color');
		}
		if (isset($this->request->post['tmdqc_block_heading_border'])) {
			$data['tmdqc_block_heading_border'] = $this->request->post['tmdqc_block_heading_border'];
		} else {
			$data['tmdqc_block_heading_border'] = $this->config->get('tmdqc_block_heading_border');
		}
		
		if (isset($this->request->post['tmdqc_block_heading_background'])) {
			$data['tmdqc_block_heading_background'] = $this->request->post['tmdqc_block_heading_background'];
		} else {
			$data['tmdqc_block_heading_background'] = $this->config->get('tmdqc_block_heading_background');
		}
		
		if (isset($this->request->post['tmdqc_logintextcolor'])) {
			$data['tmdqc_logintextcolor'] = $this->request->post['tmdqc_logintextcolor'];
		} else {
			$data['tmdqc_logintextcolor'] = $this->config->get('tmdqc_logintextcolor');
		}
		
		if (isset($this->request->post['tmdqc_primary_button_color'])) {
			$data['tmdqc_primary_button_color'] = $this->request->post['tmdqc_primary_button_color'];
		} else {
			$data['tmdqc_primary_button_color'] = $this->config->get('tmdqc_primary_button_color');
		}
		
		if (isset($this->request->post['tmdqc_primary_button_background'])) {
			$data['tmdqc_primary_button_background'] = $this->request->post['tmdqc_primary_button_background'];
		} else {
			$data['tmdqc_primary_button_background'] = $this->config->get('tmdqc_primary_button_background');
		}
		
		if (isset($this->request->post['tmdqc_primary_button_background_hover'])) {
			$data['tmdqc_primary_button_background_hover'] = $this->request->post['tmdqc_primary_button_background_hover'];
		} else {
			$data['tmdqc_primary_button_background_hover'] = $this->config->get('tmdqc_primary_button_background_hover');
		}
		
		if (isset($this->request->post['tmdqc_primary_button_border'])) {
			$data['tmdqc_primary_button_border'] = $this->request->post['tmdqc_primary_button_border'];
		} else {
			$data['tmdqc_primary_button_border'] = $this->config->get('tmdqc_primary_button_border');
		}
				
		if (isset($this->request->post['tmdqc_danger_button_color'])) {
			$data['tmdqc_danger_button_color'] = $this->request->post['tmdqc_danger_button_color'];
		} else {
			$data['tmdqc_danger_button_color'] = $this->config->get('tmdqc_danger_button_color');
		}
		
		if (isset($this->request->post['tmdqc_danger_button_background'])) {
			$data['tmdqc_danger_button_background'] = $this->request->post['tmdqc_danger_button_background'];
		} else {
			$data['tmdqc_danger_button_background'] = $this->config->get('tmdqc_danger_button_background');
		}
		
		if (isset($this->request->post['tmdqc_danger_button_background_hover'])) {
			$data['tmdqc_danger_button_background_hover'] = $this->request->post['tmdqc_danger_button_background_hover'];
		} else {
			$data['tmdqc_danger_button_background_hover'] = $this->config->get('tmdqc_danger_button_background_hover');
		}
		
		if (isset($this->request->post['tmdqc_danger_button_border'])) {
			$data['tmdqc_danger_button_border'] = $this->request->post['tmdqc_danger_button_border'];
		} else {
			$data['tmdqc_danger_button_border'] = $this->config->get('tmdqc_danger_button_border');
		}
		
		if (isset($this->request->post['tmdqc_input_background'])) {
			$data['tmdqc_input_background'] = $this->request->post['tmdqc_input_background'];
		} else {
			$data['tmdqc_input_background'] = $this->config->get('tmdqc_input_background');
		}
		
		if (isset($this->request->post['tmdqc_input_color'])) {
			$data['tmdqc_input_color'] = $this->request->post['tmdqc_input_color'];
		} else {
			$data['tmdqc_input_color'] = $this->config->get('tmdqc_input_color');
		}
		
		if (isset($this->request->post['tmdqc_input_border'])) {
			$data['tmdqc_input_border'] = $this->request->post['tmdqc_input_border'];
		} else {
			$data['tmdqc_input_border'] = $this->config->get('tmdqc_input_border');
		}
		
		if (isset($this->request->post['tmdqc_label_color'])) {
			$data['tmdqc_label_color'] = $this->request->post['tmdqc_label_color'];
		} else {
			$data['tmdqc_label_color'] = $this->config->get('tmdqc_label_color');
		}
		
		if (isset($this->request->post['tmdqc_sub_content_border'])) {
			$data['tmdqc_sub_content_border'] = $this->request->post['tmdqc_sub_content_border'];
		} else {
			$data['tmdqc_sub_content_border'] = $this->config->get('tmdqc_sub_content_border');
		}
		
		if (isset($this->request->post['tmdqc_sub_content_background'])) {
			$data['tmdqc_sub_content_background'] = $this->request->post['tmdqc_sub_content_background'];
		} else {
			$data['tmdqc_sub_content_background'] = $this->config->get('tmdqc_sub_content_background');
		}
		
		if (isset($this->request->post['tmdqc_payment_label'])) {
			$data['tmdqc_payment_label'] = $this->request->post['tmdqc_payment_label'];
		} else {
			$data['tmdqc_payment_label'] = $this->config->get('tmdqc_payment_label');
		}
		
		if (isset($this->request->post['tmdqc_shipping_label'])) {
			$data['tmdqc_shipping_label'] = $this->request->post['tmdqc_shipping_label'];
		} else {
			$data['tmdqc_shipping_label'] = $this->config->get('tmdqc_shipping_label');
		}
		
		if (isset($this->request->post['tmdqc_account_default_checked'])) {
			$data['tmdqc_account_default_checked'] = $this->request->post['tmdqc_account_default_checked'];
		} else {
			$data['tmdqc_account_default_checked'] = $this->config->get('tmdqc_account_default_checked');
		}
		
		if (isset($this->request->post['tmdqc_checkout_default_checked'])) {
			$data['tmdqc_checkout_default_checked'] = $this->request->post['tmdqc_checkout_default_checked'];
		} else {
			$data['tmdqc_checkout_default_checked'] = $this->config->get('tmdqc_checkout_default_checked');
		}
		
		$data['entry_content_background'] = $this->language->get('entry_content_background');
		$data['entry_content_heading_color'] = $this->language->get('entry_content_heading_color');
		$data['entry_cart_heading_color'] = $this->language->get('entry_cart_heading_color');
		$data['entry_cart_heading_background'] = $this->language->get('entry_cart_heading_background');
		$data['entry_cart_table_color'] = $this->language->get('entry_cart_table_color');
		$data['entry_cart_table_background'] = $this->language->get('entry_cart_table_background');
		$data['entry_cart_table_border'] = $this->language->get('entry_cart_table_border');
		$data['entry_block_heading_color'] = $this->language->get('entry_block_heading_color');
		$data['entry_block_heading_background'] = $this->language->get('entry_block_heading_background');
		$data['entry_block_heading_border'] = $this->language->get('entry_block_heading_border');
		$data['entry_primary_button_color'] = $this->language->get('entry_primary_button_color');
		$data['entry_primary_button_background'] = $this->language->get('entry_primary_button_background');
		$data['entry_primary_button_background_hover'] = $this->language->get('entry_primary_button_background_hover');
		$data['entry_primary_button_border'] = $this->language->get('entry_primary_button_border');
		$data['entry_danger_button_color'] = $this->language->get('entry_danger_button_color');
		$data['entry_danger_button_background'] = $this->language->get('entry_danger_button_background');
		$data['entry_danger_button_border'] = $this->language->get('entry_danger_button_border');
		$data['entry_danger_button_background_hover'] = $this->language->get('entry_danger_button_background_hover');
		$data['entry_input_color'] = $this->language->get('entry_input_color');
		$data['entry_input_background'] = $this->language->get('entry_input_background');
		$data['entry_input_border'] = $this->language->get('entry_input_border');
		$data['entry_label_color'] = $this->language->get('entry_label_color');
		$data['entry_sub_content_background'] = $this->language->get('entry_sub_content_background');
		$data['entry_sub_content_border'] = $this->language->get('entry_sub_content_border');
		$data['text_main_content'] = $this->language->get('text_main_content');
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_sub_content'] = $this->language->get('text_sub_content');
		$data['text_buttons'] = $this->language->get('text_buttons');
		$data['text_input_labels'] = $this->language->get('text_input_labels');
		
		
		///Shipping Module
		$data['shippings']=array();
		$this->load->model('extension/extension');
		$shippings = $this->model_extension_extension->getInstalled('shipping');
		$data['tmdqc_shipping_admin'] =array();
		foreach($shippings as $shipping){
			$this->load->language('extension/shipping/' . $shipping);
			$data['shippings'][] =array(
				'heading'  => 	$this->language->get('heading_title'),
				'code'		 =>   $shipping
			);
			
			if(isset($this->request->post['tmdqc_'.$shipping])){
				$data['tmdqc_'.$shipping] = $this->request->post['tmdqc_'.$shipping];
			}elseif($this->config->has('tmdqc_'.$shipping)){
				$data['tmdqc_'.$shipping] = $this->config->get('tmdqc_'.$shipping);
			}else{
				$data['tmdqc_'.$shipping] = array();
			}
			
			$data['tmdqc_shipping_admin'][$shipping] = array(
				'language'   			=>  $data['tmdqc_'.$shipping],
				'sort_order'    =>  ($this->config->get($shipping.'_sort_order') ? $this->config->get($shipping.'_sort_order') : 0),
				'status'   		  =>  ($this->config->get($shipping.'_status') ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
			);
			
			foreach($data['languages'] as $language){
					if(!empty($data['tmdqc_shipping_admin'][$shipping]['language'][$language['language_id']]['image'])){
						$thumb = $this->model_tool_image->resize($data['tmdqc_shipping_admin'][$shipping]['language'][$language['language_id']]['image'], 100, 100);
					}else{
						$thumb = $this->model_tool_image->resize('no_image.png', 100, 100);
					}
					$data['tmdqc_shipping_thum'][$shipping][$language['language_id']] = $thumb;
			}
			$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		//payment Module 
		$data['payments']=array();
		$this->load->model('extension/extension');
		$payments = $this->model_extension_extension->getInstalled('payment');
		$data['tmdqc_payment_admin'] =array();
		foreach($payments as $payment){
			$this->load->language('extension/payment/' . $payment);
			$data['payments'][] = array(
				'heading'  => 	$this->language->get('heading_title'),
				'code'		 =>   $payment
			);
			
			if(isset($this->request->post['tmdqc_'.$payment])){
				$data['tmdqc_'.$payment] = $this->request->post['tmdqc_'.$payment];
			}elseif($this->config->has('tmdqc_'.$payment)){
				$data['tmdqc_'.$payment] = $this->config->get('tmdqc_'.$payment);
			}else{
				$data['tmdqc_'.$payment] = array();
			}
			
			$data['tmdqc_payment_admin'][$payment] = array(
				'language'   			=>  $data['tmdqc_'.$payment],
				'sort_order'    =>  ($this->config->get($payment.'_sort_order') ? $this->config->get($shipping.'_sort_order') : 0),
				'status'   		  =>  ($this->config->get($payment.'_status') ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
			);
			
			foreach($data['languages'] as $language){
					if(!empty($data['tmdqc_payment_admin'][$payment]['language'][$language['language_id']]['image'])){
						$thumb = $this->model_tool_image->resize($data['tmdqc_payment_admin'][$payment]['language'][$language['language_id']]['image'], 100, 100);
					}else{
						$thumb = $this->model_tool_image->resize('no_image.png', 100, 100);
					}
					$data['tmdqc_payment_thum'][$payment][$language['language_id']] = $thumb;
			}
			$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		///Custom Feild
		$this->load->language('customer/custom_field');
		
		$data['column_name'] = $this->language->get('column_name');
		$data['column_location'] = $this->language->get('column_location');
		$data['column_type'] = $this->language->get('column_type');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		
		$this->load->model('customer/custom_field');
		
		$results = $this->model_customer_custom_field->getCustomFields($filter_data=array());

		$data['custom_fields'] = array();
		foreach ($results as $result) {
			$type = '';

			switch ($result['type']) {
				case 'select':
					$type = $this->language->get('text_select');
					break;
				case 'radio':
					$type = $this->language->get('text_radio');
					break;
				case 'checkbox':
					$type = $this->language->get('text_checkbox');
					break;
				case 'input':
					$type = $this->language->get('text_input');
					break;
				case 'text':
					$type = $this->language->get('text_text');
					break;
				case 'textarea':
					$type = $this->language->get('text_textarea');
					break;
				case 'file':
					$type = $this->language->get('text_file');
					break;
				case 'date':
					$type = $this->language->get('text_date');
					break;
				case 'datetime':
					$type = $this->language->get('text_datetime');
					break;
				case 'time':
					$type = $this->language->get('text_time');
					break;
			}

			$data['custom_fields'][] = array(
				'custom_field_id' => $result['custom_field_id'],
				'name'            => $result['name'],
				'location'        => $this->language->get('text_' . $result['location']),
				'type'            => $type,
				'status'          => $result['status'],
				'sort_order'      => $result['sort_order'],
			);
		}
		
		if(isset($this->request->post['tmdqc_custom_sort_oder'])){
			$data['tmdqc_custom_sort_oder'] = $this->request->post['tmdqc_custom_sort_oder'];
		}elseif($this->config->has('tmdqc_custom_sort_oder')){
			$data['tmdqc_custom_sort_oder'] = $this->config->get('tmdqc_custom_sort_oder');
		}else{
			$data['tmdqc_custom_sort_oder'] = array();
		}
		
		///Google Tracking
		if(isset($this->request->post['tmdqc_trackingcode'])){
			$data['tmdqc_trackingcode'] = $this->request->post['tmdqc_trackingcode'];
		}else{
			$data['tmdqc_trackingcode'] = $this->config->get('tmdqc_trackingcode');
		}
		
		
		// Title
		if(isset($this->request->post['tmdqc_title'])){
			$data['tmdqc_title'] = $this->request->post['tmdqc_title'];
		}else{
			$data['tmdqc_title'] = $this->config->get('tmdqc_title');
		}
		
		$data['text_heading_title'] = $this->language->get('text_heading_title');
		$data['text_cart_title'] = $this->language->get('text_cart_title');
		$data['text_account_type'] = $this->language->get('text_account_type');
		$data['text_delivery_details_title'] = $this->language->get('text_delivery_details_title');
		$data['text_delivery_method_title'] = $this->language->get('text_delivery_method_title');
		$data['text_payment_method_title'] = $this->language->get('text_payment_method_title');
		$data['text_button_title'] = $this->language->get('text_button_title');
		
		$data['entry_heading_title'] = $this->language->get('entry_heading_title');
		$data['entry_cart_title'] = $this->language->get('entry_cart_title');
		$data['entry_checkout_option_title'] = $this->language->get('entry_checkout_option_title');
		$data['entry_customer_title'] = $this->language->get('entry_customer_title');
		$data['entry_login_title'] = $this->language->get('entry_login_title');
		$data['entry_delivery_details_title'] = $this->language->get('entry_delivery_details_title');
		$data['entry_register_title'] = $this->language->get('entry_register_title');
		$data['entry_personal_detail'] = $this->language->get('entry_personal_detail');
		$data['entry_guest_title'] = $this->language->get('entry_guest_title');
		$data['entry_delivery_method_title'] = $this->language->get('entry_delivery_method_title');
		$data['entry_payment_method_title'] = $this->language->get('entry_payment_method_title');
		$data['entry_payment_method_title'] = $this->language->get('entry_payment_method_title');
		$data['entry_continue_shopping_title'] = $this->language->get('entry_continue_shopping_title');
		$data['entry_order_title'] = $this->language->get('entry_order_title');
		$data['entry_confirm_title'] = $this->language->get('entry_confirm_title');
		$data['entry_login_button_title'] = $this->language->get('entry_login_button_title');
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/tmdqc', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/tmdqc')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	
	public function installsetting() {
		if(!$this->config->has('tmdqc_status')) {
			$this->load->language('extension/module/tmdqc');
			$this->load->model('tool/backup');
			
			$sql = HTTPS_CATALOG . 'tmdqc_setting.sql';
			
			if($sql){
				$filter_data = file_get_contents($sql);
			}else{
				$filter_data = false;
			}
			
			if($filter_data) {
				$this->model_tool_backup->restore($filter_data);
				$this->session->data['success'] = $this->language->get('text_success_install_seittng');
			}
		}
		$this->response->redirect($this->url->link('extension/module/tmdqc', 'token=' . $this->session->data['token'], 'SSL'));
	}
}	