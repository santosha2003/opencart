<?php
class ModelMarketingNewsletter extends Model {
	
	public function createNewsletter()
	{
		$res0 = $this->db->query("SHOW TABLES LIKE '".DB_PREFIX."newsletter'");
		if($res0->num_rows == 0){
			$this->db->query("
				CREATE TABLE IF NOT EXISTS `". DB_PREFIX. "newsletter` (
				`news_id` int(11) NOT NULL AUTO_INCREMENT,
				`news_email` varchar(255) NOT NULL UNIQUE,
				`subscribe_date` date NOT NULL,
				PRIMARY KEY (`news_id`)
				) ENGINE=MyISAM  DEFAULT CHARSET=utf8;
				");
		}
	}

	public function addNewsletter($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "newsletter SET news_email = '" . $this->db->escape($data['news_email']) . "', subscribe_date = NOW()");

		$newsletter_id = $this->db->getLastId();

		return $newsletter_id;
	}

	public function editNewsletter($newsletter_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "newsletter SET news_email = '" . $this->db->escape($data['news_email']) . "', subscribe_date = '" . $this->db->escape($data['subscribe_date']) . "' WHERE news_id = '" . (int)$newsletter_id . "'");
	}

	public function deleteNewsletter($newsletter_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "newsletter WHERE news_id = '" . (int)$newsletter_id . "'");
	}

	public function getNewsletter($newsletter_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "newsletter WHERE news_id = '" . (int)$newsletter_id . "'");

		return $query->row;
	}

	public function getNewsletterEmail($newsletter_email) {
		$query = $this->db->query("SELECT news_email FROM " . DB_PREFIX . "newsletter WHERE news_email = '" . $newsletter_email . "'");

		return $query->row;
	}

	public function getNewsletters($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "newsletter";

		$sort_data = array(
			'news_id',
			'news_email',
			'subscribe_date'
			);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY subscribe_date";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalNewsletters() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "newsletter");

		return $query->row['total'];
	}
	
}