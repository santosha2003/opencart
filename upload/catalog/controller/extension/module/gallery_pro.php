<?php
class ControllerExtensionModuleGalleryPro extends Controller {
	public function index($setting) {

    $this->document->addStyle('catalog/view/javascript/gallery_pro/blueimp-gallery.min.css');
    $this->document->addStyle('catalog/view/javascript/gallery_pro/gallery_pro.css');
    $this->document->addScript('catalog/view/javascript/gallery_pro/jquery.blueimp-gallery.min.js');

    if ($setting['thumb_style'] == 1) {
      $this->document->addStyle('catalog/view/javascript/gallery_pro/collagep_transitions.css');
      $this->document->addScript('catalog/view/javascript/gallery_pro/jquery.collagePlus.js');
      $this->document->addScript('catalog/view/javascript/gallery_pro/jquery.removeWhitespace.js');
    }
    
    if ($setting['thumb_style'] == 2) {
      $this->document->addScript('catalog/view/javascript/gallery_pro/jquery.pinto.min.js');
    }
		
    static $module = 0;
    
		$this->load->model('design/banner');
    $this->load->model('tool/image');
    
		$data['images'] = array();
    
		$results = $this->model_design_banner->getBanner($setting['filter_banner_id']);
    
		foreach ($results as $result) {
    			if (is_file(DIR_IMAGE . $result['image'])) {
            if ($setting['thumb_style'] == 0) $thumb = $this->model_tool_image->resize($result['image'], $setting['bwidth'], $setting['bheight']); 
            if ($setting['thumb_style'] == 1) $thumb = $this->resizeTo($result['image'], 0, $setting['justify_row_height']*2,'maxheight');
            if ($setting['thumb_style'] == 2) $thumb = $this->resizeTo($result['image'], $setting['pinto_width']*2, 0,'maxwidth');
    				$data['images'][] = array(
    					'title' => $result['title'],
						'description'  => $result['description'],
    					'link'  => $result['link'],
    					'thumb' => $thumb,
              'image' => ($setting['resize'] ? $this->resizeTo($result['image'], $setting['gwidth'], $setting['gheight']) : $this->realname($result['image']))
    				);
    			}
		}
    
    if (isset($setting['module_description'][$this->config->get('config_language_id')])) {
			$data['heading_title'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
      $data['loading_text'] = html_entity_decode($setting['module_description'][$this->config->get('config_language_id')]['loading_text'], ENT_QUOTES, 'UTF-8');
    }
    
    $data['setting'] = $setting;     
		$data['module'] = $module++;

		return $this->load->view('extension/module/gallery_pro', $data);
	}
  
  private function realname($filename) {
    if ($this->request->server['HTTPS']) {
			return $this->config->get('config_ssl') . 'image/' . $filename;
		} else {
			return $this->config->get('config_url') . 'image/' . $filename;
		}
  }
  
  private function resizeTo($filename, $width, $height, $resizeOption = 'default' , $crop_height = 0) {
    
    if (!is_file(DIR_IMAGE . $filename)) {
			return;
		}
    
		$extension = pathinfo($filename, PATHINFO_EXTENSION);
    
    $old_image = $filename;
    
    list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);
    
    switch(strtolower($resizeOption))
		{
			case 'exact':
				$resizeWidth = $width;
				$resizeHeight = $height;
			break;

			case 'maxwidth':
				$resizeWidth  = $width;
				$resizeHeight = $this->resizeHeightByWidth($width,$width_orig,$height_orig);
			break;

			case 'maxheight':
				$resizeWidth  = $this->resizeWidthByHeight($height,$width_orig,$height_orig);
				$resizeHeight = $height;
			break;

			default:
				if($width_orig > $width || $height_orig > $height)
				{
					if ( $width_orig > $height_orig ) {
				    	 $resizeHeight = $this->resizeHeightByWidth($width,$width_orig,$height_orig);
			  			 $resizeWidth  = $width;
					} else if( $width_orig < $height_orig ) {
						$resizeWidth  = $this->resizeWidthByHeight($height,$width_orig,$height_orig);
						$resizeHeight = $height;
					}  else {
						$resizeWidth = $width;
						$resizeHeight = $height;	
					}
				} else {
		            $resizeWidth = $width_orig;
		            $resizeHeight = $height_orig;
		        }
			break;
		}
    if ($crop_height && $crop_height < $resizeHeight) {
		  $new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $resizeWidth . 'x_crop_' .$crop_height. '.' . $extension;
    } else {
      $new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $resizeWidth . 'x' . $resizeHeight . '.' . $extension;
    }

		if (!is_file(DIR_IMAGE . $new_image) || (filectime(DIR_IMAGE . $old_image) > filectime(DIR_IMAGE . $new_image))) {
			$path = '';

			$directories = explode('/', dirname(str_replace('../', '', $new_image)));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}
			}

    if ($width_orig != $width || $height_orig != $height) {
        $image = new Image(DIR_IMAGE . $old_image);
				$image->resize($resizeWidth, $resizeHeight);
        if ($crop_height && $crop_height < $resizeHeight) {
          $image->crop(0,(int)($resizeHeight/2)-(int)($crop_height/2),$resizeWidth,(int)($resizeHeight/2)+(int)($crop_height/2));
        } else {
          $image->crop(1,1,$resizeWidth-1,$resizeHeight-1);
        }
        
        $image->save(DIR_IMAGE . $new_image);
			} else {
				copy(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image);
			}
		}

		if ($this->request->server['HTTPS']) {
			return $this->config->get('config_ssl') . 'image/' . $new_image;
		} else {
			return $this->config->get('config_url') . 'image/' . $new_image;
		}
		
	}

	private function resizeHeightByWidth($width,$width_orig,$height_orig)
	{
		return floor(($height_orig/$width_orig)*$width);
	}

	private function resizeWidthByHeight($height,$width_orig,$height_orig)
	{
		return floor(($width_orig/$height_orig)*$height);
	}
  
}