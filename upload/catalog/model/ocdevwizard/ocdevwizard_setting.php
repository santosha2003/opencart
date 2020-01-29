<?php
class ModelOcdevwizardOcdevwizardSetting extends Model {
	public function getSetting($code, $store_id = 0) {
		$setting_data = array();

		if ($this->mysql_table_exists()) {
			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."ocdevwizard_setting WHERE store_id = '".(int)$store_id."' AND `code` = '".$this->db->escape($code)."'");

			foreach ($query->rows as $result) {
				$setting_data[$result['key']] = (!$result['serialized']) ? $result['value'] : json_decode($result['value'], true);
			}
		}

		return $setting_data;
	}

	public function getSettingData($key, $store_id = 0) {
		$setting_data = array();
		
		if ($this->mysql_table_exists()) {
			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."ocdevwizard_setting WHERE store_id = '".(int)$store_id."' AND `key` = '".$this->db->escape($key)."'");

			foreach ($query->rows as $result) {
				$setting_data = (!$result['serialized']) ? $result['value'] : json_decode($result['value'], true);
			}
		}

		return $setting_data;
	}

	function mysql_table_exists() {
	  $tables = array();

	  $result = $this->db->query("SHOW TABLES FROM ".DB_DATABASE);

	  if ($result->rows) {
		  foreach ($result->rows as $rows) {
		  	foreach ($rows as $row) {
		  		if ($row == DB_PREFIX.'ocdevwizard_setting') {
		  			$tables[] = $row;
		  		}
		  	}
		  }
	  }

	  if (in_array(DB_PREFIX.'ocdevwizard_setting', $tables)) {
	    return true;
	  } else {
	  	return false;
	  }
	}
}
