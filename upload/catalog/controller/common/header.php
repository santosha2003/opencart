<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');
		 $this->load->model('tool/image');
		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['text_information'] = $this->language->get('text_information');

		$data['name'] = $this->config->get('config_name');

// add about info to top menu  только нужно было Готовые работы и О компании..   ..замедляет на 1 секунду загрузку
		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// меню Menu  пере..исправлено сразу и здесь 3 уровня и category_wall там берет со 2-го (id 56 ) для схожести, модуль работает 2.3.0.1 3 версии не пробовал santosha.no-ip.info
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();
       $this->load->model('tool/image');
		$categories = $this->model_catalog_category->getCategories(0); // (59) for left side menu
	//    $cat1= $categories;
	//    GLOBAL $cat1;


		foreach ($categories as $category) {
	$children_data = array();  // меню категорий 3 уровня

				// Level 2
	//		if ($category['top']) (скобка фиг)           // если вкл то только 1 уровень выводится

            if ($category['image']) {
            //    $image = $this->model_tool_image->resize($category['image'],$this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height')); 25, 25 ) //
               $image = resize($category['image'],25,25);
        $category['thumb'] =$image;
            } else {
                $image = ''; // $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
          $category['thumb'] =''; //$image
            }



				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
			$filter_data = array(
				'filter_category_id'  => $child['category_id'],
				'filter_sub_category' => true
			);
					    //Подключить вывод изображения thumb                 //'image' => $this->model_tool_image->resize($child['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height')),//;

            if ($child['image']) {
                $image = $this->model_tool_image->resize($child['image'], 50,50); // $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
        $child['thumb'] =$image;
            } else {
                $image = ''; // $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
          $child['thumb'] =''; //$image
            }


		///////////////// Level 3
//$this->load->model('tool/image');
		$subchildren_data = array();
		$subchildren = $this->model_catalog_category->getCategories($child['category_id']);
		foreach ($subchildren as $subchild) {
	    $filter_data = array(
	    'filter_category_id'  => $subchild['category_id'],
	    'filter_sub_category' => true
	    );
            if ($subchild['image']) {
                $subchildimage = $this->model_tool_image->resize($subchild['image'], 50, 50); // $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
        $subchild['thumb'] =$subchildimage;
            } else {
                $subchildimage = ''; // $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height'));
          $subchild['thumb'] =''; //$image
            }

	          //$this->model_tool_image->resize($subchild['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'))
		$subchildren_data[] = array(
		'name'  => $subchild['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
		'href'  => $this->url->link('product/category', 'path=' . $child['category_id'] . '_' . $subchild['category_id']),
		'image' => $subchild['thumb'],
		'thumb' => $subchild['thumb']
		);
		}
////////////////// Level 2 of 3
 
 $children_data[] = array(
  'category_id' => $child['category_id'],
  'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
  'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
  'thumb' => $child['thumb'],
  'image' => $child['thumb'],
  'subchildren' => $subchildren_data,
 );
  } //endforeach (child element - level 2)


				// Level 1    //Подключить вывод изображения thumb
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data, 
					'thumb'    => $this->model_tool_image->resize($category['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height')),
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
//			(скобка фиг закр) // если вкл то только верхний уровень показывается (category[top])
		} //цикл по категориям товаров
//меню хвост
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
