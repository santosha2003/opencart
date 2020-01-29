<?php
class ModelExtensionPaymentRbs extends Model {
    public function getMethod($address, $total) {
        $this->load->language('extension/payment/rbs');

        $method_data = array(
            'code'     => 'rbs',
            'title'    => $this->language->get('rbs_text_title'),
            'terms'      => '',
            'sort_order' => $this->config->get('custom_sort_order')
        );

        return $method_data;
    }
}