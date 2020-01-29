<?php
class ModelCatalogCustomAltTitleImg extends Model {
	public function getImageDescriptionMain($paterns,$values, $product_info, $image_description) {
		if (isset($product_info['image_description']) && $product_info['image_description']) {
				if (isset($product_info['image_description']['description']['title']) && $product_info['image_description']['description']['title']) {
					$image_description['title'] = str_replace($paterns, $values, $product_info['image_description']['description']['title']);
				} else {
					if ($this->config->get('custom_img_title_alt_enable')) {
						$custom_img_title_alt_main_title = $this->config->get('custom_img_title_alt_main_title');
						if (isset($custom_img_title_alt_main_title[$this->config->get('config_language_id')]) && $custom_img_title_alt_main_title[$this->config->get('config_language_id')]) {
							$image_description['title'] = str_replace($paterns, $values,$custom_img_title_alt_main_title[$this->config->get('config_language_id')]);
						}
					}
				}
				if (isset($product_info['image_description']['description']['alt']) && $product_info['image_description']['description']['alt']) {
					$image_description['alt'] = str_replace($paterns, $values, $product_info['image_description']['description']['alt']);
				} else {
					if ($this->config->get('custom_img_title_alt_enable')) {
						$custom_img_title_alt_main_alt = $this->config->get('custom_img_title_alt_main_alt');
						if (isset($custom_img_title_alt_main_alt[$this->config->get('config_language_id')]) && $custom_img_title_alt_main_alt[$this->config->get('config_language_id')]) {
							$image_description['alt'] = str_replace($paterns, $values,$custom_img_title_alt_main_alt[$this->config->get('config_language_id')]);
						}
					}
				}
		} else {
			if ($this->config->get('custom_img_title_alt_enable')) {
				$custom_img_title_alt_main_alt = $this->config->get('custom_img_title_alt_main_alt');
				if (isset($custom_img_title_alt_main_alt[$this->config->get('config_language_id')]) && $custom_img_title_alt_main_alt[$this->config->get('config_language_id')]) {
					$image_description['alt'] = str_replace($paterns, $values,$custom_img_title_alt_main_alt[$this->config->get('config_language_id')]);
				}
				$custom_img_title_alt_main_title = $this->config->get('custom_img_title_alt_main_title');
				if (isset($custom_img_title_alt_main_title[$this->config->get('config_language_id')]) && $custom_img_title_alt_main_title[$this->config->get('config_language_id')]) {
					$image_description['title'] = str_replace($paterns, $values,$custom_img_title_alt_main_title[$this->config->get('config_language_id')]);
				}
			}
		}
		return $image_description;
	}

	public function getImageDescriptionAdd($paterns,$values, $result, $image_description) {
		$this->values = $values;
		$this->paterns = $paterns;
		
		if (isset($result['image_description'])) {
			$image_desc = unserialize($result['image_description']);
			
			if ($image_desc) {
				$image_description_ = $image_desc[$this->config->get('config_language_id')];
				
				if (isset($image_description_['title']) && $image_description_['title']) {
					$image_description['title'] = str_replace($paterns, $values, $image_description_['title']);
				} else {
					$this->render('title', $image_description);
				}

				if (isset($image_description_['alt']) && $image_description_['alt']) {
					$image_description['alt'] = str_replace($paterns,$values,$image_description_['alt']);
				} else {
					$this->render('alt', $image_description);
				}
			} else {
				$this->render('title', $image_description);
				$this->render('alt', $image_description);
			}
		} else {
			$this->render('title', $image_description);
			$this->render('alt', $image_description);
		}
		return $image_description;
	}
	
	protected function render($key,&$image_description) {
		if ($this->config->get('custom_img_title_alt_enable')) {
			$custom_img_title_alt_add_{$key} = $this->config->get('custom_img_title_alt_add_' .$key);
			if (isset($custom_img_title_alt_add_{$key}[$this->config->get('config_language_id')]) && $custom_img_title_alt_add_{$key}[$this->config->get('config_language_id')]) {
				$image_description[$key] = str_replace($this->paterns, $this->values,$custom_img_title_alt_add_{$key}[$this->config->get('config_language_id')]);
			} else {
				$custom_img_title_alt_add_expand = $this->config->get('custom_img_title_alt_add_expand');
				if (isset($custom_img_title_alt_add_expand[$this->config->get('config_language_id')]) && $custom_img_title_alt_add_expand[$this->config->get('config_language_id')]) {
					$image_description[$key] .= ' ' . $custom_img_title_alt_add_expand[$this->config->get('config_language_id')];
					$image_description[$key] = str_replace($this->paterns, $this->values, $image_description[$key]);
				}
			}
		}
	}
}