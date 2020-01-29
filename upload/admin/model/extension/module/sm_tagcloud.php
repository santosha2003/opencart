<?php
class ModelExtensionModuleSmTagcloud extends Model {
	
	public function getRawTags() {
		$query = $this->db->query("SELECT pd.tag, pd.language_id, p2s.store_id FROM " . DB_PREFIX . "product_description pd RIGHT JOIN " . DB_PREFIX . "product_to_store p2s ON p2s.product_id = pd.product_id WHERE pd.tag != ''");

		return $query ->rows;
	}

	public function clear() {
		$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "tag_cloud");
	}

	public function update($d) {
		foreach($d as $r) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "tag_cloud (`qty`, `tag`, language_id, store_id) VALUES ('" . (int)$r['qty'] . "', '" . $this->db->escape($r['tag']) . "', '" . (int)$r['language_id'] . "', '" . (int)$r['store_id'] . "') ON DUPLICATE KEY UPDATE `qty` = `qty` + 1");
		}
	} 
	
	
}