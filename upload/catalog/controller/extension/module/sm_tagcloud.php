<?php
class ControllerExtensionModuleSmTagcloud extends Controller {
	public function index() {
		
		$this->load->model('localisation/language');
		$this->load->model('extension/module/sm_tagcloud');
		
		$title = $this->config->get('sm_tagcloud_title');
        $data['module_title'] = $title[$this->session->data['language']];
	
		$data['limit'] = $this->config->get('sm_tagcloud_limit');	
		
		$data['tagcloud'] = $this->model_extension_module_sm_tagcloud->getRandomTags(array(
			'limit'   => (int)$data['limit']
		));
			
       return $this->load->view('extension/module/sm_tagcloud', $data);
	}
}