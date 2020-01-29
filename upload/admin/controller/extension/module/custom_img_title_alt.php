<?php
class ControllerExtensionModuleCustomImgTitleAlt extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/custom_img_title_alt');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('custom_img_title_alt', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit']     = $this->language->get('text_edit');
		$data['text_enabled']  = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_help']     = sprintf($this->language->get('text_help'), $this->url->link('extension/module/custom_img_title_alt/download', 'token=' . $this->session->data['token'],true));

		$data['button_save']    = $this->language->get('button_save');
		$data['button_cancel']  = $this->language->get('button_cancel');
		$data['button_getlist'] = $this->language->get('button_getlist');

		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_help']    = $this->language->get('tab_help');
		$data['tab_debug']   = $this->language->get('tab_debug');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/custom_img_title_alt', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/module/custom_img_title_alt', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		$data['getlist'] = $this->url->link('extension/module/custom_img_title_alt/listTag', 'token=' . $this->session->data['token'], true);

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['custom_img_title_alt_enable'])) {
			$data['custom_img_title_alt_enable'] = $this->request->post['custom_img_title_alt_enable'];
		} else {
			$data['custom_img_title_alt_enable'] = $this->config->get('custom_img_title_alt_enable');
		}
		$data['entry_status'] = $this->language->get('entry_status');
		
		if (isset($this->request->post['custom_img_title_alt_main_title'])) {
			$data['custom_img_title_alt_main_title'] = $this->request->post['custom_img_title_alt_main_title'];
		} else {
			$data['custom_img_title_alt_main_title'] = $this->config->get('custom_img_title_alt_main_title');
		}
		$data['entry_main_title'] = $this->language->get('entry_main_title');

		if (isset($this->request->post['custom_img_title_alt_main_alt'])) {
			$data['custom_img_title_alt_main_alt'] = $this->request->post['custom_img_title_alt_main_alt'];
		} else {
			$data['custom_img_title_alt_main_alt'] = $this->config->get('custom_img_title_alt_main_alt');
		}
		$data['entry_main_alt'] = $this->language->get('entry_main_alt');

		if (isset($this->request->post['custom_img_title_alt_add_alt'])) {
			$data['custom_img_title_alt_add_alt'] = $this->request->post['custom_img_title_alt_add_alt'];
		} else {
			$data['custom_img_title_alt_add_alt'] = $this->config->get('custom_img_title_alt_add_alt');
		}
		$data['entry_add_alt'] = $this->language->get('entry_add_alt');

		if (isset($this->request->post['custom_img_title_alt_add_title'])) {
			$data['custom_img_title_alt_add_title'] = $this->request->post['custom_img_title_alt_add_title'];
		} else {
			$data['custom_img_title_alt_add_title'] = $this->config->get('custom_img_title_alt_add_title');
		}
		$data['entry_add_title'] = $this->language->get('entry_add_title');

		if (isset($this->request->post['custom_img_title_alt_add_expand'])) {
			$data['custom_img_title_alt_add_expand'] = $this->request->post['custom_img_title_alt_add_expand'];
		} else {
			$data['custom_img_title_alt_add_expand'] = $this->config->get('custom_img_title_alt_add_expand');
		}
		$data['entry_add_expand'] = $this->language->get('entry_add_expand');
#debug data
		
		$data['text_patern'] = str_replace(array("\r","\n"),'',$this->language->get('text_patern'));
		
		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/custom_img_title_alt', $data));
	}

	public function listTag() {
		$this->load->language('extension/module/custom_img_title_alt');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view']   = $this->language->get('text_view');
		$data['text_patern'] = str_replace(array("\r","\n"),'',$this->language->get('text_patern'));

		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_setting'] = $this->language->get('button_setting');

		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/module/custom_img_title_alt', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_custom_list'),
			'href' => $this->url->link('extension/module/custom_img_title_alt/listTag', 'token=' . $this->session->data['token'], true)
		);
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limt'];
		} else {
			$limit = $this->config->get('config_limit_admin');
		}

		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		$filter_data = array(
			'filter_name'	  => $filter_name,
			'start'           => ($page - 1) * $limit,
			'limit'           => $limit
		);
		
		$this->load->model('tool/custom_img_alt_title');
		
		$products = $this->model_tool_custom_img_alt_title->getAltTitles($filter_data);
		
		$data['products'] = array();
		$this->load->model('tool/image');
		foreach ($products as $product_id=>$product) {
			if (is_file(DIR_IMAGE . $product['image'])) {
				$image = $this->model_tool_image->resize($product['image'], 100, 100);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
			$data['products'][$product_id] = array(
				'image' => $image,
				'name' => $product['name'],
				'alt' => $product['alt'],
				'title' => $product['title'],
				'href' => $this->url->link('catalog/product/edit', 'token=' . $this->session->data['token'] . '&product_id=' . $product['product_id'], true)
			);
		}
		
		$data['product_total'] = $this->model_tool_custom_img_alt_title->getTotalAltTitles($filter_data);
		$product_total = $data['product_total'];
		
		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}
		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
		
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('extension/module/custom_img_title_alt/listTag', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));

		$data['filter_name'] = $filter_name;
		$data['limit'] = $limit;

		$data['setting'] = $this->url->link('extension/module/custom_img_title_alt', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		$this->load->model('localisation/language');
		$languages = $this->model_localisation_language->getLanguages();
		$data['languages'] = array();
		foreach ($languages as $language) {
			$data['languages'][$language['language_id']] = $language;			
		}
		
		$data['token'] = $this->session->data['token'];
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/custom_img_title_alt_list', $data));
	}

	public function download() {
		$template = 'product/product.tpl';
		$store_id = 0;
		
		$this->load->model('setting/setting');
		$theme = $this->model_setting_setting->getSettingValue('config_theme', $store_id);
		
		// This is only here for compatibility with old themes.
		if ($theme == 'theme_default') {
			$theme = $this->model_setting_setting->getSettingValue('theme_default_directory', $store_id);			
		}
		
		if (isset($this->request->get['path'])) {
			$path = $this->request->get['path'];
		} else {
			$path = '';
		}

		if (file_exists(DIR_CATALOG . 'view/theme/' . $theme . '/template/' . $template)) {
			$template_path = DIR_CATALOG . 'view/theme/' . $theme . '/template/' . $template;
		} else {
			$template_path = DIR_CATALOG . 'view/theme/default/template/' . $template;
		}
		$files_search[] = $template_path;
		
		if (file_exists(DIR_MODIFICATION . 'catalog/view/theme/' . $theme . '/template/' . $template)) {
			$template_path = DIR_MODIFICATION . 'catalog/view/theme/' . $theme . '/template/' . $template;
			$files_search[] = $template_path;
		} else {
			if (file_exists(DIR_MODIFICATION . 'catalog/view/theme/default/template/' . $template)) {
				$template_path = DIR_MODIFICATION . 'catalog/view/theme/default/template/' . $template;
				$files_search[] = $template_path;
			} else {
				$template_path = false;
			}
		}
		
		$controller = DIR_CATALOG . 'controller/product/product.php';
		$files_search[] = $controller;
		
		$controller_modification = DIR_MODIFICATION . 'catalog/controller/product/product.php';
		if (file_exists($controller_modification)) {
			$files_search[] = $controller_modification;
		}

		$ocmod_log = file(DIR_LOGS . "ocmod.log");
		$start=false;
		$lines = array();
		foreach ($ocmod_log as $line) {
			$pos = strpos($line,'MOD: Custom Title and Alt Product');
			if ($pos !== false) {
				$start = true;
			}
			if ($start) {
				$lines[] = $line; 
				$pos = strpos($line,'---------');
				if ($pos !== false) {
					$start = false;
				}
			}
		}
		if ($lines) {
			$fp = fopen(DIR_LOGS . 'custom_img_alt_title.log','w+');
			foreach ($lines as $line) {
				fwrite($fp, $line);
			}
			fclose($fp);
			$files_search[] = DIR_LOGS . 'custom_img_alt_title.log';
		}
		//xml
		$file_template_original = file($template_path);
		$main_img = '~(href=\"\<\?php echo \$popup; \?\>)|(src=\"\<\?php echo \$thumb; \?\>")|(src=\"\<\?php echo \$popup; \?\>")~';
		$add_img  = '~(href=\"\<\?php echo \$image\[\'popup\'\]; \?\>)|(src=\"\<\?php echo \$image\[\'thumb\'\]; \?\>")|(src=\"\<\?php echo \$image\[\'popup\'\]; \?\>")~';
		$str_replace = array();
		foreach ($file_template_original as $num=>$line) {
			if (preg_match($main_img, $line)) {
				$str_replace[$num]['original'] =  trim($line);
				$str_replace[$num]['new'] = trim(str_replace(
					array(
						'title="<?php echo $heading_title; ?>"',
						'alt="<?php echo $heading_title; ?>"'
					),
					array(
						'title="<?php echo $image_description[\'title\']; ?>"',
						'alt="<?php echo $image_description[\'alt\']; ?>"',
					),
					$line));
				
			}
			if (preg_match($add_img, $line)) {
				$str_replace[$num]['original'] = trim($line);
				$str_replace[$num]['new'] = trim(str_replace(
					array(
						'title="<?php echo $heading_title; ?>"',
						'alt="<?php echo $heading_title; ?>"'
					),
					array(
						'title="<?php echo $image[\'image_description\'][\'title\']; ?>"',
						'alt="<?php echo $image[\'image_description\'][\'alt\']; ?>"',
					),
					$line));
			}
		}
		if ($str_replace) {
			$xml = "<?xml version=\"1.0\"?>
<modification>
	<name>Custom Title and Alt Product " . $theme . "</name>
	<code>Custom Title and Alt Product " . $theme . "</code>
	<version>1.0</version>
	<author>SlaSoft</author>
		
	<file path=\"catalog/view/theme/" . $theme ."/template/" . $template . "\">
";
			
			foreach ($str_replace as $element) { 
				$xml .= "
		<operation>
			<search error=\"skip\"><![CDATA[" . $element['original'] . "]]></search>
			<add position=\"replace\"><![CDATA[" . $element['new'] . "]]></add>
		</operation>
		";
			}
			$xml .=	"
	</file>
</modification>";
			$xml_file = DIR_DOWNLOAD . "custom_img_alt_title" . $theme . ".ocmod.xml";
			$fp = fopen($xml_file,'w+');
			fwrite($fp, $xml);
			fclose($fp);
			$files_search[] = $xml_file;
		}
		
		if (class_exists ('ZipArchive')) {
			
			$dir = $this->validateDir() . $theme . '.' . time() . '.' . md5 ($theme) . '.zip';
			$file_zip = $dir;
			$zip = new ZipArchive();
			if ($zip->open($dir, ZIPARCHIVE::CREATE) !== true) {
				$this->error['warning'] = $this->language->get('error_creat_zip');
			}

			$dir = explode('/', DIR_APPLICATION);
			$dir = array_splice($dir,0,-2);
			array_shift($dir);
			$directory = implode('/',$dir);

			foreach ($files_search as $file) {
				$dir_zip = FALSE;
				$info    = pathinfo ($file);
				$folders = explode ('/', $info['dirname']);
				
				for ($i = 1; $i < count ($folders); $i++) {
					$dir_zip .= $folders[$i] . '/';
				}
				$dir_replace =  'upload' . str_replace($directory,'', $dir_zip);
				$zip->addFile($file, $dir_replace . $info['basename']);
			}
			
			$zip->close();
			header('Content-Type: application/octet-stream');
			header('Content-Disposition: attachment; filename="custom_img_alt_title.zip"');
			header('Expires: 0');
			header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
			header('Pragma: public');
			header('Content-Length: ' . filesize($file_zip));
			if (ob_get_level()) ob_end_clean();
			readfile($file_zip, 'rb');
			if (isset($xml_file)) {
				unlink($xml_file);
			}
			exit;
		}
	}

	private function validateDir() {
		$dir = DIR_UPLOAD . '/custom_img_title_extract';
		if (!is_dir ($dir)) {
			mkdir ($dir);
		}
		return $dir . '/';
	}

#debug function
	public function install() {
		$result = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_description` LIKE 'image_description'");
		if (!$result->num_rows) {
			$sql = "ALTER TABLE `" . DB_PREFIX . "product_description` ADD `image_description` TEXT NOT NULL";
			$this->db->query($sql);
		}
		$result = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_image` LIKE 'image_description'");
		if (!$result->num_rows) {
			$sql = "ALTER TABLE `" . DB_PREFIX . "product_image` ADD `image_description` TEXT NOT NULL";
			$this->db->query($sql);
		}
	}

	public function save() {
		$this->load->model('tool/custom_img_alt_title');
		$json=array();
		$this->model_tool_custom_img_alt_title->save($this->request->post);
		$json['success'] = 'ok';
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
		
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/custom_img_title_alt')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}