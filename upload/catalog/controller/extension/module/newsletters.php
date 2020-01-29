<?php
class ControllerExtensionModuleNewsletters extends Controller {

	public function index() {

		$this->load->language('extension/module/newsletter');

		$this->load->model('extension/module/newsletters');
		
		$this->model_extension_module_newsletters->createNewsletter();

		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_email'] = $this->language->get('text_email');
		$data['error_news_email_invalid'] = $this->language->get('error_news_email_invalid');
		$data['error_news_email_required'] = $this->language->get('error_news_email_required');
		$data['error_newsletter_sent'] = $this->language->get('error_newsletter_sent');
		$data['error_newsletter_fail'] = $this->language->get('error_newsletter_fail');

		return $this->load->view($this->config->get('config_template') . '/extension/module/newsletters', $data);
	}

	public function add() {

		$this->load->model('extension/module/newsletters');

		$json = array();
		$json['message'] = $this->model_extension_module_newsletters->addNewsletter($this->request->post);
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}