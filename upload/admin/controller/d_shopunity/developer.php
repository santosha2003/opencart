<?php
/*
 *	location: admin/controller
 */

class ControllerDShopunityDeveloper extends Controller {

	private $codename = 'd_shopunity';
	private $route = 'd_shopunity/developer';
	private $extension = array();

	public function __construct($registry) {
		parent::__construct($registry);
		$this->load->model('d_shopunity/mbooth');
		$this->load->model('d_shopunity/account');
		$this->load->model('d_shopunity/extension');

		$this->extension = $this->model_d_shopunity_mbooth->getExtension($this->codename);
	}

	public function index(){

		if(!$this->model_d_shopunity_account->isLogged()){
			$this->response->redirect($this->url->link('d_shopunity/account/login', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$account = $this->config->get('d_shopunity_account');

		if(empty($account['developer'])){
			$this->response->redirect($this->url->link('d_shopunity/account/login', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->document->addScript('view/javascript/d_shopunity/library/list/list.min.js');
		$this->document->addScript('view/javascript/d_shopunity/library/list/list.fuzzysearch.min.js');

		$developer_id = $account['developer']['developer_id'];

   		$this->load->language('d_shopunity/extension');
   		$this->load->language('d_shopunity/tester');
   		$this->load->model('d_shopunity/developer');

		$data['extensions'] = $this->model_d_shopunity_developer->getExtensions($developer_id);

   		$data['content_top'] = $this->load->controller('extension/module/d_shopunity/content_top');
   		$data['content_bottom'] = $this->load->controller('extension/module/d_shopunity/content_bottom');
   		$data = $this->load->controller('d_shopunity/extension/_productThumb',$data);
   		$this->response->setOutput($this->load->view($this->route.'.tpl', $data));
	}

	/**
	 * Update the extension over the whole system. 
	 */
	public function update(){
		if(!isset($this->request->get['extension_id'])){
			$this->session->data['error'] = 'Error! extension_id missing';
			$this->response->redirect($this->url->link('d_shopunity/extension', 'token=' . $this->session->data['token'] , 'SSL'));
		}

		if(!isset($this->request->get['developer_id'])){
			$this->session->data['error'] = 'Error! developer_id missing';
			$this->response->redirect($this->url->link('d_shopunity/extension', 'token=' . $this->session->data['token'] , 'SSL'));
		}
		$json = array();
		try{
			$this->load->model('d_shopunity/developer');
			$result = $this->model_d_shopunity_developer->updateExtension($this->request->get['extension_id'], $this->request->get['developer_id']);
			
			$json['result'] = $result;
			if(empty($result)){
				$json['error'] = 'Error! no updates made.';
			}else{
				$json['success'] = 'We have sent ' .count($result).' requests to update the extension';
			}
			
		}catch(Exception $e){
			$json['error'] = $e->getMessage();
		}

		$this->response->setOutput(json_encode($json));
	}

	public function profile($developer){
		$this->document->addStyle('view/stylesheet/d_shopunity/d_shopunity.css');
		$data['developer'] = $developer;

		return $this->load->view($this->route.'_profile.tpl', $data);
	}
}