<?php
class ModelExtensionModuleNewsletters extends Model {

	public function createNewsletter() {
		
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
		$this->load->language('extension/module/newsletter');
		$data['error_news_email_duplicate'] = $this->language->get('error_news_email_duplicate');
		$data['error_newsletter_sent'] = $this->language->get('error_newsletter_sent');
		$data['error_newsletter_fail'] = $this->language->get('error_newsletter_fail');

		$res = $this->db->query("select * from ". DB_PREFIX ."newsletter where news_email='".$data['email']."'");
		if($res->num_rows == 1)
		{
			return '<div class="text-danger" id="text-danger-newsletter">' . $this->language->get('error_news_email_duplicate') . '</div>';
		}
		else
		{
			if($this->db->query("INSERT INTO " . DB_PREFIX . "newsletter (news_email, subscribe_date) values ('".$data['email']."', NOW())"))
			{
				return true;
			}
			else
			{
				return '<div class="text-danger" id="text-danger-newsletter">' . $this->language->get('error_newsletter_fail') . '</div>';
			}
		}
	}	
}