<?php
class ControllerExtensionModuleDiscountOnNextPurchase extends Controller {

	private $data = array();
	private $error = array();
	private $version;
	private $module_path;
	private $extensions_link;
	private $language_variables;
	private $moduleModel;
	private $moduleName;
	private $call_model;
	
	public function __construct($registry){
		parent::__construct($registry);
		$this->load->config('isenselabs/discountonnextpurchase');
		$this->moduleName = $this->config->get('discountonnextpurchase_name');
		$this->call_model = $this->config->get('discountonnextpurchase_model');
		$this->module_path = $this->config->get('discountonnextpurchase_path');
		$this->version = $this->config->get('discountonnextpurchase_version');

		$this->extensions_link = $this->url->link('marketplace/extension', 'user_token=' . $this->session->data['user_token'].'&type=module', 'SSL');
			
		$this->load->model($this->module_path);
		$this->moduleModel = $this->{$this->call_model};
    	$this->language_variables = $this->load->language($this->module_path);

    	//Loading framework models
	 	$this->load->model('setting/store');
		$this->load->model('setting/setting');
        $this->load->model('localisation/language');
        if(VERSION >= '2.1.0.1'){
			$this->load->model('customer/customer_group');
		} else {
			$this->load->model('sale/customer_group');
		}

		$this->document->addScript('view/javascript/summernote/summernote.js');
		$this->document->addStyle('view/javascript/summernote/summernote.css');

		$this->data['module_path']     = $this->module_path;
		$this->data['moduleName']      = $this->moduleName;
		$this->data['moduleNameSmall'] = $this->moduleName;	    
	}
    public function index() { 
        
        $this->load->model('marketing/coupon');
        $this->load->model('catalog/product');
        $this->load->model('catalog/category');
		
		if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0; 
        }

	 	$store = $this->getCurrentStore($this->request->get['store_id']);

	 	foreach ($this->language_variables as $code => $languageVariable) {
		    $this->data[$code] = $languageVariable;
		}    

        $this->document->setTitle($this->language->get('heading_title'));
        $this->document->addStyle('view/stylesheet/DiscountOnNextPurchase.css');
		$this->document->addScript('view/javascript/DiscountOnNextPurchase/nprogress.js');

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
            if (!$this->user->hasPermission('modify', $this->module_path)) {
                $this->response->redirect($this->extensions_link);
            }
            if (!empty($_POST['OaXRyb1BhY2sgLSBDb21'])) {
                $this->request->post['DiscountOnNextPurchase']['LicensedOn'] = $_POST['OaXRyb1BhY2sgLSBDb21'];
            }
            if (!empty($_POST['cHRpbWl6YXRpb24ef4fe'])) {
                $this->request->post['DiscountOnNextPurchase']['License'] = json_decode(base64_decode($_POST['cHRpbWl6YXRpb24ef4fe']), true);
            }
			//var_dump($this->request->post);
            $this->model_setting_setting->editSetting('DiscountOnNextPurchase', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link($this->module_path, 'user_token=' . $this->session->data['user_token'], 'SSL'));       							
		}
		
		if (isset($this->session->data['success'])) {     
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
        
        if (isset($this->error['warning'])) { 
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['discount'])) {
            $this->data['err_discount'] = $this->error['discount'];
        } else {
            $this->data['err_discount'] = '';
        }

        if (isset($this->error['total_amount'])) {
            $this->data['err_total_amount'] = $this->error['total_amount'];
        } else {
            $this->data['err_total_amount'] = '';
        }

        if (isset($this->error['coupon_validity'])) {
            $this->data['err_coupon_validity'] = $this->error['coupon_validity'];
        } else {
            $this->data['err_coupon_validity'] = '';
        }

        if (isset($this->error['subject'])) {
            $this->data['error_subject'] = $this->error['subject'];
        } else {
            $this->data['error_subject'] = '';
        }

		$this->data['heading_title'] .= ' ' . $this->version;

        $this->data['breadcrumbs']     = array();
        $this->data['breadcrumbs'][]   = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][]   = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->extensions_link,
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][]   = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link($this->module_path, 'user_token=' . $this->session->data['user_token'], 'SSL'),
            'separator' => ' :: '
        );

        $languages = $this->model_localisation_language->getLanguages();
        $this->data['languages'] = $languages;

		foreach ($this->data['languages'] as $key => $value) {
			$this->data['languages'][$key]['flag_url'] = version_compare(VERSION, '2.2.0.0', "<") 
			? 'view/image/flags/'.$this->data['languages'][$key]['image']
			: 'language/'.$this->data['languages'][$key]['code'].'/'.$this->data['languages'][$key]['code'].'.png"';
		}

        $firstLanguage = array_shift($languages);
        $this->data['firstLanguageCode'] = $firstLanguage['code'];
		$this->data['discount']['id']		    = isset($this->request->get['discount_id'])?$this->request->get['discount_id']:1;
        $this->data['data'] = $this->model_setting_setting->getSetting('DiscountOnNextPurchase', $store['store_id']);
		
		if(!empty($this->data['data'])) {
			$this->data['moduleData'] = $this->data['data'][$this->moduleName];
		} else {
			$this->data['moduleData'] = array();
		}	
		
		if(!empty($this->data['moduleData']['Discount'])) {
			foreach($this->data['moduleData']['Discount'] as $key => $value) {
				if(!empty($this->data['moduleData']['Discount'][$key]['coupon_product'])) {
					foreach($this->data['moduleData']['Discount'][$key]['coupon_product'] as $k => $v) {
						$temp_product = $this->model_catalog_product->getProduct((int)$v);
						if(!empty($temp_product)) {
							$this->data['moduleData']['Discount'][$key]['coupon_product'][$k] = array(
								'product_id' => $temp_product['product_id'],
								'name' => $temp_product['name']
							);
						}		
					}
				}
			}
		}
		
		if(!empty($this->data['moduleData']['Discount'])) {
				
			foreach($this->data['moduleData']['Discount'] as $key => $value) {
				if(!empty($this->data['moduleData']['Discount'][$key]['coupon_category'])) {
					
					foreach($this->data['moduleData']['Discount'][$key]['coupon_category'] as $k => $v) {
						$temp_category=$this->model_catalog_category->getCategory((int)$v);
						
						if(!empty($temp_category)) {
							$this->data['moduleData']['Discount'][$key]['coupon_category'][$k] = array(
								'category_id' => $temp_category['category_id'],
								'name' => $temp_category['name']
							);
						}		
					}
				}
			}
		}
				
		
        $this->data['cancel'] = $this->extensions_link;
	
		$this->data['moduleName']			 = $this->moduleName;
		
        $this->data['orderStatuses'] = $this->moduleModel->getAllOrderStatuses();
        $this->data['currency'] = $this->config->get('config_currency');
        $this->data['token'] = $this->session->data['user_token'];

 		$this->data['stores'] = array_merge(array(0 => array('store_id' => '0', 'name' => $this->config->get('config_name') . ' ' . $this->data['text_default'], 'url' => HTTP_SERVER, 'ssl' => HTTPS_SERVER)), $this->model_setting_store->getStores());
        $this->data['store']                  = $store;


		$this->data['email']=$this->config->get('config_email');
		
		 if ($this->config->get('DiscountOnNextPurchase_status')) { 
            $this->data['DiscountOnNextPurchase_status'] = $this->config->get('DiscountOnNextPurchase_status'); 
        } else {
            $this->data['DiscountOnNextPurchase_status'] = '0';
        }
		
		
 
        $this->data['header']                 = $this->load->controller('common/header');
        $this->data['column_left']            = $this->load->controller('common/column_left');
        $this->data['footer']                 = $this->load->controller('common/footer');
		
		if (empty($this->data['data']['DiscountOnNextPurchase']['LicensedOn'])) {
			$this->data['b64'] = base64_decode('ICAgIDxkaXYgY2xhc3M9ImFsZXJ0IGFsZXJ0LWRhbmdlciBmYWRlIGluIj4NCiAgICAgICAgPGJ1dHRvbiB0eXBlPSJidXR0b24iIGNsYXNzPSJjbG9zZSIgZGF0YS1kaXNtaXNzPSJhbGVydCIgYXJpYS1oaWRkZW49InRydWUiPsOXPC9idXR0b24+DQogICAgICAgIDxoND5XYXJuaW5nISBVbmxpY2Vuc2VkIHZlcnNpb24gb2YgdGhlIG1vZHVsZSE8L2g0Pg0KICAgICAgICA8cD5Zb3UgYXJlIHJ1bm5pbmcgYW4gdW5saWNlbnNlZCB2ZXJzaW9uIG9mIHRoaXMgbW9kdWxlISBZb3UgbmVlZCB0byBlbnRlciB5b3VyIGxpY2Vuc2UgY29kZSB0byBlbnN1cmUgcHJvcGVyIGZ1bmN0aW9uaW5nLCBhY2Nlc3MgdG8gc3VwcG9ydCBhbmQgdXBkYXRlcy48L3A+PGRpdiBzdHlsZT0iaGVpZ2h0OjVweDsiPjwvZGl2Pg0KICAgICAgICA8YSBjbGFzcz0iYnRuIGJ0bi1kYW5nZXIiIGhyZWY9ImphdmFzY3JpcHQ6dm9pZCgwKSIgb25jbGljaz0iJCgnYVtocmVmPSNpc2Vuc2Utc3VwcG9ydF0nKS50cmlnZ2VyKCdjbGljaycpIj5FbnRlciB5b3VyIGxpY2Vuc2UgY29kZTwvYT4NCiAgICA8L2Rpdj4=');

			$hostname = (!empty($_SERVER['HTTP_HOST'])) ? $_SERVER['HTTP_HOST'] : '' ;
            $this->data['hostname'] = (strstr($hostname,'http://') === false) ? 'http://'.$hostname: $hostname;
            $this->data['domain_b64'] = base64_encode($this->data['hostname']);
            $this->data['timenow'] = time();
		} else {
			$this->data['cHRpbWl6YXRpb24ef4fe'] = base64_encode(json_encode($this->data['data']['DiscountOnNextPurchase']['License']));
			$this->data['licenseExpires'] = date("F j, Y",strtotime($this->data['data']['DiscountOnNextPurchase']['License']['licenseExpireDate']));
		}
		
        $this->response->setOutput($this->load->view($this->module_path.'/DiscountOnNextPurchase', $this->data)); 
    }
	
	public function get_discount_settings() {

	 	foreach ($this->language_variables as $code => $languageVariable) {
		    $this->data[$code] = $languageVariable;
		}    
		
		$this->data['heading_title'] .= ' ' . $this->version;
        
       	$this->data['currency']			    = $this->config->get('config_currency');
		$this->data['languages']              = $this->model_localisation_language->getLanguages();

		foreach ($this->data['languages'] as $key => $value) {
			$this->data['languages'][$key]['flag_url'] = version_compare(VERSION, '2.2.0.0', "<") 
			? 'view/image/flags/'.$this->data['languages'][$key]['image']
			: 'language/'.$this->data['languages'][$key]['code'].'/'.$this->data['languages'][$key]['code'].'.png"';
		}
		
		$this->data['discount']['id']		    = $this->request->get['discount_id'];
		
		$store_id					    = $this->request->get['store_id'];
		$this->data['token']                  = $this->session->data['user_token'];
		$this->data['data']                   = $this->model_setting_setting->getSetting($this->moduleName, $store_id);
		$this->data['orderStatuses'] 			= $this->moduleModel->getAllOrderStatuses();

		$this->data['moduleName']			 = $this->moduleName;
		$this->data['moduleData']			 = (isset($this->data['data'][$this->moduleName]['Discount'])) ? $this->data['data'][$this->moduleName]['Discount'] : array();
	
		$this->data['newAddition']			= true;
		
		$this->response->setOutput($this->load->view($this->module_path.'/tab_discount', $this->data));
	}

	public function givenCoupons(){		
		$action='givenCoupons';
		$this->listCoupons($action);	
	}
	
	public function usedCoupons(){		
		$action='usedCoupons';
		$this->listCoupons($action);	
	}
			
	private function listCoupons($action) { 
		
		if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'name';
        }
        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }
		
        $url = '';
        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['givenCoupons']       = array();
		
        $data                        = array(
            'sort' => $sort,
            'order' => $order,
            'start' => ($page - 1) *  $this->config->get('config_limit_admin'),
            'limit' =>  $this->config->get('config_limit_admin')
        );
		if($action == 'usedCoupons') {
			$coupon_total = $this->moduleModel->getTotalUsedCoupons();
        	$coupons  = $this->moduleModel->getUsedCoupons($data);

		} else {
        	$coupon_total  = $this->moduleModel->getTotalGivenCoupons();
        	$coupons  = $this->moduleModel->getGivenCoupons($data);
		}
		if(!empty($coupons)) {
			foreach ($coupons as $coupon) {
				$this->data['coupons'][] = array(
					'coupon_id' => $coupon['coupon_id'],
					'name' => $coupon['name'],
					'email' => $coupon['email'],
					'code' => $coupon['code'],
					'discount' => $coupon['discount'],
					'date_start' => date($this->language->get('date_format_short'), strtotime($coupon['date_start'])),
					'date_end' => date($this->language->get('date_format_short'), strtotime($coupon['date_end'])),
					'status' => ($coupon['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'))
				);
			}
		}
        $this->data['heading_title']     = $this->language->get('heading_title');
        $this->data['text_no_results']   = $this->language->get('text_no_results');
        $this->data['column_name']       = $this->language->get('column_name');
        $this->data['column_code']       = $this->language->get('column_code');
        $this->data['column_discount']   = $this->language->get('column_discount');
        $this->data['column_date_start'] = $this->language->get('column_date_start');
        $this->data['column_date_end']   = $this->language->get('column_date_end');
        $this->data['column_status']     = $this->language->get('column_status');
        $this->data['button_insert']     = $this->language->get('button_insert');
        $this->data['button_delete']     = $this->language->get('button_delete');
		$this->data['column_email']      = $this->language->get('column_email');
		
	if (isset($this->session->data['success'])) {     
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }
        
        if (isset($this->error['warning'])) { 
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
		
        $url = '';
        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }
        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }
        $this->data['sort_name']       = $this->getServerURL() . 'index.php?route='.$this->module_path.'/'.$action.'&user_token=' . $this->session->data['user_token'] . '&sort=name' . $url;
        $this->data['sort_code']       = $this->getServerURL() . 'index.php?route='.$this->module_path.'/'.$action.'&user_token=' . $this->session->data['user_token'] . '&sort=oc.code' . $url;
        $this->data['sort_discount']   = $this->getServerURL() . 'index.php?route='.$this->module_path.'/'.$action.'&user_token=' . $this->session->data['user_token'] . '&sort=discount' . $url;
        $this->data['sort_date_start'] = $this->getServerURL() . 'index.php?route='.$this->module_path.'/'.$action.'&user_token=' . $this->session->data['user_token'] . '&sort=date_start' . $url;
        $this->data['sort_date_end']   = $this->getServerURL() . 'index.php?route='.$this->module_path.'/'.$action.'&user_token=' . $this->session->data['user_token'] . '&sort=date_end' . $url;
        $this->data['sort_status']     = $this->getServerURL() . 'index.php?route='.$this->module_path.'/'.$action.'&user_token=' . $this->session->data['user_token'] . '&sort=status' . $url;
		$this->data['sort_email']     = $this->getServerURL() . 'index.php?route='.$this->module_path.'/'.$action.'&user_token=' . $this->session->data['user_token'] . '&sort=email' . $url;
        $url                           = '';
        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }
        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }
        $pagination               = new Pagination();
        $pagination->total        = $coupon_total;
        $pagination->page         = $page; 
        $pagination->limit        = $this->config->get('config_limit_admin');
        $pagination->text         = $this->language->get('text_pagination');
        $pagination->url          = $this->getServerURL() . 'index.php?route='.$this->module_path.'/'.$action.'&user_token=' . $this->session->data['user_token'] . $url . '&page={page}';
        $this->data['pagination'] = $pagination->render();
        $this->data['sort']       = $sort;
        $this->data['order']      = $order;
       
        $this->response->setOutput($this->load->view($this->module_path.'/coupons', $this->data)); 

	}
	
	public function install() {
        $this->moduleModel->install();
        $this->load->model('setting/event');
        $events = array(
        	'catalog/model/checkout/order/addOrderHistory/after' => 'extension/module/discountonnextpurchase/CatalogModelCheckoutOrderAddOrderHistoryAfter',
        	'catalog/controller/checkout/success/before' => 'extension/module/discountonnextpurchase/CatalogControllerCheckoutSuccessBefore'
        );
        foreach ($events as $trigger => $action) {
        	$this->model_setting_event->addEvent('isenselabs_discountonnextpurchase', $trigger, $action, 1, 0);
        }
    }

    public function uninstall() {
		$this->model_setting_setting->deleteSetting('DiscountOnNextPurchase_module', 0);
		$stores=$this->model_setting_store->getStores();
		foreach ($stores as $store) {
			$this->model_setting_setting->deleteSetting('DiscountOnNextPurchase_module', $store['store_id']);
		}
		$this->load->model('setting/event');
		$this->model_setting_event->deleteEventByCode('isenselabs_discountonnextpurchase');
        $this->moduleModel->uninstall();
    }
    
    protected function validate() {
        if (!$this->user->hasPermission('modify', $this->module_path)) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
		if (isset($this->request->post['DiscountOnNextPurchase']['Discount']) && is_array($this->request->post['DiscountOnNextPurchase']['Discount']) && count($this->request->post['DiscountOnNextPurchase']['Discount']) != 0) {
			foreach($this->request->post['DiscountOnNextPurchase']['Discount'] as $discount) {
				if(!is_numeric($discount['discount']))     {
					$this->error['discount'] = $this->language->get('error_disocunt');
				}
		
				if(!is_numeric($discount['total_amount']))     {
					$this->error['total_amount'] = $this->language->get('error_total_amount');
				}
				
				if(!is_numeric($discount['days_after']))     {
					$this->error['coupon_validity'] = $this->language->get('error_coupon_validity');
				}
		
				
				if(!is_numeric($discount['days_after'])){
					$this->error['coupon_validity'] = $this->language->get('error_coupon_validity');
				}
				
				
				// if( strlen($discount['subject']) < 2 || strlen($discount['subject']) > 128) {
				// 	 $this->error['subject'][$key] = $this->language->get('error_subject');
				// }
				
			}
		}
        
        if (!$this->error) {
            return true;
        } else {
            return false;
        }   
    }

    private function getCatalogURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_CATALOG;
        } else {
            $storeURL = HTTP_CATALOG;
        }
        return $storeURL;   
    }

    private function getServerURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $serverURL = HTTPS_SERVER;
        } else {
            $serverURL = HTTP_SERVER;
        }
        return $serverURL;   
    }	
	
	 private function getCurrentStore($store_id) {    
        if($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name'] = $this->config->get('config_name');
            $store['url'] = $this->getCatalogURL(); 
        }
        return $store;
    }
}

?>