<?php
class ControllerExtensionModuleSmTagcloud extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/sm_tagcloud');

		$this->load->model('setting/setting');
		$this->load->model('extension/module/sm_tagcloud');
		
		$data['generate_url'] = $this->url->link('extension/module/sm_tagcloud/generate', 'token=' . $this->session->data['token'], true);

		$this->document->setTitle($this->language->get('heading_title'));

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('sm_tagcloud', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['text_info'] = $this->language->get('text_info');
		$data['text_success'] = $this->language->get('text_success');
		
		
		$data['entry_generate'] = $this->language->get('entry_generate');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/sm_tagcloud', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/sm_tagcloud', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true);

		if (isset($this->request->post['sm_tagcloud_title'])) {
			$data['sm_tagcloud_title'] = $this->request->post['sm_tagcloud_title'];
		} else {
			$data['sm_tagcloud_title'] = $this->config->get('sm_tagcloud_title');
		}

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		$data['sm_tagcloud_limit'] = '10';
		
		(!isset($sm_menu_mega_second_image_w)) ? $sm_menu_mega_second_image_w = 165 : '';
		
		if (isset($this->request->post['sm_tagcloud_limit'])) {
			$data['sm_tagcloud_limit'] = $this->request->post['sm_tagcloud_limit'];
		} elseif ($this->config->has('sm_tagcloud_limit')) {
			$data['sm_tagcloud_limit'] = $this->config->get('sm_tagcloud_limit');
		} else {
			$data['sm_tagcloud_limit'] = '10';
		}


		if (isset($this->request->post['sm_tagcloud_status'])) {
			$data['sm_tagcloud_status'] = $this->request->post['sm_tagcloud_status'];
		} else {
			$data['sm_tagcloud_status'] = $this->config->get('sm_tagcloud_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/sm_tagcloud', $data));
	}
	
	
	
	public function generate() { 

		if (!$this->user->hasPermission('modify', 'extension/module/sm_tagcloud')) {
			$json['status']  = 'Error';
			$json['message'] = $this->language->get('error_permission');
		} else {
			$json = $this->generateTagCloud();
		}

		$this->response->setOutput(json_encode($json));
	}
	
	
	
	private function generateTagCloud() { 
	
	$this->load->model('extension/module/sm_tagcloud');
	
		$rawdata = $this->model_extension_module_sm_tagcloud->getRawTags();
	
		foreach($rawdata as $row) {
			$rowTags = explode(',', $row['tag']);
		
			foreach($rowTags as $key => $value) {
				$data[] = array(
					'store_id' 		=> $row['store_id'],
					'language_id' 	=> $row['language_id'],
					'qty' 			=> '1',
					'tag' 			=> trim($value)
				);
			}
		}
		$this->model_extension_module_sm_tagcloud->clear();
		$this->model_extension_module_sm_tagcloud->update($data);
		
		return array('status' => 'Success', 'message' => $this->language->get('generate_success'));
	}
	
	
	
	
	public function install() {
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "tag_cloud` (
		`qty` int(11) NOT NULL,
		`tag` varchar(255) COLLATE utf8_bin NOT NULL,
		`language_id` int(11) NOT NULL,
		`store_id` int(11) NOT NULL, 
		PRIMARY KEY (`tag`,`language_id`,`store_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin");
	}

	public function uninstall() {
		$this->db->query("DROP TABLE " . DB_PREFIX . "tag_cloud");
	}
	
	

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/sm_tagcloud')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}