<?php
//DZ
class ControllerShippingPochtaros extends Controller {
	private $error = array();
	private $type = 'shipping';
	private $name = 'pochtaros';
	private $methods = array( 0 => array( 'name' => 'ПростоеПисьмо', 'key' => 'pismo_easy', 'price' => 'Тариф', 'max_weight' => 100 ), 1 => array( 'name' => 'ЗаказноеПисьмо', 'key' => 'pismo_zakaz', 'price' => 'Тариф', 'max_weight' => 100 ), 2 => array( 'name' => 'ЦенноеПисьмо', 'key' => 'pismo_price', 'price' => 'Доставка', 'max_weight' => 100 ), 3 => array( 'name' => 'ПростоеПисьмо1Класс', 'key' => 'pismo_easy1', 'price' => 'Тариф', 'max_weight' => 500 ), 4 => array( 'name' => 'ЗаказноеПисьмо1Класс', 'key' => 'pismo_zakaz1', 'price' => 'Тариф', 'max_weight' => 500 ), 5 => array( 'name' => 'ЦенноеПисьмо1Класс', 'key' => 'pismo_price1', 'price' => 'Доставка', 'max_weight' => 500 ), 6 => array( 'name' => 'ПростаяБандероль', 'key' => 'prostaya_banderol', 'price' => 'Тариф', 'max_weight' => 2000 ), 7 => array( 'name' => 'ЗаказнаяБандероль', 'key' => 'zakaznaya_banderol', 'price' => 'Тариф', 'max_weight' => 2000 ), 8 => array( 'name' => 'ЦеннаяБандероль', 'key' => 'tsennaya_banderol', 'price' => 'Тариф', 'max_weight' => 2000 ), 9 => array( 'name' => 'ЦеннаяБандероль', 'key' => 'tsennaya_banderol_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 2000 ), 10 => array( 'name' => 'ЦеннаяПосылка', 'key' => 'tsennaya_posylka', 'price' => 'Тариф', 'max_weight' => 20000 ), 11 => array( 'name' => 'ЦеннаяПосылка', 'key' => 'tsennaya_posylka_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 20000 ), 12 => array( 'name' => 'ЦеннаяАвиаБандероль', 'key' => 'tsennaya_aviabanderol', 'price' => 'Тариф', 'max_weight' => 2000 ), 13 => array( 'name' => 'ЦеннаяАвиаБандероль', 'key' => 'tsennaya_aviabanderol_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 2000 ), 14 => array( 'name' => 'ЦеннаяАвиаПосылка', 'key' => 'tsennaya_aviaposylka', 'price' => 'Тариф', 'max_weight' => 2500 ), 15 => array( 'name' => 'ЦеннаяАвиаПосылка', 'key' => 'tsennaya_aviaposylka_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 2500 ), 16 => array( 'name' => 'ЗаказнаяБандероль1Класс', 'key' => 'zakaznaya_banderol_1_class', 'price' => 'Тариф', 'max_weight' => 2500 ), 17 => array( 'name' => 'ЦеннаяБандероль1Класс', 'key' => 'tsennaya_banderol_1_class', 'price' => 'Тариф', 'max_weight' => 2500 ), 18 => array( 'name' => 'ЦеннаяБандероль1Класс', 'key' => 'tsennaya_banderol_1_class_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 2500 ), 19 => array( 'name' => 'МждМешокМ', 'key' => 'mzhd_meshok_m', 'price' => 'Тариф', 'max_weight' => 14500 ), 20 => array( 'name' => 'МждМешокМАвиа', 'key' => 'mzhd_meshok_m_avia', 'price' => 'Тариф', 'max_weight' => 14500 ), 21 => array( 'name' => 'МждМешокМЗаказной', 'key' => 'mzhd_meshok_m_zakaznoi', 'price' => 'Тариф', 'max_weight' => 14500 ), 22 => array( 'name' => 'МждМешокМАвиаЗаказной', 'key' => 'mzhd_meshok_m_avia_zakaznoi', 'price' => 'Тариф', 'max_weight' => 14500 ), 23 => array( 'name' => 'МждБандероль', 'key' => 'mzhd_banderol', 'price' => 'Тариф', 'max_weight' => 5000 ), 24 => array( 'name' => 'МждБандерольАвиа', 'key' => 'mzhd_banderol_avia', 'price' => 'Тариф', 'max_weight' => 5000 ), 25 => array( 'name' => 'МждБандерольЗаказная', 'key' => 'mzhd_banderol_zakaznaya', 'price' => 'Тариф', 'max_weight' => 5000 ), 26 => array( 'name' => 'МждБандерольАвиаЗаказная', 'key' => 'mzhd_banderol_avia_zakaznaya', 'price' => 'Тариф', 'max_weight' => 5000 ), 27 => array( 'name' => 'МждМелкийПакет', 'key' => 'mzhd_paket', 'price' => 'Тариф', 'max_weight' => 2000 ), 28 => array( 'name' => 'МждМелкийПакетАвиа', 'key' => 'mzhd_paket_avia', 'price' => 'Тариф', 'max_weight' => 2000 ), 29 => array( 'name' => 'МждМелкийПакетЗаказной', 'key' => 'mzhd_paket_zakaznoi', 'price' => 'Тариф', 'max_weight' => 2000 ), 30 => array( 'name' => 'МждМелкийПакетАвиаЗаказной', 'key' => 'mzhd_paket_avia_zakaznoi', 'price' => 'Тариф', 'max_weight' => 2000 ) );

	public function index() {
		$data = $this->load->language( $this->type . '/' . $this->name );
		$this->document->setTitle( $this->language->get( 'heading_title' ) );
		$data['entry_product_gabarit'] = $this->language->get( 'entry_product_gabarit' );
		$data['entry_gabarit'] = $this->language->get( 'entry_gabarit' );
		$data['entry_skidka'] = $this->language->get( 'entry_skidka' );
		$data['entry_gtotal'] = $this->language->get( 'entry_gtotal' );
		$data['text_browse'] = $this->language->get( 'text_browse' );
		$data['text_clear'] = $this->language->get( 'text_clear' );
		$data['text_edit'] = $this->language->get( 'text_edit' );
		$data['name'] = $this->name;
		$this->load->model( 'setting/setting' );
		$this->load->model( 'localisation/language' );
		$data['languages'] = $this->model_localisation_language->getLanguages(  );

		if (( $this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate(  ) )) {
			$this->model_setting_setting->editSetting( $this->name, $this->request->post );
			$this->session->data['success'] = $this->language->get( 'text_success' );
			$this->response->redirect( $this->url->link( 'extension/' . $this->type, 'token=' . $this->session->data['token'], 'SSL' ) );
		}


		if (isset( $this->error['warning'] )) {
			$data['error_warning'] = $this->error['warning'];
		}
		else {
			$data['error_warning'] = '';
		}


		if (isset( $this->error['geo_zone'] )) {
			$data['error_geo_zone'] = $this->error['geo_zone'];
		}
		else {
			$data['error_geo_zone'] = '';
		}


		if (isset( $this->error['store'] )) {
			$data['error_store'] = $this->error['store'];
		}
		else {
			$data['error_store'] = '';
		}


		if (isset( $this->error['min_weight'] )) {
			$data['error_min_weight'] = $this->error['min_weight'];
		}
		else {
			$data['error_min_weight'] = '';
		}


		if (isset( $this->error['mid_weight'] )) {
			$data['error_mid_weight'] = $this->error['mid_weight'];
		}
		else {
			$data['error_mid_weight'] = '';
		}


		if (isset( $this->error['max_weight'] )) {
			$data['error_max_weight'] = $this->error['max_weight'];
		}
		else {
			$data['error_max_weight'] = '';
		}


		if (isset( $this->error['cost'] )) {
			$data['error_cost'] = $this->error['cost'];
		}
		else {
			$data['error_cost'] = '';
		}


		if (isset( $this->error['gabarit'] )) {
			$data['error_gabarit'] = $this->error['gabarit'];
		}
		else {
			$data['error_gabarit'] = '';
		}


		if (isset( $this->error['price'] )) {
			$data['error_price'] = $this->error['price'];
		}
		else {
			$data['error_price'] = '';
		}


		if (isset( $this->error['max_products'] )) {
			$data['error_max_products'] = $this->error['max_products'];
		}
		else {
			$data['error_max_products'] = '';
		}


		if (isset( $this->error['min_order'] )) {
			$data['error_min_order'] = $this->error['min_order'];
		}
		else {
			$data['error_min_order'] = '';
		}


		if (isset( $this->error['max_order'] )) {
			$data['error_max_order'] = $this->error['max_order'];
		}
		else {
			$data['error_max_order'] = '';
		}


		if (isset( $this->error['min_weight2'] )) {
			$data['error_min_weight2'] = $this->error['min_weight2'];
		}
		else {
			$data['error_min_weight2'] = '';
		}


		if (isset( $this->error['max_weight2'] )) {
			$data['error_max_weight2'] = $this->error['max_weight2'];
		}
		else {
			$data['error_max_weight2'] = '';
		}


		if (isset( $this->error['total'] )) {
			$data['error_total'] = $this->error['total'];
		}
		else {
			$data['error_total'] = '';
		}


		if (isset( $this->error['max_total'] )) {
			$data['error_max_total'] = $this->error['max_total'];
		}
		else {
			$data['error_max_total'] = '';
		}


		if (isset( $this->error['upakovka'] )) {
			$data['error_upakovka'] = $this->error['upakovka'];
		}
		else {
			$data['error_upakovka'] = '';
		}


		if (isset( $this->error['procent_price'] )) {
			$data['error_procent_price'] = $this->error['procent_price'];
		}
		else {
			$data['error_procent_price'] = '';
		}


		if (isset( $this->error['city'] )) {
			$data['error_city'] = $this->error['city'];
		}
		else {
			$data['error_city'] = '';
		}

		foreach ($this->methods as $key => $method) {
			$this->methods[$key]['title'] = $this->language->get( 'text_' . $method['key'] );
		}

		$data['methods'] = $this->methods;

		if (isset( $this->request->post[$this->name . '_image'] )) {
			$data['image'] = $this->request->post[$this->name . '_image'];
		}
		else {
			if ($this->config->get( $this->name . '_image' )) {
				$data['image'] = $this->config->get( $this->name . '_image' );
			}
			else {
				$data['image'] = '';
			}
		}

		$this->load->model( 'tool/image' );

		if (( isset( $this->request->post[$this->name . '_image'] ) && is_file( DIR_IMAGE . $this->request->post[$this->name . '_image'] ) )) {
			$data['thumb'] = $this->model_tool_image->resize( $this->request->post[$this->name . '_image'], 100, 100 );
		}
		else {
			if (( $this->config->get( $this->name . '_image' ) && is_file( DIR_IMAGE . $this->config->get( $this->name . '_image' ) ) )) {
				$data['thumb'] = $this->model_tool_image->resize( $this->config->get( $this->name . '_image' ), 100, 100 );
			}
			else {
				$data['thumb'] = $this->model_tool_image->resize( 'no_image.png', 100, 100 );
			}
		}

		$data['placeholder'] = $this->model_tool_image->resize( 'no_image.png', 100, 100 );
		$data['token'] = $this->session->data['token'];
		$data['breadcrumbs'] = array(  );
		$data['breadcrumbs'][] = array( 'text' => $this->language->get( 'text_home' ), 'href' => $this->url->link( 'common/dashboard', 'token=' . $this->session->data['token'], 'SSL' ), 'separator' => false );
		$data['breadcrumbs'][] = array( 'text' => $this->language->get( 'text_' . $this->type ), 'href' => $this->url->link( 'extension/' . $this->type, 'token=' . $this->session->data['token'], 'SSL' ), 'separator' => ' :: ' );
		$data['breadcrumbs'][] = array( 'text' => $this->language->get( 'heading_title' ), 'href' => $this->url->link( $this->type . '/' . $this->name, 'token=' . $this->session->data['token'], 'SSL' ), 'separator' => ' :: ' );
		$data['action'] = $this->url->link( $this->type . '/' . $this->name, 'token=' . $this->session->data['token'], 'SSL' );
		$data['cancel'] = $this->url->link( 'extension/' . $this->type, 'token=' . $this->session->data['token'], 'SSL' );

		if (isset( $this->request->post[$this->name . '_name'] )) {
			$data[$this->name . '_name'] = $this->request->post[$this->name . '_name'];
		}
		else {
			$data[$this->name . '_name'] = $this->config->get( $this->name . '_name' );
		}


		if (isset( $this->request->post[$this->name . '_city'] )) {
			$data[$this->name . '_city'] = $this->request->post[$this->name . '_city'];
		}
		else {
			$data[$this->name . '_city'] = $this->config->get( $this->name . '_city' );
		}


		if (isset( $this->request->post[$this->name . '_cost'] )) {
			$data[$this->name . '_cost'] = $this->request->post[$this->name . '_cost'];
		}
		else {
			$data[$this->name . '_cost'] = $this->config->get( $this->name . '_cost' );
		}


		if (( $this->request->server['REQUEST_METHOD'] == 'POST' && isset( $this->request->post[$this->name . '_geo_zone'] ) )) {
			$data[$this->name . '_geo_zone'] = $this->request->post[$this->name . '_geo_zone'];
		}
		else {
			if (( $this->request->server['REQUEST_METHOD'] == 'POST' && !isset( $this->request->post[$this->name . '_geo_zone'] ) )) {
				$data[$this->name . '_geo_zone'] = array(  );
			}
			else {
				$data[$this->name . '_geo_zone'] = $this->config->get( $this->name . '_geo_zone' );
			}
		}


		if (( $this->request->server['REQUEST_METHOD'] == 'POST' && isset( $this->request->post[$this->name . '_store'] ) )) {
			$data[$this->name . '_store'] = $this->request->post[$this->name . '_store'];
		}
		else {
			if (( $this->request->server['REQUEST_METHOD'] == 'POST' && !isset( $this->request->post[$this->name . '_store'] ) )) {
				$data[$this->name . '_store'] = array(  );
			}
			else {
				$data[$this->name . '_store'] = $this->config->get( $this->name . '_store' );
			}
		}


		if (isset( $this->request->post[$this->name . '_method'] )) {
			$data[$this->name . '_method'] = $this->request->post[$this->name . '_method'];
		}
		else {
			$data[$this->name . '_method'] = $this->config->get( $this->name . '_method' );
		}


		if (isset( $this->request->post[$this->name . '_status'] )) {
			$data[$this->name . '_status'] = $this->request->post[$this->name . '_status'];
		}
		else {
			$data[$this->name . '_status'] = $this->config->get( $this->name . '_status' );
		}


		if (isset( $this->request->post[$this->name . '_fragmentation'] )) {
			$data[$this->name . '_fragmentation'] = $this->request->post[$this->name . '_fragmentation'];
		}
		else {
			$data[$this->name . '_fragmentation'] = $this->config->get( $this->name . '_fragmentation' );
		}


		if (isset( $this->request->post[$this->name . '_zaglushka'] )) {
			$data[$this->name . '_zaglushka'] = $this->request->post[$this->name . '_zaglushka'];
		}
		else {
			$data[$this->name . '_zaglushka'] = $this->config->get( $this->name . '_zaglushka' );
		}


		if (isset( $this->request->post[$this->name . '_nalozhka'] )) {
			$data[$this->name . '_nalozhka'] = $this->request->post[$this->name . '_nalozhka'];
		}
		else {
			$data[$this->name . '_nalozhka'] = $this->config->get( $this->name . '_nalozhka' );
		}


		if (isset( $this->request->post[$this->name . '_bibbtext'] )) {
			$data[$this->name . '_bibbtext'] = $this->request->post[$this->name . '_bibbtext'];
		}
		else {
			$data[$this->name . '_bibbtext'] = $this->config->get( $this->name . '_bibbtext' );
		}


		if (isset( $this->request->post[$this->name . '_time'] )) {
			$data[$this->name . '_time'] = $this->request->post[$this->name . '_time'];
		}
		else {
			$data[$this->name . '_time'] = $this->config->get( $this->name . '_time' );
		}

		$this->load->model( 'localisation/tax_class' );
		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		if (isset( $this->request->post[$this->name . '_tax_class_id'] )) {
			$data[$this->name . '_tax_class_id'] = $this->request->post[$this->name . '_tax_class_id'];
		}
		else {
			$data[$this->name . '_tax_class_id'] = $this->config->get( $this->name . '_tax_class_id' );
		}


		if (isset( $this->request->post[$this->name . '_sort_order'] )) {
			$data[$this->name . '_sort_order'] = $this->request->post[$this->name . '_sort_order'];
		}
		else {
			$data[$this->name . '_sort_order'] = $this->config->get( $this->name . '_sort_order' );
		}


		if (isset( $this->request->post[$this->name . '_procent_price'] )) {
			$data[$this->name . '_procent_price'] = $this->request->post[$this->name . '_procent_price'];
		}
		else {
			$data[$this->name . '_procent_price'] = $this->config->get( $this->name . '_procent_price' );
		}


		if (isset( $this->request->post[$this->name . '_total'] )) {
			$data[$this->name . '_total'] = $this->request->post[$this->name . '_total'];
		}
		else {
			$data[$this->name . '_total'] = $this->config->get( $this->name . '_total' );
		}


		if (isset( $this->request->post[$this->name . '_max_total'] )) {
			$data[$this->name . '_max_total'] = $this->request->post[$this->name . '_max_total'];
		}
		else {
			$data[$this->name . '_max_total'] = $this->config->get( $this->name . '_max_total' );
		}


		if (isset( $this->request->post[$this->name . '_mid_weight'] )) {
			$data[$this->name . '_mid_weight'] = $this->request->post[$this->name . '_mid_weight'];
		}
		else {
			$data[$this->name . '_mid_weight'] = $this->config->get( $this->name . '_mid_weight' );
		}


		if (isset( $this->request->post[$this->name . '_min_weight'] )) {
			$data[$this->name . '_min_weight'] = $this->request->post[$this->name . '_min_weight'];
		}
		else {
			$data[$this->name . '_min_weight'] = $this->config->get( $this->name . '_min_weight' );
		}


		if (isset( $this->request->post[$this->name . '_max_weight'] )) {
			$data[$this->name . '_max_weight'] = $this->request->post[$this->name . '_max_weight'];
		}
		else {
			$data[$this->name . '_max_weight'] = $this->config->get( $this->name . '_max_weight' );
		}


		if (isset( $this->request->post[$this->name . '_upakovka'] )) {
			$data[$this->name . '_upakovka'] = $this->request->post[$this->name . '_upakovka'];
		}
		else {
			$data[$this->name . '_upakovka'] = $this->config->get( $this->name . '_upakovka' );
		}


		if (isset( $this->request->post[$this->name . '_mstatus'] )) {
			$data[$this->name . '_mstatus'] = $this->request->post[$this->name . '_mstatus'];
		}
		else {
			$data[$this->name . '_mstatus'] = $this->config->get( $this->name . '_mstatus' );
		}


		if (isset( $this->request->post[$this->name . '_price'] )) {
			$data[$this->name . '_price'] = $this->request->post[$this->name . '_price'];
		}
		else {
			$data[$this->name . '_price'] = $this->config->get( $this->name . '_price' );
		}


		if (isset( $this->request->post[$this->name . '_max_products'] )) {
			$data[$this->name . '_max_products'] = $this->request->post[$this->name . '_max_products'];
		}
		else {
			$data[$this->name . '_max_products'] = $this->config->get( $this->name . '_max_products' );
		}


		if (isset( $this->request->post[$this->name . '_min_order'] )) {
			$data[$this->name . '_min_order'] = $this->request->post[$this->name . '_min_order'];
		}
		else {
			$data[$this->name . '_min_order'] = $this->config->get( $this->name . '_min_order' );
		}


		if (isset( $this->request->post[$this->name . '_max_order'] )) {
			$data[$this->name . '_max_order'] = $this->request->post[$this->name . '_max_order'];
		}
		else {
			$data[$this->name . '_max_order'] = $this->config->get( $this->name . '_max_order' );
		}


		if (isset( $this->request->post[$this->name . '_min_weight2'] )) {
			$data[$this->name . '_min_weight2'] = $this->request->post[$this->name . '_min_weight2'];
		}
		else {
			$data[$this->name . '_min_weight2'] = $this->config->get( $this->name . '_min_weight2' );
		}


		if (isset( $this->request->post[$this->name . '_max_weight2'] )) {
			$data[$this->name . '_max_weight2'] = $this->request->post[$this->name . '_max_weight2'];
		}
		else {
			$data[$this->name . '_max_weight2'] = $this->config->get( $this->name . '_max_weight2' );
		}


		if (isset( $this->request->post[$this->name . '_incity'] )) {
			$data[$this->name . '_incity'] = $this->request->post[$this->name . '_incity'];
		}
		else {
			$data[$this->name . '_incity'] = $this->config->get( $this->name . '_incity' );
		}


		if (isset( $this->request->post[$this->name . '_outcity'] )) {
			$data[$this->name . '_outcity'] = $this->request->post[$this->name . '_outcity'];
		}
		else {
			$data[$this->name . '_outcity'] = $this->config->get( $this->name . '_outcity' );
		}


		if (isset( $this->request->post[$this->name . '_description'] )) {
			$data[$this->name . '_description'] = $this->request->post[$this->name . '_description'];
		}
		else {
			$data[$this->name . '_description'] = $this->config->get( $this->name . '_description' );
		}

		$this->load->model( 'localisation/weight_class' );
		$data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		if (isset( $this->request->post[$this->name . '_weight_class_id'] )) {
			$data[$this->name . '_weight_class_id'] = $this->request->post[$this->name . '_weight_class_id'];
		}
		else {
			if ($this->config->get( $this->name . '_weight_class_id' )) {
				$data[$this->name . '_weight_class_id'] = $this->config->get( $this->name . '_weight_class_id' );
			}
			else {
				if (isset( $weight_info )) {
					$data[$this->name . '_weight_class_id'] = $this->config->get( 'config_weight_class_id' );
				}
			}
		}


		if (isset( $this->request->post[$this->name . '_zone_id'] )) {
			$data[$this->name . '_zone_id'] = $this->request->post[$this->name . '_zone_id'];
		}
		else {
			$data[$this->name . '_zone_id'] = $this->config->get( $this->name . '_zone_id' );
		}


		if (isset( $this->request->post[$this->name . '_total_value'] )) {
			$data[$this->name . '_total_value'] = $this->request->post[$this->name . '_total_value'];
		}
		else {
			$data[$this->name . '_total_value'] = $this->config->get( $this->name . '_total_value' );
		}


		if (isset( $this->request->post[$this->name . '_round'] )) {
			$data[$this->name . '_round'] = $this->request->post[$this->name . '_round'];
		}
		else {
			$data[$this->name . '_round'] = $this->config->get( $this->name . '_round' );
		}


		if (isset( $this->request->post[$this->name . '_payment'] )) {
			$data[$this->name . '_payment'] = $this->request->post[$this->name . '_payment'];
		}
		else {
			$data[$this->name . '_payment'] = $this->config->get( $this->name . '_payment' );
		}


		if ($this->config->get( $this->name . '_license' )) {
			$data[$this->name . '_license'] = $this->config->get( $this->name . '_license' );
		}
		else {
			$data[$this->name . '_license'] = '';
		}

		$data['config_language_id'] = $this->config->get( 'config_language_id' );
		$this->load->model( 'localisation/zone' );
		$data['zones'] = $this->model_localisation_zone->getZonesByCountryId( 176 );
		$this->load->model( 'setting/store' );
		$stores = $this->model_setting_store->getStores();
		$data['text_default'] = str_replace( '<b>', '', $data['text_default'] );
		$data['text_default'] = str_replace( '</b>', '', $data['text_default'] );
		$array_default_store = array( 'store_id' => 0, 'name' => $data['text_default'] );
		$data['stores'][] = $array_default_store;
		foreach ($stores as $val) {
			$data['stores'][] = $val;
		}

		foreach ($data['stores'] as $key => $store) {
			$data['stores'][$key]['name'] = preg_replace( '|[^abcdefghijklmnopqrstuvwxyzабвгдежзийклмнопрстуфхцчшщъыьэюяё0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯЁ ]|', '', $store['name'] );
		}

		$this->load->model( 'localisation/geo_zone' );
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		$query = $this->db->query( 'SELECT * FROM ' . DB_PREFIX . 'extension WHERE `type` = \'total\'' );
		$order_totals = $query->rows;
		$sort_order = array();
		foreach ($order_totals as $key => $value) {
			$sort_order[$key] = $this->config->get( $value['code'] . '_sort_order' );
		}

		array_multisort( $sort_order, SORT_ASC, $order_totals );
		$arr_totals = array();
		foreach ($order_totals as $ot) {

			if ($ot['code'] != $this->type) {
				if ($this->config->get( $ot['code'] . '_status' )) {
					$this->load->language( 'total/' . $ot['code'] );
					$arr_totals[$ot['code']] = $this->language->get( 'heading_title' );
					continue;
				}

				continue;
			}
		}

		$data['totals'] = $arr_totals;
		$this->load->model( 'module/payments' );
		$data['payments'] = $this->model_module_payments->getAllPaymentNames();

		if (( file_exists( DIR_APPLICATION . '/model/localisation/product_gabarit.php' ) && file_exists( str_replace( 'system/logs', 'vqmod/xml', DIR_LOGS ) . 'product_gabarit_pochtaros.xml' ) )) {
			$this->load->model( 'localisation/product_gabarit' );
			$data['product_gabarits'] = $this->model_localisation_product_gabarit->getProductGabarits();
			foreach ($this->methods as $method) {

				if (( $this->request->server['REQUEST_METHOD'] == 'POST' && isset( $this->request->post['pochtaros_gabarit'][$method['key']] ) )) {
					$data['pochtaros_gabarit'][$method['key']] = $this->request->post['pochtaros_gabarit'][$method['key']];
				}
				else {
					if (( $this->request->server['REQUEST_METHOD'] == 'POST' && !isset( $this->request->post['pochtaros_gabarit'][$method['key']] ) )) {
						$data['pochtaros_gabarit'][$method['key']] = array();
					}
					else {
						$local_gabarit = $this->config->get( 'pochtaros_gabarit' );

						if (isset( $local_gabarit[$method['key']] )) {
							$data['pochtaros_gabarit'][$method['key']] = $local_gabarit[$method['key']];
						}
					}
				}


				if (( $this->request->server['REQUEST_METHOD'] == 'POST' && isset( $this->request->post['pochtaros_discount'][$method['key']] ) )) {
					$data['discount'][$method['key']] = $this->request->post['pochtaros_discount'][$method['key']];
					continue;
				}


				if (( $this->request->server['REQUEST_METHOD'] == 'POST' && !isset( $this->request->post['pochtaros_discount'][$method['key']] ) )) {
					$data['discount'][$method['key']] = array(  );
					continue;
				}

				$local_discount = $this->config->get( 'pochtaros_discount' );

				if (isset( $local_discount[$method['key']] )) {
					$data['discount'][$method['key']] = $local_discount[$method['key']];
					continue;
				}
			}
		}

		$data['text_default'] = $this->config->get( 'config_name' );
		$data['header'] = $this->load->controller( 'common/header' );
		$data['column_left'] = $this->load->controller( 'common/column_left' );
		$data['footer'] = $this->load->controller( 'common/footer' );
		$this->response->setOutput( $this->load->view( $this->type . '/' . $this->name . '.tpl', $data ) );
	}

	public function validate() {
		$this->load->model( 'localisation/language' );
		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (!$this->user->hasPermission( 'modify', $this->type . '/' . $this->name )) {
			$this->error['warning'] = $this->language->get( 'error_permission' );
		}

		$active_methods = false;
		foreach ($this->request->post[$this->name . '_mstatus'] as $key => $val) {
			$active = false;
			foreach ($data['languages'] as $language) {

				if (( isset( $val[$language['language_id']] ) && $val[$language['language_id']] == 1 )) {
					$active = true;
					$active_methods = true;
					break;
					continue;
				}
			}


			if ($active == true) {
				if (( file_exists( DIR_APPLICATION . '/model/localisation/product_gabarit.php' ) && file_exists( str_replace( 'system/logs', 'vqmod/xml', DIR_LOGS ) . 'product_gabarit_pochtaros.xml' ) )) {
					if (!isset( $this->request->post['pochtaros_gabarit'][$key] )) {
						$this->error['gabarit'][$key] = $this->language->get( 'error_gabarit' );
					}
				}


				if (( ( isset( $this->request->post[$this->name . '_max_products'][$key] ) && !empty( $this->request->post[$this->name . '_max_products'][$key] ) ) && !ctype_digit( $this->request->post[$this->name . '_max_products'][$key] ) )) {
					$this->error['max_products'][$key] = $this->language->get( 'error_number' );
				}


				if (( ( isset( $this->request->post[$this->name . '_min_order'][$key] ) && !empty( $this->request->post[$this->name . '_min_order'][$key] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_min_order'][$key] ) )) {
					$this->error['min_order'][$key] = $this->language->get( 'error_decimal' );
				}


				if (( ( isset( $this->request->post[$this->name . '_max_order'][$key] ) && !empty( $this->request->post[$this->name . '_max_order'][$key] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_max_order'][$key] ) )) {
					$this->error['max_order'][$key] = $this->language->get( 'error_decimal' );
				}


				if (( ( isset( $this->request->post[$this->name . '_min_weight2'][$key] ) && !empty( $this->request->post[$this->name . '_min_weight2'][$key] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_min_weight2'][$key] ) )) {
					$this->error['min_weight2'][$key] = $this->language->get( 'error_decimal' );
				}


				if (( ( isset( $this->request->post[$this->name . '_max_weight2'][$key] ) && !empty( $this->request->post[$this->name . '_max_weight2'][$key] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_max_weight2'][$key] ) )) {
					$this->error['max_weight2'][$key] = $this->language->get( 'error_decimal' );
				}


				if (( ( isset( $this->request->post[$this->name . '_price'][$key] ) && !empty( $this->request->post[$this->name . '_price'][$key] ) ) && !ctype_digit( $this->request->post[$this->name . '_price'][$key] ) )) {
					$this->error['price'][$key] = $this->language->get( 'error_number' );
					continue;
				}

				continue;
			}
		}


		if ($active_methods == false) {
			$this->error['warning'] = $this->language->get( 'error_methods' );
		}


		if (( !ctype_digit( $this->request->post[$this->name . '_city'] ) || strlen( $this->request->post[$this->name . '_city'] ) != 6 )) {
			$this->error['city'] = $this->language->get( 'error_city' );
		}


		if (!isset( $this->request->post[$this->name . '_geo_zone'] )) {
			$this->error['geo_zone'] = $this->language->get( 'error_geo_zone' );
		}


		if (!isset( $this->request->post[$this->name . '_store'] )) {
			$this->error['store'] = $this->language->get( 'error_store' );
		}


		if (( ( isset( $this->request->post[$this->name . '_mid_weight'] ) && !empty( $this->request->post[$this->name . '_mid_weight'] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_mid_weight'] ) )) {
			$this->error['mid_weight'] = $this->language->get( 'error_decimal' );
		}


		if (( ( isset( $this->request->post[$this->name . '_min_weight'] ) && !empty( $this->request->post[$this->name . '_min_weight'] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_min_weight'] ) )) {
			$this->error['min_weight'] = $this->language->get( 'error_decimal' );
		}


		if (( ( isset( $this->request->post[$this->name . '_max_weight'] ) && !empty( $this->request->post[$this->name . '_max_weight'] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_max_weight'] ) )) {
			$this->error['max_weight'] = $this->language->get( 'error_decimal' );
		}


		if (( ( isset( $this->request->post[$this->name . '_cost'] ) && !empty( $this->request->post[$this->name . '_cost'] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', abs( $this->request->post[$this->name . '_cost'] ) ) )) {
			$this->error['cost'] = $this->language->get( 'error_number' );
		}


		if (( ( isset( $this->request->post[$this->name . '_total'] ) && !empty( $this->request->post[$this->name . '_total'] ) ) && !ctype_digit( $this->request->post[$this->name . '_total'] ) )) {
			$this->error['total'] = $this->language->get( 'error_number' );
		}


		if (( ( isset( $this->request->post[$this->name . '_max_total'] ) && !empty( $this->request->post[$this->name . '_max_total'] ) ) && !ctype_digit( $this->request->post[$this->name . '_max_total'] ) )) {
			$this->error['max_total'] = $this->language->get( 'error_number' );
		}


		if (( ( isset( $this->request->post[$this->name . '_upakovka'] ) && !empty( $this->request->post[$this->name . '_upakovka'] ) ) && !preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_upakovka'] ) )) {
			$this->error['upakovka'] = $this->language->get( 'error_decimal' );
		}


		if (( isset( $this->request->post[$this->name . '_procent_price'] ) && !empty( $this->request->post[$this->name . '_procent_price'] ) )) {
			if (!preg_match( '/^[0-9]{1,}(\.[0-9]{0,5})?$/', $this->request->post[$this->name . '_procent_price'] )) {
				$this->error['procent_price'] = $this->language->get( 'error_decimal' );
			}
			else {
				if (( $this->request->post[$this->name . '_procent_price'] < 1 || 100 < $this->request->post[$this->name . '_procent_price'] )) {
					$this->error['procent_price'] = $this->language->get( 'error_procent' );
				}
			}
		}


		if (( $this->error && !isset( $this->error['warning'] ) )) {
			$this->error['warning'] = $this->language->get( 'error_warning' );
		}

		return !$this->error;
	}
}

