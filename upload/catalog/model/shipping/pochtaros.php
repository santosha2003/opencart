<?php
class ModelShippingPochtaros extends Model {
    private $error = array();
    private $type = 'shipping';
   	private $name = 'pochtaros';

    private $methods = array(
        array('name' => 'ПростоеПисьмо', 'key' => 'pismo_easy', 'price' => 'Тариф', 'max_weight' => 100),
        array('name' => 'ЗаказноеПисьмо', 'key' => 'pismo_zakaz', 'price' => 'Тариф', 'max_weight' => 100),
        array('name' => 'ЦенноеПисьмо', 'key' => 'pismo_price', 'price' => 'Доставка', 'max_weight' => 100),
        array('name' => 'ПростоеПисьмо1Класс', 'key' => 'pismo_easy1', 'price' => 'Тариф', 'max_weight' => 500),
        array('name' => 'ЗаказноеПисьмо1Класс', 'key' => 'pismo_zakaz1', 'price' => 'Тариф', 'max_weight' => 500),
        array('name' => 'ЦенноеПисьмо1Класс', 'key' => 'pismo_price1', 'price' => 'Доставка', 'max_weight' => 500),

        array('name' => 'ПростаяБандероль', 'key' => 'prostaya_banderol', 'price' => 'Тариф', 'max_weight' => 2000),
        array('name' => 'ЗаказнаяБандероль', 'key' => 'zakaznaya_banderol', 'price' => 'Тариф', 'max_weight' => 2000),
        array('name' => 'ЦеннаяБандероль', 'key' => 'tsennaya_banderol', 'price' => 'Тариф', 'max_weight' => 2000),
        array('name' => 'ЦеннаяБандероль', 'key' => 'tsennaya_banderol_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 2000),
        array('name' => 'ЦеннаяПосылка', 'key' => 'tsennaya_posylka', 'price' => 'Тариф', 'max_weight' => 20000),
        array('name' => 'ЦеннаяПосылка', 'key' => 'tsennaya_posylka_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 20000),
        array('name' => 'ЦеннаяАвиаБандероль', 'key' => 'tsennaya_aviabanderol', 'price' => 'Тариф', 'max_weight' => 2000),
        array('name' => 'ЦеннаяАвиаБандероль', 'key' => 'tsennaya_aviabanderol_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 2000),
        array('name' => 'ЦеннаяАвиаПосылка', 'key' => 'tsennaya_aviaposylka', 'price' => 'Тариф', 'max_weight' => 2500),
        array('name' => 'ЦеннаяАвиаПосылка', 'key' => 'tsennaya_aviaposylka_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 2500),
        array('name' => 'ЗаказнаяБандероль1Класс', 'key' => 'zakaznaya_banderol_1_class', 'price' => 'Тариф', 'max_weight' => 2500),
        array('name' => 'ЦеннаяБандероль1Класс', 'key' => 'tsennaya_banderol_1_class', 'price' => 'Тариф', 'max_weight' => 2500),
        array('name' => 'ЦеннаяБандероль1Класс', 'key' => 'tsennaya_banderol_1_class_obyavlennaya_stennost', 'price' => 'Доставка', 'max_weight' => 2000),

        array('name' => 'МждМешокМ', 'key' => 'mzhd_meshok_m', 'price' => 'Тариф', 'max_weight' => 14500),
        array('name' => 'МждМешокМАвиа', 'key' => 'mzhd_meshok_m_avia', 'price' => 'Тариф', 'max_weight' => 14500),
        array('name' => 'МждМешокМЗаказной', 'key' => 'mzhd_meshok_m_zakaznoi', 'price' => 'Тариф', 'max_weight' => 14500),
        array('name' => 'МждМешокМАвиаЗаказной', 'key' => 'mzhd_meshok_m_avia_zakaznoi', 'price' => 'Тариф', 'max_weight' => 14500),
        array('name' => 'МждБандероль', 'key' => 'mzhd_banderol', 'price' => 'Тариф', 'max_weight' => 5000),
        array('name' => 'МждБандерольАвиа', 'key' => 'mzhd_banderol_avia', 'price' => 'Тариф', 'max_weight' => 5000),
        array('name' => 'МждБандерольЗаказная', 'key' => 'mzhd_banderol_zakaznaya', 'price' => 'Тариф', 'max_weight' => 5000),
        array('name' => 'МждБандерольАвиаЗаказная', 'key' => 'mzhd_banderol_avia_zakaznaya', 'price' => 'Тариф', 'max_weight' => 5000),
        array('name' => 'МждМелкийПакет', 'key' => 'mzhd_paket', 'price' => 'Тариф', 'max_weight' => 2000),
        array('name' => 'МждМелкийПакетАвиа', 'key' => 'mzhd_paket_avia', 'price' => 'Тариф', 'max_weight' => 2000),
        array('name' => 'МждМелкийПакетЗаказной', 'key' => 'mzhd_paket_zakaznoi', 'price' => 'Тариф', 'max_weight' => 2000),
        array('name' => 'МждМелкийПакетАвиаЗаказной', 'key' => 'mzhd_paket_avia_zakaznoi', 'price' => 'Тариф', 'max_weight' => 2000)
    );


	public function getQuote($address) {
        $this->language->load($this->type . '/' . $this->name);

        foreach ($this->methods as $key => $method) {
            $this->methods[$key]['title'] = $this->language->get('text_'.$method['key']);
        }

        $method_data = array();


        $total_products = $this->cart->countProducts();

        $total_data = array();
        $order_total = 0;
        $taxes = $this->cart->getTaxes();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = 'total'");
        $order_totals = $query->rows;
        $sort_order = array();
        foreach ($order_totals as $k => $value) {
            $sort_order[$k] = $this->config->get($value['code'] . '_sort_order');
        }
        array_multisort($sort_order, SORT_ASC, $order_totals);

        foreach ($order_totals as $ot) {
            if ($ot['code'] != $this->type) {
                if ($this->config->get($ot['code'] . '_status')) {
                    $this->load->model('total/' . $ot['code']);
                    $this->{'model_total_' . $ot['code']}->getTotal($total_data, $order_total, $taxes);
                }
            }

            if ($ot['code'] == $this->config->get('pochtaros_total_value')) {
                break;
            }
        }

        $total = $order_total;

        if (is_array($this->config->get('pochtaros_store')) and in_array((int)$this->config->get('config_store_id'), $this->config->get('pochtaros_store'))) {
            $status = true;
        }
        else {
            return $method_data;
        }


        if ($status and count($this->config->get('pochtaros_geo_zone')) > 0) {

            if ($this->config->get('pochtaros_image')) {
                $image = $this->config->get('pochtaros_image');
            }
            else {
                $image = '';
            }

            if (!isset($address['country_id']) or (isset($address['country_id']) and $address['country_id'] == '')) {
                $address['country_id'] = 176;
            }

            if (!isset($address['zone_id']) or (isset($address['zone_id']) and $address['zone_id'] == '')) {
                $address['zone_id'] = $this->config->get('pochtaros_zone_id');

                if ((int)$address['zone_id'] > 0) {
                    $this->load->model('localisation/zone');
                    $zone_info = $this->model_localisation_zone->getZone($address['zone_id']);

                    if (isset($zone_info['name'])) {
                        $address['zone'] = $zone_info['name'];
                    }
                }
            }

            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone
                WHERE geo_zone_id IN (" . implode(',', $this->config->get('pochtaros_geo_zone')) . ") AND
                country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

            if ($query->num_rows) {
                $status = true;
            }
            else {
                return $method_data;
            }
        }
        else {
            return $method_data;
        }


        $weight = $this->weight->convert($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->config->get('pochtaros_weight_class_id'));

        if ($status) {
            if ($weight == 0 and $this->config->get('pochtaros_mid_weight') and (float)$this->config->get('pochtaros_mid_weight') > 0 ) {
                $weight = $weight + $this->config->get('pochtaros_mid_weight');
            }

            if ($this->config->get('pochtaros_upakovka') and (float)$this->config->get('pochtaros_upakovka') > 0 ) {
                $weight = $weight + $this->config->get('pochtaros_upakovka');
            }

            if ($this->config->get('pochtaros_min_weight') and $weight < $this->config->get('pochtaros_min_weight') ) {
                $status = false;
            }

            if ($this->config->get('pochtaros_max_weight') and $weight > $this->config->get('pochtaros_max_weight') ) {
                $status = false;
            }

            if ((float)$this->config->get('pochtaros_max_total') > 0 and $total >= (float)$this->config->get('pochtaros_max_total')) {
                $status = false;
            }
        }

        if ($status == false) {
            return $method_data;
        }

        $weight2 = $weight;

        if ($status) {
            $weight = $this->weight->convert($weight, $this->config->get('pochtaros_weight_class_id'), $this->config->get('config_weight_class_id'));

            $weight_name = trim($this->weight->getUnit($this->config->get('config_weight_class_id')));

            if ($weight_name == 'кг' or $weight_name == 'kg') {
                $weight = $weight*1000;
            }

            $region = array();
            $region['from'] = $this->config->get('pochtaros_city');

            if (isset($address['postcode']) and $address['postcode'] != '') {
                $region['to'] = trim($address['postcode']);
            }
            else {
                $region['to'] = $address['zone'];

                $this->load->model('localisation/zone_dv');
                $new_region = $this->model_localisation_zone_dv->getZone($region);

                if (isset($new_region['to']) and $new_region['to']) {
                    $region['to'] = $new_region['to'];
                }
            }

            $from = urlencode($region['from']);
            $to = urlencode($region['to']);


            $server = str_replace("http:", '', HTTP_SERVER);
            $server = str_replace("www.", '', $server);
            $server = str_replace("/", '', $server);

            //$url = 'http://ocstore1541.hypnoguru.ru/pochtaros.php';

            if ($this->config->get('pochtaros_procent_price') == '' or $this->config->get('pochtaros_procent_price') == 100) {
                $local_total = $total;
            }
            else {
                $local_total = $total / 100 * $this->config->get('pochtaros_procent_price');
            }

            $url = 'http://api.postcalc.ru/';

            if ($address['iso_code_2'] != 'RU') {
                $Request = $url.'?f='.$from.'&t='.$to.'&c='.$address['iso_code_2'].'&w='.$weight.'&v='.$local_total.'&o=php&e=0&st='.$server.'&ml='.$this->config->get('config_email').'&cs=utf-8&pn='.$this->to_seo($this->config->get('config_owner'));
            }
            else {
                $Request = $url.'?f='.$from.'&t='.$to.'&w='.$weight.'&v='.$local_total.'&o=php&e=0&st='.$server.'&ml='.$this->config->get('config_email').'&cs=utf-8&pn='.$this->to_seo($this->config->get('config_owner'));
            }


            $url2 = "http://api.print-post.com/";

            $Request2_1 = $url2.'api/sendprice/v2/?weight='.$weight.'&from_index='.$from.'&to_index='.$to;
            $Request2_2 = $url2.'api/sendprice/v2/?weight='.$weight.'&summ='.$local_total.'&from_index='.$from.'&to_index='.$to;


            //echo "<--".$Request."-->";


            if ($total < (float)$this->config->get('pochtaros_total')) {
                $error_text = html_entity_decode(sprintf($this->language->get('error_description'), $this->currency->format($this->tax->calculate($this->config->get('pochtaros_total'), $this->config->get($this->name.'_tax_class_id'),  $this->config->get('config_tax'))), $this->currency->format($this->tax->calculate($this->config->get('pochtaros_total')-$total, $this->config->get($this->name.'_tax_class_id'),  $this->config->get('config_tax')))), ENT_QUOTES, 'UTF-8');
            }

            if (isset($error_text)){
                 $error = $error_text;
            }
            else {
                 $error = false;
            }

            if ($error == false) {
                $curl = curl_init();

                curl_setopt($curl, CURLOPT_URL, $Request);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

                $Response = curl_exec($curl);

                if ($Response === false) {
                    echo 'Curl error: ' . curl_error($curl);
                }


                curl_setopt($curl, CURLOPT_URL, $Request2_1);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

                $Response2_1 = curl_exec($curl);

                if ($Response2_1 === false) {
                    echo 'Curl error: ' . curl_error($curl);
                }

                curl_setopt($curl, CURLOPT_URL, $Request2_2);
                curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

                $Response2_2 = curl_exec($curl);

                if ($Response2_2 === false) {
                    echo 'Curl error: ' . curl_error($curl);
                }

                curl_close($curl);
                //print_r($Response);

                if ( substr($Response,0,3) == "\x1f\x8b\x08" ) {
                    $Response=gzinflate(substr($Response,10,-8));
                    //$Response=gzinflate(substr($Response,10));
                }

                $arrResponse = unserialize($Response);
                //print_r($arrResponse);

                if (isset($arrResponse['Status']) and $arrResponse['Status'] != 'OK') {
                    $error = $arrResponse['Message'].'<br>'.html_entity_decode($this->language->get('error_postcode'));
                }
                else {
                    $arrResponse2_1 = json_decode($Response2_1);

                    $arrResponse2_1 = $this->objectToArray($arrResponse2_1);

                    if (is_array($arrResponse2_1)) {
                        $i = 1;
                        foreach ($this->methods as $meth) {
                            if ($i <= 6) {
                                if ($arrResponse2_1[$meth['key'].'_nds'] > 0) {
                                    $arrResponse['Отправления'][$meth['name']] = array(
                                        'Название' => $this->language->get('text_'.$meth['key']),
                                        'Количество' => 1,
                                        'Тариф' => $arrResponse2_1[$meth['key'].'_nds'],
                                        'Доставка' => $arrResponse2_1[$meth['key'].'_nds'],
                                        'ПредельныйВес' => $meth['max_weight'],
                                        'СрокДоставки' => ''
                                    );
                                }
                            }
                            else {
                                break;
                            }

                            $i++;
                        }
                    }

                    $arrResponse2_2 = json_decode($Response2_2);
                    //print_r($arrResponse2_2);

                    $arrResponse2_2 = $this->objectToArray($arrResponse2_2);

                    if (is_array($arrResponse2_2)) {
                        $i = 1;
                        foreach ($this->methods as $meth) {
                            if ($i <= 6) {
                                if ($arrResponse2_2[$meth['key'].'_nds'] > 0) {
                                    $arrResponse['Отправления'][$meth['name']] = array(
                                        'Название' => $this->language->get('text_'.$meth['key']),
                                        'Количество' => 1,
                                        'Тариф' => $arrResponse2_2[$meth['key'].'_nds'],
                                        'Доставка' => $arrResponse2_2[$meth['key'].'_nds'],
                                        'ПредельныйВес' => $meth['max_weight'],
                                        'СрокДоставки' => ''
                                    );
                                }
                            }
                            else {
                                break;
                            }

                            $i++;
                        }
                    }
                }
            }
            else {
                $arrResponse = array();
            }


            //print_r($arrResponse);


            $quote_data = array();

            $active = false;

            foreach ($this->config->get('pochtaros_mstatus') as $val) {
                if ($val[$this->config->get('config_language_id')] == 1) {
                    $active = true;
                }
            }

            if ($active == true and $error == false) {

                $products = $this->cart->getProducts();

                $arr_cart_product_gabarit = array();
                $arr_cart_product_gabarit_more = array();

                foreach ($products as $value) {
                    if (isset($value['product_gabarit_id'])) {
                        if (!in_array($value['product_gabarit_id'],$arr_cart_product_gabarit)) {
                            $arr_cart_product_gabarit[] = $value['product_gabarit_id'];
                        }

                        if (!isset($arr_cart_product_gabarit_more[$value['product_gabarit_id']])) {
                            $arr_cart_product_gabarit_more[$value['product_gabarit_id']] = $value['quantity'];
                        }
                        else {
                            $arr_cart_product_gabarit_more[$value['product_gabarit_id']] += $value['quantity'];
                        }
                    }
                }

                if ($this->config->get('pochtaros_gabarit')) {
                    $arr_pochtaros_gabarit = $this->config->get('pochtaros_gabarit');

                    $total_cart_gabarit = count($arr_cart_product_gabarit);
                }

                foreach ($this->config->get('pochtaros_mstatus') as $key => $value) {

                    $local = '';
                    foreach ($this->methods as $val) {
                        //print_r($value);
                        if ($value[$this->config->get('config_language_id')] == 1 and $val['key'] == $key) {
                            $local = $val;
                            break;
                        }
                    }


                    if ($this->config->get('pochtaros_gabarit')) {
                        $natsenka = false;

                        $arr_intersect = array();
                        if (isset($arr_pochtaros_gabarit[$key]) and count($arr_pochtaros_gabarit[$key]) > 0) {
                            $arr_intersect = array_intersect($arr_pochtaros_gabarit[$key], $arr_cart_product_gabarit);
                        }

                        if (count($arr_intersect) < $total_cart_gabarit) {
                            $local = '';
                        }

                        $discount = $this->config->get('pochtaros_discount');

                        if ($local != '' and isset($discount[$key]['gabarit_id']) and isset($discount[$key]['gtotal'])) {
                            if ($discount[$key]['gabarit_id'] > 0 and (int)$discount[$key]['gtotal'] > 0) {
                                $total_in = 0;

                                foreach ($arr_cart_product_gabarit_more as $k => $v) {
                                    if ($k == $discount[$key]['gabarit_id']) {
                                        $total_in += $v;
                                    }
                                }

                                if ($total_in >= (int)$discount[$key]['gtotal']) {
                                    $natsenka = true;
                                }
                            }
                        }
                    }

                    if (isset($local['name'])  and
                        isset($arrResponse['Отправления'][$local['name']]['Тариф']) and $arrResponse['Отправления'][$local['name']]['Тариф'] > 0 and
                        isset($arrResponse['Отправления'][$local['name']]['Доставка']) and $arrResponse['Отправления'][$local['name']]['Доставка'] > 0 and

                        ( $this->config->get('pochtaros_fragmentation') or (!$this->config->get('pochtaros_fragmentation') and
                            isset($arrResponse['Отправления'][$local['name']]['ПредельныйВес']) and $weight <= $arrResponse['Отправления'][$local['name']]['ПредельныйВес']) )
                    ) {

                        /*if ($weight >= $local['max_weight']) {
                            $error = "Отправка авиапочтой доступна для товаров общим весом не более 2.5 кг";
                        }*/

                        $price = floor($arrResponse['Отправления'][$local['name']][$local['price']]);

                        //$price += $price*18/100;


                        if (isset($natsenka) and $natsenka == true and isset($discount[$key]['mode']) and isset($discount[$key]['znak'])) {
                            $tarif = 'Тариф';

                            if ($discount[$key]['znak']){
                                if ($discount[$key]['mode']) {
                                    $natsenka_number = -$arrResponse['Отправления'][$local['name']][$tarif]*$discount[$key]['number']/100;
                                } // -%
                                else {
                                    $natsenka_number = -$discount[$key]['number'];
                                } // -ed
                            }
                            else {
                                if ($discount[$key]['mode']) {
                                    $natsenka_number = $arrResponse['Отправления'][$local['name']][$tarif]*$discount[$key]['number']/100;
                                } // +%
                                else {
                                    $natsenka_number = $discount[$key]['number'];
                                } // +ed
                            }

                            $price += $natsenka_number;
                        }


                        $local['title_more'] = $local['title'];

                        if ($local['price'] == 'Доставка') {
                            $local['title_more'] .= ' '.$this->currency->format($this->tax->calculate($local_total, $this->config->get($this->name.'_tax_class_id'),  $this->config->get('config_tax')));
                        }

                        $arr_tara_price = $this->config->get('pochtaros_price');

                        if (isset($price) and (float)$price > 0) {
                            if (!isset($arrResponse['Отправления'][$local['name']]['Количество'])) {
                                $arrResponse['Отправления'][$local['name']]['Количество'] = 1;
                            }

                            $cost = (float)$this->config->get('pochtaros_cost') + $price + (float)$arr_tara_price[$key]*$arrResponse['Отправления'][$local['name']]['Количество'];

                            if (strstr($local['key'], 'obyavlennaya_stennost') and $this->config->get('pochtaros_nalozhka') and
                                ( (isset($this->request->post['payment_method']) and $this->config->get('pochtaros_payment') != '' and
                                        $this->request->post['payment_method'] == $this->config->get('pochtaros_payment'))
                                    or $this->config->get('pochtaros_payment') == '') and
                                isset($arrResponse['Отправления'][$local['name']]['НаложенныйПлатеж'])) {

                                $cost += $arrResponse['Отправления'][$local['name']]['НаложенныйПлатеж'];
                            }

                            if ($this->config->get('pochtaros_round') != '') {
                                $cost = $this->roundPriceValue($cost, $this->config->get('pochtaros_round'));
                            }
                            $text = $this->currency->format($this->tax->calculate($cost, $this->config->get($this->name.'_tax_class_id'),  $this->config->get('config_tax')));
                        }
                        else {
                            $cost = '';
                            $text = '';
                        }

                        $key = $local['key'];

                        if ($this->config->get('pochtaros_fragmentation')) {
                            $local['title_more'] .= ' ('.$arrResponse['Отправления'][$local['name']]['Количество'].' '.$this->language->get('text_items').')';
                        }


                        $dilivery_period = '';

                        if ($this->config->get('pochtaros_time')) {
                            if ($arrResponse['Отправления'][$local['name']]['СрокДоставки']) {
                                $end = $this->endings($arrResponse['Отправления'][$local['name']]['СрокДоставки'],$this->language->get('text_day1'),$this->language->get('text_day2'),$this->language->get('text_day3'),$this->language->get('text_day4'));
                                $dilivery_period = $this->language->get('text_time').' - '.$arrResponse['Отправления'][$local['name']]['СрокДоставки'].' '.$end;
                            }
                        }


                        $description = $this->config->get('pochtaros_description');
                        $text_description = '';
                        if (!empty($description[$key])) {
                            $text_description = $description[$key];
                            if (!empty($dilivery_period)) {
                                $text_description .= "<br/>";
                            }
                        }

                        $arr_max_order = $this->config->get('pochtaros_max_order');
                        $arr_min_order = $this->config->get('pochtaros_min_order');

                        if ((float)$arr_max_order[$key] > 0 and $total >= (float)$arr_max_order[$key]) {
                            $cost = 0;
                        }
                        elseif ((float)$arr_min_order[$key] > 0 and $total < (float)$arr_min_order[$key]) {
                            $cost = 0;
                        }

                        unset($error_text2);

                        if ($total < (float)$arr_min_order[$key] ) {
                            $error_text2 = html_entity_decode(sprintf($this->language->get('error_description2'), $this->currency->format($this->tax->calculate($arr_min_order[$key], $this->config->get($this->name.'_tax_class_id'),  $this->config->get('config_tax'))), $this->currency->format($this->tax->calculate($arr_min_order[$key]-$total, $this->config->get($this->name.'_tax_class_id'),  $this->config->get('config_tax')))), ENT_QUOTES, 'UTF-8');
                            $cost = 1;
                            $text = '';
                        }

                        if ($cost > 0) {
                            $arr_lock = array();
                            $arr_unlock = array();

                            $arr_pochtaros_incity = $this->config->get('pochtaros_incity');
                            $arr_pochtaros_outcity = $this->config->get('pochtaros_outcity');

                            if ($arr_pochtaros_incity[$key] != '') {
                                $rates = explode(',', $arr_pochtaros_incity[$key]);

                                if (count($rates) > 0) {
                                    foreach ($rates as $rate) {
                                        $data = trim($rate);

                                        if (mb_strtolower($data, 'UTF-8') == mb_strtolower(trim($address['city']), 'UTF-8')) {
                                            $arr_lock[] = $key;
                                        }
                                    }
                                }
                            }

                            if ($arr_pochtaros_outcity[$key] != '') {
                                $rates = explode(',', $arr_pochtaros_outcity[$key]);

                                if (count($rates) > 0) {
                                    foreach ($rates as $rate) {
                                        $data = trim($rate);

                                        if (mb_strtolower($data, 'UTF-8') == mb_strtolower(trim($address['city']), 'UTF-8')) {
                                            $arr_unlock[] = $key;
                                        }
                                    }
                                }
                            }
                        }

                        if ($cost > 0
                            and !in_array($key,$arr_lock)
                            and (empty($arr_pochtaros_outcity[$key]) or (!empty($arr_pochtaros_outcity[$key]) and in_array($key,$arr_unlock)))
                        ) {

                            $show = true;

                            if ($this->config->get('pochtaros_min_weight2')) {
                                $pochtaros_min_weight2 = $this->config->get('pochtaros_min_weight2');

                                if ($pochtaros_min_weight2[$key] and $weight2 < $pochtaros_min_weight2[$key]) {
                                    $show = false;
                                }
                            }

                            if ($this->config->get('pochtaros_max_weight2') and $show == true) {
                                $pochtaros_max_weight2 = $this->config->get('pochtaros_max_weight2');

                                if ($pochtaros_max_weight2[$key] and $weight2 > $pochtaros_max_weight2[$key]) {
                                    $show = false;
                                }
                            }

                            if ($this->config->get('pochtaros_max_products') and $show == true) {
                                $pochtaros_max_products = $this->config->get('pochtaros_max_products');

                                if ($pochtaros_max_products[$key] and $total_products > $pochtaros_max_products[$key]) {
                                    $show = false;
                                }
                            }

                            if ($show == true) {
                                $quote_data[$key] = array(
                                    'code'         => $this->name.'.'.$key,
                                    'title'        => $local['title_more'],
                                    'dummy'        => isset($error_text2) ? $error_text2 : '',
                                    'description'  => isset($error_text2) ? $error_text2 : $text_description.$dilivery_period,
                                    'tax_class_id' => $this->config->get($this->name.'_tax_class_id'),
                                    'image'        => $image,
                                    'cost'         => $cost,
                                    'tax_class_id' => '',
                                    'text'         => isset($error_text2) ? '' : $text,
                                    'error'        => isset($error_text2) ? true : false
                                );
                            }
                        }
                    }
                }
            }
        }

        if (((isset($quote_data) and count($quote_data) == 0) or !isset($quote_data)) and $this->config->get('pochtaros_zaglushka')) {
            $bibbtext = $this->config->get($this->name.'_bibbtext');
            if ($bibbtext[$this->config->get('config_language_id')]) {
                $error = $bibbtext[$this->config->get('config_language_id')];
            }
            else {
                $error = sprintf($this->language->get('error_description3'), $this->config->get('config_telephone'));
            }
        }

        if ((isset($quote_data) and count($quote_data) > 0) or $error) {
            $title = $this->config->get($this->name.'_name');

            $method_data = array(
                'code'       => $this->name,
                'title'      => html_entity_decode($title[$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'),
                'quote'      => isset($quote_data) ? $quote_data : array(),
                'sort_order' => $error ? ($this->config->get('pochtaros_sort_order') + 100) : $this->config->get('pochtaros_sort_order'),
                'error'      => $error
            );
        }

       // print_r($method_data);

		return $method_data;
	}

    // Округляет
    private function roundPriceValue($price, $round = '') {
        if ($round == 'digit10' or $round == 'digit50' or $round == 'digit100' or $round == 'digit1000' or
            $round == 'digit10000' or $round == 'digit100000') {

            $digits = (int)str_replace('digit', '' ,$round);
            $price = (ceil($price / $digits)) * $digits;
        }
        elseif ($round == 'digit9') {
            $digits = 10;
            $price = (ceil($price / $digits)) * $digits;

            if ($price >= 10) {
                $price = $price - 1;
            }
        }
        elseif ($round == 'digit1') {
            $price = round($price);
        }
        elseif ($round == 'digit1_plus') {
            $price = ceil($price);
        }
        else {
            //$price = round($price,4);
        }

        return $price;
    }

    // меняет окончания в словах
    private function endings($num, $txt="д", $e1="ень", $e2="ня", $e3="ней", $begin=true) {
        $a = substr(strrev($num),0,1);
        $b = substr(strrev($num),1,1);

        if ($a>4 OR $a == 0 OR $b == 1) {
            if ($begin == true) {
                return $txt.$e3;
            }
            else {
                return $e3;
            }
        }
        else {
            if ($a == 1) {
                return $txt.$e1;
            }
            else {
                return $txt.$e2;
            }
        }
    }


    private function objectToArray($object) {
        $array = array();
        foreach ($object as $member => $data) {
            $array[$member] = $data;
        }
        return $array;
    }

    private function to_seo($s) {
        $s = $this->to_translit($s);
        $s = $this->to_lower($s);
        $s = str_replace("'", "", $s);
        $s = str_replace('"', "", $s);

        $s = trim($s);
        $s = str_replace("&quot;", "", $s);
        $s = str_replace("/", "_", $s);

        $s = preg_replace("/[-.,]/i", "_", $s);
        $s = preg_replace("/\s+/", "_", $s);
        $s = preg_replace("/_+/", "_", $s);
        $s = preg_replace('/([_!();:,.?])\\1+/', '$1', $s);

        $s = preg_replace("/[^a-z0-9_]/i","",$s);

        return $s;
    }


    private function to_lower($s) {
        $pattern = array(
            "'А'","'Б'","'В'","'Г'","'Д'","'Е'","'Ё'","'Ж'","'З'","'И'","'Й'","'К'","'Л'","'М'","'Н'","'О'","'П'","'Р'","'С'","'Т'","'У'","'Ф'","'Х'","'Ц'","'Ч'","'Ш'","'Щ'","'Ъ'","'Ы'","'Ь'","'Э'","'Ю'","'Я'",
            "'A'", "'B'", "'C'", "'D'", "'E'", "'F'", "'G'", "'H'", "'I'", "'J'", "'K'", "'L'", "'M'", "'N'", "'O'", "'P'", "'Q'", "'R'", "'S'", "'T'", "'U'", "'V'", "'W'", "'X'", "'Y'", "'Z'");

        $replacement = array(
            "а","б","в","г","д","е","ё","ж","з","и","й","к","л","м","н","о","п","р","с","т","у",
            "ф","х","ц","ч","ш","щ","ъ","ы","ь","э","ю","я",
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
            "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
        );
        return preg_replace ($pattern, $replacement, $s);
    }


    private function to_translit($s) {
        $pattern = array(
            "'а'","'б'","'в'","'г'","'д'","'е'","'ё'","'ж'","'з'","'и'","'й'","'к'","'л'","'м'","'н'","'о'","'п'","'р'","'с'","'т'","'у'","'ф'","'х'","'ц'","'ч'","'ш'","'щ'","'ъ'","'ы'","'ь'","'э'","'ю'","'я'",
            "'А'","'Б'","'В'","'Г'","'Д'","'Е'","'Ё'","'Ж'","'З'","'И'","'Й'","'К'","'Л'","'М'","'Н'","'О'","'П'","'Р'","'С'","'Т'","'У'","'Ф'","'Х'","'Ц'","'Ч'","'Ш'","'Щ'","'Ъ'","'Ы'","'Ь'","'Э'","'Ю'","'Я'" );
        $replacement = array(
            "a", "b", "v", "g", "d", "e", "yo", "zh", "z", "i", "j", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u", "f", "h", "c", "ch", "sh", "sch","", "y", "", "e", "yu", "ya",
            "A", "B", "V", 'G', "D", "E", "Yo", "Zh", "Z", "I", "J", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "F", "H", "C", "Ch", "Sh", "Sch","", "Y", "", "E", "Ju", "Ya" );
        return preg_replace ($pattern, $replacement, $s);
    }
}
?>