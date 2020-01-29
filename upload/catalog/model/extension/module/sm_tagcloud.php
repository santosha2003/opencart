<?php
class ModelExtensionModuleSmTagcloud extends Model {
	public function getRandomTags($data) {
		$cloudData = array();
		$limit = isset($data['limit']) ? $data['limit'] : 10;
		$tagQuery = $this->db->query("SELECT tag, qty FROM " . DB_PREFIX . "tag_cloud WHERE language_id = '" . $this->config->get('config_language_id') . "' AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY qty DESC LIMIT " . $limit);
		$tags = $tagQuery->rows;
		$cloudData = array(
			'tags' => $tags
		);
		$tagcloud = $this->generateTagCloud($cloudData);
		return $tagcloud;
	}
	
	private function generateTagCloud($cloudData) {
	$tags = $cloudData['tags'];
	if ($tags) {
		foreach ($tags as $record) { 
			$tag_href = 'product/search&tag=' . (str_replace(' ', '%20', $record['tag']));
			$cloud[] = ['href' => $this->url->link(str_replace('&', '&amp;', $tag_href)), 'name' => $record['tag']];
			}
			$tagcloud = [];
			for ($x = 0; $x < count($cloud); $x++) { $tagcloud[] = $cloud[$x]; }
		return $tagcloud;
		
		} else {
		$cloud = false; 
		}
	}
}