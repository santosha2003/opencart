<?php
/**
 * @author Shashakhmetov Talgat <talgatks@gmail.com>
 */

class ControllerExtensionModuleCustomTemplate extends Controller
{
	private $error = array();

	public function __construct($registry)
	{
		parent::__construct($registry);
	}

	public function index()
	{
		$this->load->language('extension/module/custom_template');

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			if (isset($this->request->post['custom_template_module'])) {
				foreach ($this->request->post['custom_template_module'] as $key => $module) {
					$this->request->post['custom_template_module'][$key]['template_name'] = str_replace(array(
						'/',
						'\\'
					), DIRECTORY_SEPARATOR, $module['template_name']);
				}
			}

			$this->model_setting_setting->editSetting('custom_template_module', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module/custom_template', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');

		$data['button_save']       = $this->language->get('button_save');
		$data['button_cancel']     = $this->language->get('button_cancel');
		$data['button_add_module'] = $this->language->get('button_add_module');
		$data['button_remove']     = $this->language->get('button_remove');

		$data['text_select_all']   = $this->language->get('text_select_all');
		$data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$data['text_unregistered'] = $this->language->get('text_unregistered');

		//Module types
		$data['module_types'] = array(
			$this->language->get('module_type1'),
			$this->language->get('module_type2'),
			$this->language->get('module_type3'),
			$this->language->get('module_type4'),
			$this->language->get('module_type5'),
			$this->language->get('module_type6')
		);

		//Entry
		$data['entry_module_type']         = $this->language->get('entry_module_type');
		$data['entry_category']            = $this->language->get('entry_category');
		$data['entry_category_help']       = $this->language->get('entry_category_help');
		$data['entry_customer_group']      = $this->language->get('entry_customer_group');
		$data['entry_customer_group_help'] = $this->language->get('entry_customer_group_help');
		$data['entry_information']         = $this->language->get('entry_information');
		$data['entry_information_help']    = $this->language->get('entry_information_help');
		$data['entry_manufacturer']        = $this->language->get('entry_manufacturer');
		$data['entry_manufacturer_help']   = $this->language->get('entry_manufacturer_help');
		$data['entry_product']             = $this->language->get('entry_product');
		$data['entry_product_help']        = $this->language->get('entry_product_help');
		$data['entry_template']            = $this->language->get('entry_template');
		$data['entry_template_addon']      = $this->language->get('entry_template_addon');
		$data['entry_template_help']       = $this->language->get('entry_template_help');

		$data['button_check_file'] = $this->language->get('button_check_file');

		$data['text_empty_field']  = $this->language->get('text_empty_field');
		$data['text_file_success'] = $this->language->get('text_file_success');
		$data['text_file_failed']  = $this->language->get('text_file_failed');
		$data['text_file_demo']    = $this->language->get('text_file_demo');

		//Load data from models (product, category, inforamtion)
		$this->load->model('catalog/category');
		$this->load->model('catalog/information');
		$this->load->model('catalog/manufacturer');
		$this->load->model('catalog/product');

		if (version_compare('2.0.3.1', VERSION) < 0) {
			$this->load->model('customer/customer_group');
			$customer_groups = $this->model_customer_customer_group->getCustomerGroups();
		} else {
			$this->load->model('sale/customer_group');
			$customer_groups = $this->model_sale_customer_group->getCustomerGroups();
		}

		$data['categories']    = $this->model_catalog_category->getCategories(0);
		$data['informations']  = $this->model_catalog_information->getInformations();
		$data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();

		//add unregistered users
		$data['customer_groups'][] = array(
			'name' => $this->language->get('text_unregistered'),
			'customer_group_id' => null
		);

		foreach ($customer_groups as $key => $value) {
			$data['customer_groups'][] = $value;
		}
		// end add
		// $data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

		$modules = array();

		if (isset($this->request->post['custom_template_module'])) {
			$modules = $this->request->post['custom_template_module'];
		} elseif ($this->config->get('custom_template_module')) {
			$modules = $this->config->get('custom_template_module');
			// $modules = $modules[''];
		}

		foreach ($modules as $key => $module) {
			if (!isset($modules[$key]['categories'])) {
				$modules[$key]['categories'] = array();
			}
			if (!isset($modules[$key]['informations'])) {
				$modules[$key]['informations'] = array();
			}
			if (!isset($modules[$key]['manufacturers'])) {
				$modules[$key]['manufacturers'] = array();
			}
			if (!isset($modules[$key]['customer_groups'])) {
				$modules[$key]['customer_groups'] = array();
			}
			if (!isset($modules[$key]['product_manufacturers'])) {
				$modules[$key]['product_manufacturers'] = array();
			}
			if (!isset($modules[$key]['product_categories'])) {
				$modules[$key]['product_categories'] = array();
			}
			if (empty($modules[$key]['template_name'])) {
				$modules[$key]['template_name'] = '';
			}
			$modules[$key]['parsed_products'] = array();

			if (isset($this->request->post['custom_template_module'][$key]['products'])) {
				$products = explode(',', $this->request->post['custom_template_module'][$key]['products']);
			} else {
				if (isset($module['products'])) {
					$products = explode(',', $module['products']);
				} else {
					$products = array();
				}
			}
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					$modules[$key]['parsed_products'][] = array(
						'product_id' => $product_info['product_id'],
						'name' => $product_info['name']
					);
				}
			}
		}

		$data['modules'] = $modules;

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['token'] = $this->session->data['token'];

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/custom_template', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['action'] = $this->url->link('extension/module/custom_template', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');

		$data['themes'] = array();

		$this->load->model('extension/extension');

		$extensions = $this->model_extension_extension->getInstalled('theme');

		$data['theme'] = false;

		foreach ($extensions as $code) {
			$this->load->language('theme/' . $code);
			if ($code == $this->config->get('config_theme')) {
				$data['theme'] = $this->language->get('heading_title');
			}
		}

		if (!$data['theme']) {
			$data['theme'] = 'Default';
		}

		$data['template_addon'] = sprintf($data['entry_template_addon'], $data['theme']);

		$data['js_template_addon'] = $this->jsAddSlashes(sprintf($data['entry_template_addon'], $data['theme']));

		if (version_compare('2.2', VERSION) >= 0) {
			$this->response->setOutput($this->load->view('extension/module/custom_template.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('extension/module/custom_template', $data));
		}

	}

	private function jsAddSlashes($str)
	{
		$pattern = array(
			"/\\\\/",
			"/\n/",
			"/\r/",
			"/\"/",
			"/\'/",
			"/&/",
			"/</",
			"/>/"
		);
		$replace = array(
			"\\\\\\\\",
			"\\n",
			"\\r",
			"\\\"",
			"\\'",
			"\\x26",
			"\\x3C",
			"\\x3E"
		);
		return preg_replace($pattern, $replace, $str);
	}

	private function validate()
	{
		if (!$this->user->hasPermission('modify', 'extension/module/custom_template')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (count($this->request->post, COUNT_RECURSIVE) >= ini_get('max_input_vars')) {
			$this->error['warning'] = $this->language->get('error_max_input_vars');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function check_file()
	{
		$this->load->language('extension/module/custom_template');

		if (isset($this->request->post['path']) && $this->validate()) {

			$theme    = $this->config->get('config_theme');
			$template = $this->config->get('config_template');

			if (!empty($theme)) {
				$directory = $this->config->get('theme_default_directory');
			} elseif (!empty($template)) {
				$directory = $template;
			} else {
				$directory = 'default';
			}

			$path = DIR_CATALOG . 'view/theme/' . $directory . '/template/' . $this->request->post['path'] . '.tpl';

			if (is_file($path)) {
				$result['success'] = sprintf($this->language->get('ajax_success'), $path);
			} else {
				$result['warning'] = sprintf($this->language->get('ajax_warning'), $path);
			}

		} else {
			$result['warning'] = $this->language->get('error_permission');
		}

		$this->response->addHeader('Content-type: application/json');
		$this->response->setOutput(json_encode($result));
	}

}
?>