<?php
class ModelToolCustomImgAltTitle extends Controller {

	public function getAltTitles($data=array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "product p
		LEFT JOIN " . DB_PREFIX ."product_description pd ON (p.product_id = pd.product_id) WHERE 1";
		if (isset($data['filter_name']) && $data['filter_name']) {
			$sql .= " AND pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}
		$sql .= " AND pd.language_id = " . (int)$this->config->get('config_language_id');
		$sql .= " ORDER BY pd.name";
		if (isset($data['start']) || isset($data['limit'])) {
			if ((int)$data['start'] < 0) {
				$data['start'] = 0;
			}

			if ((int)$data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$results = $this->db->query($sql);
		$products = array();
		foreach ($results->rows as $row) {
			$res = $this->getAltTitle($row['product_id']);
			$products[$row['product_id']] = array(
				'product_id' => $row['product_id'],
				'image'=> $row['image'],
				'name' => $row['name'],
				'alt' =>   isset($res['alt'])?$res['alt']:'',
				'title' => isset($res['title'])?$res['title']:'',
			);
		}
		return $products;
	}

	public function getTotalAltTitles($data=array()) {
		$sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "product p";
		if (isset($data['filter_name']) && $data['filter_name']) {
			$sql .= " LEFT JOIN " . DB_PREFIX ."product_description pd ON (p.product_id = pd.product_id) WHERE 1";
			$sql .= " AND pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}
		$results = $this->db->query($sql);
		
		return $results->row['total'];
	}

	public function save($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "product_description WHERE language_id = " . (int)$data['language_id'] . "
			AND product_id = " . (int)$data['product_id'];
			$result = $this->db->query($sql);
			if ($result->num_rows) {
				$image_descr = $result->row['image_description'];
				$image_description = unserialize($image_descr);
				$field = $this->db->escape($data['field']);
				if (!isset($image_description['description']['alt'])) {
					$image_description['description']['alt'] = '';
					$image_description['description']['title'] = '';
				}
				$image_description['description'][$field] = $this->db->escape($data['value']);
				$image_descr = serialize($image_description);
				$sql = "UPDATE "  . DB_PREFIX . "product_description SET 
				image_description = '" . $image_descr . "'
				WHERE language_id = " . (int)$data['language_id'] . " AND product_id = " . (int)$data['product_id'];
				$this->db->query($sql);
			}
		}
	}

	public function getAltTitle($product_id) {
		$sql = "SELECT image_description, language_id FROM `" . DB_PREFIX . "product_description` WHERE product_id = " . (int)$product_id . "
		ORDER BY language_id";
		$result = $this->db->query($sql);
		if ($result->num_rows) {
			$res = array();
			foreach ($result->rows as $row) {
				$description = unserialize($row['image_description']);
				$res['alt'][$row['language_id']] = $description['description']['alt'];
				$res['title'][$row['language_id']] = $description['description']['title'];
			}
			return $res;
		} else {
			return array();
		}
	}
	
}