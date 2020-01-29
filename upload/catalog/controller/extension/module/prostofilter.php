<?php
class ControllerExtensionModuleprostofilter extends Controller {
	public function index() {
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		$category_id = end($parts);

		$this->load->model('catalog/category');

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->load->language('extension/module/prostofilter');
			
			$data['heading_title'] = $this->language->get('heading_title');

			$data['button_filter'] = $this->language->get('button_filter');
			
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));

			if (isset($this->request->get['filter'])) {
				$data['prostofilter_category'] = explode(',', $this->request->get['filter']);
			} else {
				$data['prostofilter_category'] = array();
			}

			$this->load->model('catalog/product');

			$data['prostofilter_groups'] = array();

			$prostofilter_groups = $this->model_catalog_category->getCategoryFilters($category_id);
			if ($prostofilter_groups) {
				foreach ($prostofilter_groups as $prostofilter_group) {
					if ($prostofilter_group['name'] == 'Цена') {
						if ($prostofilter_group['filter'][0]['filter_id'] == $prostofilter_group['filter'][0]['name']) {
							continue;
						}
					}
					$childen_data = array();

					foreach ($prostofilter_group['filter'] as $prostofilter) {
						$prostofilter_data = array(
							'filter_category_id' => $category_id,
							'filter_filter'      => $prostofilter['filter_id']
						);

						$childen_data[] = array(
							'prostofilter_id' => $prostofilter['filter_id'],
							'name'      => $prostofilter['name']
						);
					}

					$data['prostofilter_groups'][] = array(
						'prostofilter_group_id' => $prostofilter_group['filter_group_id'],
						'name'            => $prostofilter_group['name'],
						'prostofilter'          => $childen_data
					);
				}
				if (count($data['prostofilter_groups']) > 0) {
					return $this->load->view('extension/module/prostofilter', $data);
				}
			}
		}
	}
}