<?php

// @category  : OpenCart
// @module    : Smart Wishlist Without Login
// @author    : OCdevWizard <ocdevwizard@gmail.com>
// @copyright : Copyright (c) 2015, OCdevWizard
// @license   : http://license.ocdevwizard.com/Noncommercial_Licensing_Policy.pdf

class ModelOcdevwizardSmartWishlistWithoutLogin extends Model {

	static $_module_version = '2.0.0';
	static $_module_name    = 'smart_wishlist_without_login';

	public function createDBTables() {
		$sql1  = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."ocdevwizard_setting` ( ";
		$sql1 .= "`setting_id` int(11) NOT NULL AUTO_INCREMENT,";
		$sql1 .= "`store_id` int(11) NOT NULL DEFAULT '0',";
		$sql1 .= "`code` varchar(32) NOT NULL,";
		$sql1 .= "`key` varchar(64) NOT NULL,";
		$sql1 .= "`value` text NOT NULL,";
		$sql1 .= "`serialized` tinyint(1) NOT NULL,";
		$sql1 .= "PRIMARY KEY (`setting_id`)";
		$sql1 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";

		$this->db->query($sql1);
	}

	public function getOCdevCatalog() {
		$catalog = array();
		$source  = 'http://ocdevwizard.com/products/share/share.xml';

		if (ini_get('allow_url_fopen')) {
			$results = simplexml_load_file($source);
		} else {    
			$ch = curl_init($source);    
			curl_setopt ($ch, CURLOPT_HEADER, false); 
			curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);    
			$xml_raw = curl_exec($ch);    
			$results = simplexml_load_string($xml_raw);
		}
		
		if ($results !== false) {
			foreach ($results->product as $product) {
				$catalog[] = array(
					'extension_id'     => (int)$product->extension_id,
					'title'            => (string)$product->title,
					'img'              => (string)$product->img,
					'price'            => (string)$product->price,
					'url'              => (string)str_replace("&amp;", "&", $product->url),
					'date_added'       => (string)$product->date_added,
					'opencart_version' => (string)$product->opencart_version,
					'latest_version'   => (string)$product->latest_version,
					'features'         => (string)$product->features
				);
			}
		}
		return $catalog;
	}

	public function getOCdevSupportInfo() {
		$catalog = array();
		$source  = 'http://ocdevwizard.com/support/support.xml';

		if (ini_get('allow_url_fopen')) {
			$results = simplexml_load_file($source);
		} else {    
			$ch = curl_init($source);    
			curl_setopt ($ch, CURLOPT_HEADER, false); 
			curl_setopt ($ch, CURLOPT_RETURNTRANSFER, true);    
			$xml_raw = curl_exec($ch);    
			$results = simplexml_load_string($xml_raw);
		}
		
		if ($results !== false) {
			$catalog = array(
				'general' => (string)$results->general,
				'terms'   => (string)$results->terms,
				'service' => (string)$results->service,
				'faq'     => (string)$results->faq
			);
		}
		return $catalog;
	}
}
