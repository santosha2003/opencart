<?php 
class ModelModulePayments extends Model {

    public function getAllpaymentNames() {
        $this->load->model('extension/extension');
        $results = $this->model_extension_extension->getInstalled('payment');

        $payments = array();

        foreach ($results as $result) {
            $modules = $this->config->get($result.'_module');

            $this->load->language('payment/' . $result);

            //print_r($modules);
            if (isset($modules) and is_array($modules)) {
                foreach ($modules as $k => $module) {
                    if (isset($module['title'])) {
                        if ($result == 'transfer_plus') {
                            $real_module_name = $this->language->get('heading_title').' - ';
                        }
                        else {
                            $real_module_name = '';
                        }


                        if (is_array($module['title'])) {
                            $payments[] = array('payment_code' => $result.'.'.$k,
                                                 'code' => $result,
                                                 'name' => $real_module_name.$module['title'][$this->config->get('config_language_id')]);
                        }
                        else {
                            $payments[] = array('payment_code' => $result.'.'.$k,
                                                 'code' => $result,
                                                 'name' => $real_module_name.$module['title']);
                        }
                    }
                }
            }
            elseif ($result == 'weight') {
                $this->load->model('localisation/geo_zone');

                $geo_zones = $this->model_localisation_geo_zone->getGeoZones();

                foreach ($geo_zones as $geo_zone) {
                    $payments[] = array(
                        'code' => $result,
                        'payment_code' => $result.'.weight_'.$geo_zone['geo_zone_id'],
                        'name' => 'Доставка в зависимости от веса - '.$geo_zone['name']
                    );
                }
            }
            else {
                if ($this->language->get('heading_title')) {
                    $heading_title = $this->language->get('heading_title');
                }
                elseif ($this->language->get('text_title')) {
                    $heading_title = $this->language->get('text_title');
                }
                else {
                    $heading_title = 'No name!';
                }

                $payments[] = array('payment_code' => $result, 'code' => $result,
                                     'name' => $heading_title);
            }
        }

        return $payments;
    }
}
?>