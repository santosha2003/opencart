<?php

class ModelExtensionFeedYandexSitemap extends Model
{
    public function getProducts()
    {
        $sql = "SELECT p.product_id, p.manufacturer_id , p2c.category_id, p.image, p.date_modified, p.date_added";
        $sql .= " FROM " . DB_PREFIX . "product_to_category p2c";
        $sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";

        $sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
        $sql .= " GROUP BY p.product_id";
        $sql .= " ORDER BY p.sort_order";

        $product_data = array();

        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = array(
                'category_id' => $result['category_id'],
                'manufacturer_id' => $result['manufacturer_id'],
                'product_id' => $result['product_id'],
                'image' => $result['image'],
                'date_modified' => $result['date_modified'],
                'date_added' => $result['date_added'],
            );
        }
        return $product_data;
    }


    public function getCategories($parent_id = 0)
    {
        $query = $this->db->query("SELECT c.category_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order");
        return $query->rows;
    }

    public function getInformations()
    {
        $query = $this->db->query("SELECT i.information_id FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_to_store i2s ON (i.information_id = i2s.information_id) WHERE i2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND i.status = '1' ORDER BY i.sort_order ASC");

        return $query->rows;
    }

    public function getManufacturers($data = array())
    {
        if ($data) {
            $sql = "SELECT m.manufacturer_id FROM " . DB_PREFIX . "manufacturer m 
			LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) 
			WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

            $sql .= " ORDER BY name ASC";

            $query = $this->db->query($sql);

            return $query->rows;
        } else {
            $manufacturer_data = $this->cache->get('manufacturer_y_feed.' . (int)$this->config->get('config_store_id'));

            if (!$manufacturer_data) {
                $query = $this->db->query("SELECT m.manufacturer_id FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY name");

                $manufacturer_data = $query->rows;

                $this->cache->set('manufacturer_y_feed.' . (int)$this->config->get('config_store_id'),
                    $manufacturer_data);
            }

            return $manufacturer_data;
        }
    }

}
