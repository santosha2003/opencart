<?php
class ModelExportYandexMarket extends Model {
	public function getCategory() {
		$query = $this->db->query("SELECT cd.name, c.category_id, c.parent_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' AND c.sort_order <> '-1'");

		return $query->rows;
	}

	public function getProduct($allowed_categories, $out_of_stock_id, $vendor_required = true) {
		$query = $this->db->query("SELECT p.*, pd.name, pd.description, m.name AS manufacturer, p2c.category_id, p.price AS price, (SELECT ps.price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special FROM " . DB_PREFIX . "product p JOIN " . DB_PREFIX . "product_to_category AS p2c ON (p.product_id = p2c.product_id) " . ($vendor_required ? '' : 'LEFT ') . "JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p2c.category_id IN (" . $this->db->escape($allowed_categories) . ") AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1' AND (p.quantity > '0' OR p.stock_status_id != '" . (int)$out_of_stock_id . "') GROUP BY p.product_id");

		return $query->rows;
	}

	public function getProductOptionMinPrice($product_id) {
		$query = $this->db->query("
	    SELECT MIN(price) min_option_price
	    FROM " . DB_PREFIX . "product_option_value pov 
	    LEFT JOIN " . DB_PREFIX . "option o ON o.option_id = pov.option_id 
	    LEFT JOIN " . DB_PREFIX . "product_option po ON (po.option_id = o.option_id AND po.product_id = pov.product_id) 
	    WHERE po.product_id = " . (int)$product_id);
		if (isset($query->row['min_option_price'])) {
			return $query->row['min_option_price'];
		} else {
			return 0;
		}
	}
}
?>
