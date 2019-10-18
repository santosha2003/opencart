<?php
class ControllerExtensionModuleGalleryPro extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/gallery_pro');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('extension/module');
    
    $this->document->addStyle('view/javascript/blue_imp_gallery_pro/colorpicker/css/bootstrap-colorpicker.min.css');
    $this->document->addScript('view/javascript/blue_imp_gallery_pro/colorpicker/js/bootstrap-colorpicker.min.js');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('gallery_pro', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
	  $data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
    $data['text_yes'] = $this->language->get('text_yes');
    $data['text_no'] = $this->language->get('text_no');
    $data['text_justified_options'] = $this->language->get('text_justified_options');
    $data['text_thumb_title_options'] = $this->language->get('text_thumb_title_options');
    $data['text_bootstrap_options'] = $this->language->get('text_bootstrap_options');
    $data['text_hover_animation_options'] = $this->language->get('text_hover_animation_options');
    $data['text_border_options'] = $this->language->get('text_border_options');
    $data['text_shadow_options'] = $this->language->get('text_shadow_options');
    $data['text_thumb_styles'] = $this->language->get('text_thumb_styles');
    $data['text_click_functions'] = $this->language->get('text_click_functions');
    $data['text_thumb_title_positions'] = $this->language->get('text_thumb_title_positions');
    $data['text_thumb_title_displays'] = $this->language->get('text_thumb_title_displays');
    $data['text_collage_effects'] = $this->language->get('text_collage_effects');
    $data['text_collage_directions'] = $this->language->get('text_collage_directions');
    $data['text_pinto_aligns'] = $this->language->get('text_pinto_aligns');
    $data['text_pinterest_options'] = $this->language->get('text_pinterest_options');
    $data['text_loading_text'] = $this->language->get('text_loading_text');
    $data['text_resize_options'] = $this->language->get('text_resize_options');

		$data['entry_name'] = $this->language->get('entry_name');
    $data['entry_title'] = $this->language->get('entry_title');
		$data['entry_banner'] = $this->language->get('entry_banner');
		$data['entry_resize'] = $this->language->get('entry_resize');
		$data['entry_status'] = $this->language->get('entry_status');
    $data['entry_thumb_title'] = $this->language->get('entry_thumb_title');
    $data['entry_thumb_style'] = $this->language->get('entry_thumb_style');
    $data['entry_click_function'] = $this->language->get('entry_click_function');
    $data['entry_gallery_title'] = $this->language->get('entry_gallery_title');
    $data['entry_thumb_title_position'] = $this->language->get('entry_thumb_title_position');
    $data['entry_thumb_title_display'] = $this->language->get('entry_thumb_title_display');
    $data['entry_thumb_title_font_size'] = $this->language->get('entry_thumb_title_font_size');
    $data['entry_thumb_title_font_color'] = $this->language->get('entry_thumb_title_font_color');
    $data['entry_thumb_title_background_color'] = $this->language->get('entry_thumb_title_background_color');
    $data['entry_thumb_title_padding'] = $this->language->get('entry_thumb_title_padding');
    $data['entry_justify_row_height'] = $this->language->get('entry_justify_row_height');
    $data['entry_justify_max_row_height'] = $this->language->get('entry_justify_max_row_height');
    $data['entry_justify_margin'] = $this->language->get('entry_justify_margin');
    $data['entry_justify_effect'] = $this->language->get('entry_justify_effect');
    $data['entry_justify_direction'] = $this->language->get('entry_justify_direction');
    $data['entry_justify_allow_parital'] = $this->language->get('entry_justify_allow_parital');
    $data['entry_bwidth'] = $this->language->get('entry_bwidth');
    $data['entry_bheight'] = $this->language->get('entry_bheight');
    $data['entry_gwidth'] = $this->language->get('entry_gwidth');
    $data['entry_gheight'] = $this->language->get('entry_gheight');
    $data['entry_bmargin_bottom'] = $this->language->get('entry_bmargin_bottom');
    $data['entry_border'] = $this->language->get('entry_border');
    $data['entry_border_radius_top_left'] = $this->language->get('entry_border_radius_top_left');
    $data['entry_border_radius_top_right'] = $this->language->get('entry_border_radius_top_right');
    $data['entry_border_radius_bottom_left'] = $this->language->get('entry_border_radius_bottom_left');
    $data['entry_border_radius_bottom_right'] = $this->language->get('entry_border_radius_bottom_right');
    $data['entry_border_width'] = $this->language->get('entry_border_width');
    $data['entry_border_color'] = $this->language->get('entry_border_color');
    $data['entry_box_shadow'] = $this->language->get('entry_box_shadow');
    $data['entry_box_shadow_horizontal_length'] = $this->language->get('entry_box_shadow_horizontal_length');
    $data['entry_box_shadow_vertical_length'] = $this->language->get('entry_box_shadow_vertical_length');
    $data['entry_box_shadow_color'] = $this->language->get('entry_box_shadow_color');
    $data['entry_box_shadow_blur_radius'] = $this->language->get('entry_box_shadow_blur_radius');
    $data['entry_box_shadow_opacity'] = $this->language->get('entry_box_shadow_opacity');
    $data['entry_box_shadow_spread_radius'] = $this->language->get('entry_box_shadow_spread_radius');
    $data['entry_box_shadow_inset'] = $this->language->get('entry_box_shadow_inset');
    $data['entry_hover_animation'] = $this->language->get('entry_hover_animation');
    $data['entry_hover_animation_speed'] = $this->language->get('entry_hover_animation_speed');
    $data['entry_hover_animation_zoom'] = $this->language->get('entry_hover_animation_zoom');
    $data['entry_hover_animation_rotate'] = $this->language->get('entry_hover_animation_rotate');
    $data['entry_pinto_width'] = $this->language->get('entry_pinto_width');
    $data['entry_pinto_gap_x'] = $this->language->get('entry_pinto_gap_x');
    $data['entry_pinto_gap_y'] = $this->language->get('entry_pinto_gap_y');
    $data['entry_pinto_align'] = $this->language->get('entry_pinto_align');
    $data['entry_loading_text'] = $this->language->get('entry_loading_text');
    $data['entry_loading_text_color'] = $this->language->get('entry_loading_text_color');
    
    $data['help_resize'] = $this->language->get('help_resize');
    $data['help_auto'] = $this->language->get('help_auto');
    $data['help_title'] = $this->language->get('help_title');
    $data['help_thumb_title'] = $this->language->get('help_thumb_title');
    $data['help_gallery_title'] = $this->language->get('help_gallery_title');
    $data['help_click_function'] = $this->language->get('help_click_function');
    $data['help_thumb_styles'] = $this->language->get('help_thumb_styles'); 
    $data['help_thumb_title_position'] = $this->language->get('help_thumb_title_position');
    $data['help_border'] = $this->language->get('help_border');
    $data['help_box_shadow'] = $this->language->get('help_box_shadow');
    $data['help_css_transform'] = $this->language->get('help_css_transform');
    $data['help_css_transform_rotation'] = $this->language->get('help_css_transform_rotation');
    $data['help_border_width'] = $this->language->get('help_border_width');
    $data['help_speed'] = $this->language->get('help_speed');
    $data['help_zoom'] = $this->language->get('help_zoom');
    $data['help_color'] = $this->language->get('help_color');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		
		if (isset($this->error['banner'])) {
			$data['error_banner'] = $this->error['banner'];
		} else {
			$data['error_banner'] = '';
		}
    
    if (isset($this->error['bwidth'])) {
			$data['error_bwidth'] = $this->error['bwidth'];
		} else {
			$data['error_bwidth'] = '';
		}
		
		if (isset($this->error['bheight'])) {
			$data['error_bheight'] = $this->error['bheight'];
		} else {
			$data['error_bheight'] = '';
		}
    
    if (isset($this->error['gwidth'])) {
			$data['error_gwidth'] = $this->error['gwidth'];
		} else {
			$data['error_gwidth'] = '';
		}
		
		if (isset($this->error['gheight'])) {
			$data['error_gheight'] = $this->error['gheight'];
		} else {
			$data['error_gheight'] = '';
		}
    
    if (isset($this->error['loading_text_color'])) {
			$data['error_loading_text_color'] = $this->error['loading_text_color'];
		} else {
			$data['error_loading_text_color'] = '';
		}
    
    if (isset($this->error['thumb_title_font_size'])) {
			$data['error_thumb_title_font_size'] = $this->error['thumb_title_font_size'];
		} else {
			$data['error_thumb_title_font_size'] = '';
		}
    
    if (isset($this->error['thumb_title_font_color'])) {
			$data['error_thumb_title_font_color'] = $this->error['thumb_title_font_color'];
		} else {
			$data['error_thumb_title_font_color'] = '';
		}
    
    if (isset($this->error['thumb_title_background_color'])) {
			$data['error_thumb_title_background_color'] = $this->error['thumb_title_background_color'];
		} else {
			$data['error_thumb_title_background_color'] = '';
		}
    
    if (isset($this->error['justify_row_height'])) {
			$data['error_justify_row_height'] = $this->error['justify_row_height'];
		} else {
			$data['error_justify_row_height'] = '';
		}
    
    if (isset($this->error['pinto_width'])) {
			$data['error_pinto_width'] = $this->error['pinto_width'];
		} else {
			$data['error_pinto_width'] = '';
		}
    
    if (isset($this->error['hover_animation_zoom'])) {
			$data['error_hover_animation_zoom'] = $this->error['hover_animation_zoom'];
		} else {
			$data['error_hover_animation_zoom'] = '';
		}
    
    if (isset($this->error['border_color'])) {
			$data['error_border_color'] = $this->error['border_color'];
		} else {
			$data['error_border_color'] = '';
		}
    
    if (isset($this->error['box_shadow_color'])) {
			$data['error_box_shadow_color'] = $this->error['box_shadow_color'];
		} else {
			$data['error_box_shadow_color'] = '';
		}
		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/gallery_pro', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/gallery_pro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);			
		}
		
		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/gallery_pro', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/gallery_pro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}
		
		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
    
    if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = '';
		}
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
				
		if (isset($this->request->post['filter_banner_id'])) {
			$data['filter_banner_id'] = $this->request->post['filter_banner_id'];
		} elseif (!empty($module_info)) {
			$data['filter_banner_id'] = $module_info['filter_banner_id'];
		} else {
			$data['filter_banner_id'] = '';
		}
		
		$this->load->model('design/banner');

		$data['banners'] = $this->model_design_banner->getBanners();
		
		if (isset($this->request->post['resize'])) {
			$data['resize'] = $this->request->post['resize'];
		} elseif (!empty($module_info)) {
			$data['resize'] = $module_info['resize'];
		} else {
			$data['resize'] = 1;
		}	
    
    if (isset($this->request->post['thumb_title'])) {
			$data['thumb_title'] = $this->request->post['thumb_title'];
		} elseif (!empty($module_info)) {
			$data['thumb_title'] = $module_info['thumb_title'];
		} else {
			$data['thumb_title'] = 1;
		}
    
    if (isset($this->request->post['thumb_title_position'])) {
			$data['thumb_title_position'] = $this->request->post['thumb_title_position'];
		} elseif (!empty($module_info)) {
			$data['thumb_title_position'] = $module_info['thumb_title_position'];
		} else {
			$data['thumb_title_position'] = 1;
		}                            
    
    if (isset($this->request->post['thumb_title_display'])) {
			$data['thumb_title_display'] = $this->request->post['thumb_title_display'];
		} elseif (!empty($module_info)) {
			$data['thumb_title_display'] = $module_info['thumb_title_display'];
		} else {
			$data['thumb_title_display'] = 1;
		}
    
    if (isset($this->request->post['thumb_title_font_size'])) {
			$data['thumb_title_font_size'] = $this->request->post['thumb_title_font_size'];
		} elseif (!empty($module_info)) {
			$data['thumb_title_font_size'] = $module_info['thumb_title_font_size'];
		} else {
			$data['thumb_title_font_size'] = "12px";
		}
    
    if (isset($this->request->post['thumb_title_font_color'])) {
			$data['thumb_title_font_color'] = $this->request->post['thumb_title_font_color'];
		} elseif (!empty($module_info)) {
			$data['thumb_title_font_color'] = $module_info['thumb_title_font_color'];
		} else {
			$data['thumb_title_font_color'] = "#fff";
		}
    
    if (isset($this->request->post['thumb_title_background_color'])) {
			$data['thumb_title_background_color'] = $this->request->post['thumb_title_background_color'];
		} elseif (!empty($module_info)) {
			$data['thumb_title_background_color'] = $module_info['thumb_title_background_color'];
		} else {
			$data['thumb_title_background_color'] = "rgba(0,0,0,0.5)";
		}
    
    if (isset($this->request->post['thumb_title_padding'])) {
			$data['thumb_title_padding'] = $this->request->post['thumb_title_padding'];
		} elseif (!empty($module_info)) {
			$data['thumb_title_padding'] = $module_info['thumb_title_padding'];
		} else {
			$data['thumb_title_padding'] = 10;
		}
    
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
    
    
    if (isset($this->request->post['thumb_style'])) {
			$data['thumb_style'] = $this->request->post['thumb_style'];
		} elseif (!empty($module_info)) {
			$data['thumb_style'] = $module_info['thumb_style'];
		} else {
			$data['thumb_style'] = 1;
		}
    
    if (isset($this->request->post['click_function'])) {
			$data['click_function'] = $this->request->post['click_function'];
		} elseif (!empty($module_info)) {
			$data['click_function'] = $module_info['click_function'];
		} else {
			$data['click_function'] = 0;
		}
    
    if (isset($this->request->post['gallery_title'])) {
			$data['gallery_title'] = $this->request->post['gallery_title'];
		} elseif (!empty($module_info)) {
			$data['gallery_title'] = $module_info['gallery_title'];
		} else {
			$data['gallery_title'] = 1;
		}
    
    if (isset($this->request->post['justify_row_height'])) {
			$data['justify_row_height'] = $this->request->post['justify_row_height'];
		} elseif (!empty($module_info)) {
			$data['justify_row_height'] = $module_info['justify_row_height'];
		} else {
			$data['justify_row_height'] = 250;
		}
    
    if (isset($this->request->post['justify_effect'])) {
			$data['justify_effect'] = $this->request->post['justify_effect'];
		} elseif (!empty($module_info)) {
			$data['justify_effect'] = $module_info['justify_effect'];
		} else {
			$data['justify_effect'] = 'default';
		}
    
    if (isset($this->request->post['justify_margin'])) {
			$data['justify_margin'] = $this->request->post['justify_margin'];
		} elseif (!empty($module_info)) {
			$data['justify_margin'] = $module_info['justify_margin'];
		} else {
			$data['justify_margin'] = 5;
		}
    
    if (isset($this->request->post['justify_direction'])) {
			$data['justify_direction'] = $this->request->post['justify_direction'];
		} elseif (!empty($module_info)) {
			$data['justify_direction'] = $module_info['justify_direction'];
		} else {
			$data['justify_direction'] = 0;
		}
    
    if (isset($this->request->post['justify_allow_parital'])) {
			$data['justify_allow_parital'] = $this->request->post['justify_allow_parital'];
		} elseif (!empty($module_info)) {
			$data['justify_allow_parital'] = $module_info['justify_allow_parital'];
		} else {
			$data['justify_allow_parital'] = 0;
		}
    
    if (isset($this->request->post['bwidth'])) {
			$data['bwidth'] = $this->request->post['bwidth'];
		} elseif (!empty($module_info)) {
			$data['bwidth'] = $module_info['bwidth'];
		} else {
			$data['bwidth'] = 320;
		}
    
    if (isset($this->request->post['bheight'])) {
			$data['bheight'] = $this->request->post['bheight'];
		} elseif (!empty($module_info)) {
			$data['bheight'] = $module_info['bheight'];
		} else {
			$data['bheight'] = 180;
		}
    
    if (isset($this->request->post['gwidth'])) {
			$data['gwidth'] = $this->request->post['gwidth'];
		} elseif (!empty($module_info)) {
			$data['gwidth'] = $module_info['gwidth'];
		} else {
			$data['gwidth'] = 800;
		}
    
    if (isset($this->request->post['gheight'])) {
			$data['gheight'] = $this->request->post['gheight'];
		} elseif (!empty($module_info)) {
			$data['gheight'] = $module_info['gheight'];
		} else {
			$data['gheight'] = 600;
		}
    
    if (isset($this->request->post['bmargin_bottom'])) {
			$data['bmargin_bottom'] = $this->request->post['bmargin_bottom'];
		} elseif (!empty($module_info)) {
			$data['bmargin_bottom'] = $module_info['bmargin_bottom'];
		} else {
			$data['bmargin_bottom'] = 10;
		}
    
    if (isset($this->request->post['hover_animation'])) {
			$data['hover_animation'] = $this->request->post['hover_animation'];
		} elseif (!empty($module_info)) {
			$data['hover_animation'] = $module_info['hover_animation'];
		} else {
			$data['hover_animation'] = 1;
		}
    
    if (isset($this->request->post['hover_animation_speed'])) {
			$data['hover_animation_speed'] = $this->request->post['hover_animation_speed'];
		} elseif (!empty($module_info)) {
			$data['hover_animation_speed'] = $module_info['hover_animation_speed'];
		} else {
			$data['hover_animation_speed'] = 0.5;
		}
    
    if (isset($this->request->post['hover_animation_zoom'])) {
			$data['hover_animation_zoom'] = $this->request->post['hover_animation_zoom'];
		} elseif (!empty($module_info)) {
			$data['hover_animation_zoom'] = $module_info['hover_animation_zoom'];
		} else {
			$data['hover_animation_zoom'] = 1.2;
		}
    
    if (isset($this->request->post['hover_animation_rotate'])) {
			$data['hover_animation_rotate'] = $this->request->post['hover_animation_rotate'];
		} elseif (!empty($module_info)) {
			$data['hover_animation_rotate'] = $module_info['hover_animation_rotate'];
		} else {
			$data['hover_animation_rotate'] = 5;
		}
    
    if (isset($this->request->post['border'])) {
			$data['border'] = $this->request->post['border'];
		} elseif (!empty($module_info)) {
			$data['border'] = $module_info['border'];
		} else {
			$data['border'] = 0;
		}
    
    if (isset($this->request->post['border_radius_top_left'])) {
			$data['border_radius_top_left'] = $this->request->post['border_radius_top_left'];
		} elseif (!empty($module_info)) {
			$data['border_radius_top_left'] = $module_info['border_radius_top_left'];
		} else {
			$data['border_radius_top_left'] = 10;
		}
    
    if (isset($this->request->post['border_radius_top_right'])) {
			$data['border_radius_top_right'] = $this->request->post['border_radius_top_right'];
		} elseif (!empty($module_info)) {
			$data['border_radius_top_right'] = $module_info['border_radius_top_right'];
		} else {
			$data['border_radius_top_right'] = 10;
		}
    
    if (isset($this->request->post['border_radius_bottom_left'])) {
			$data['border_radius_bottom_left'] = $this->request->post['border_radius_bottom_left'];
		} elseif (!empty($module_info)) {
			$data['border_radius_bottom_left'] = $module_info['border_radius_bottom_left'];
		} else {
			$data['border_radius_bottom_left'] = 10;
		}
    
    if (isset($this->request->post['border_radius_bottom_right'])) {
			$data['border_radius_bottom_right'] = $this->request->post['border_radius_bottom_right'];
		} elseif (!empty($module_info)) {
			$data['border_radius_bottom_right'] = $module_info['border_radius_bottom_right'];
		} else {
			$data['border_radius_bottom_right'] = 10;
		}
    
    if (isset($this->request->post['border_width'])) {
			$data['border_width'] = $this->request->post['border_width'];
		} elseif (!empty($module_info)) {
			$data['border_width'] = $module_info['border_width'];
		} else {
			$data['border_width'] = 0;
		}
    
    if (isset($this->request->post['border_color'])) {
			$data['border_color'] = $this->request->post['border_color'];
		} elseif (!empty($module_info)) {
			$data['border_color'] = $module_info['border_color'];
		} else {
			$data['border_color'] = '#000';
		}
    
    if (isset($this->request->post['box_shadow'])) {
			$data['box_shadow'] = $this->request->post['box_shadow'];
		} elseif (!empty($module_info)) {
			$data['box_shadow'] = $module_info['box_shadow'];
		} else {
			$data['box_shadow'] = 0;
		}
    
    if (isset($this->request->post['box_shadow_horizontal_length'])) {
			$data['box_shadow_horizontal_length'] = $this->request->post['box_shadow_horizontal_length'];
		} elseif (!empty($module_info)) {
			$data['box_shadow_horizontal_length'] = $module_info['box_shadow_horizontal_length'];
		} else {
			$data['box_shadow_horizontal_length'] = 0;
		}
    
    if (isset($this->request->post['box_shadow_vertical_length'])) {
			$data['box_shadow_vertical_length'] = $this->request->post['box_shadow_vertical_length'];
		} elseif (!empty($module_info)) {
			$data['box_shadow_vertical_length'] = $module_info['box_shadow_vertical_length'];
		} else {
			$data['box_shadow_vertical_length'] = 0;
		}
    
    if (isset($this->request->post['box_shadow_blur_radius'])) {
			$data['box_shadow_blur_radius'] = $this->request->post['box_shadow_blur_radius'];
		} elseif (!empty($module_info)) {
			$data['box_shadow_blur_radius'] = $module_info['box_shadow_blur_radius'];
		} else {
			$data['box_shadow_blur_radius'] = 50;
		}
    
    if (isset($this->request->post['box_shadow_color'])) {
			$data['box_shadow_color'] = $this->request->post['box_shadow_color'];
		} elseif (!empty($module_info)) {
			$data['box_shadow_color'] = $module_info['box_shadow_color'];
		} else {
			$data['box_shadow_color'] = 'rgba(0,0,0,0.2)';
		}
    
    if (isset($this->request->post['box_shadow_spread_radius'])) {
			$data['box_shadow_spread_radius'] = $this->request->post['box_shadow_spread_radius'];
		} elseif (!empty($module_info)) {
			$data['box_shadow_spread_radius'] = $module_info['box_shadow_spread_radius'];
		} else {
			$data['box_shadow_spread_radius'] = 0;
		}
    
    if (isset($this->request->post['pinto_width'])) {
			$data['pinto_width'] = $this->request->post['pinto_width'];
		} elseif (!empty($module_info)) {
			$data['pinto_width'] = $module_info['pinto_width'];
		} else {
			$data['pinto_width'] = 220;
		}
    
    if (isset($this->request->post['pinto_gap_x'])) {
			$data['pinto_gap_x'] = $this->request->post['pinto_gap_x'];
		} elseif (!empty($module_info)) {
			$data['pinto_gap_x'] = $module_info['pinto_gap_x'];
		} else {
			$data['pinto_gap_x'] = 5;
		}
    
    if (isset($this->request->post['pinto_gap_y'])) {
			$data['pinto_gap_y'] = $this->request->post['pinto_gap_y'];
		} elseif (!empty($module_info)) {
			$data['pinto_gap_y'] = $module_info['pinto_gap_y'];
		} else {
			$data['pinto_gap_y'] = 5;
		}
    
    if (isset($this->request->post['pinto_align'])) {
			$data['pinto_align'] = $this->request->post['pinto_align'];
		} elseif (!empty($module_info)) {
			$data['pinto_align'] = $module_info['pinto_align'];
		} else {
			$data['pinto_align'] = 'left';
		}
    
    if (isset($this->request->post['loading_text_color'])) {
			$data['loading_text_color'] = $this->request->post['loading_text_color'];
		} elseif (!empty($module_info)) {
			$data['loading_text_color'] = $module_info['loading_text_color'];
		} else {
			$data['loading_text_color'] = '#666';
		}
    
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/gallery_pro', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/gallery_pro')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
				
		if (!$this->request->post['filter_banner_id']) {
			$this->error['banner'] = $this->language->get('error_banner');
		}
    
    if (isset($this->request->post['thumb_style'])) { 
    
       if ($this->request->post['thumb_style'] == 0) {
      
        if (!$this->request->post['bwidth']) {
    			$this->error['bwidth'] = $this->language->get('error_width');
    		}
    		
    		if (!$this->request->post['bheight']) {
    			$this->error['bheight'] = $this->language->get('error_height');
    		}
      
      }
      
      if ($this->request->post['thumb_style'] == 1) {
      
        if ($this->request->post['justify_row_height']<100 || $this->request->post['justify_row_height']>600) {
    			$this->error['justify_row_height'] = $this->language->get('error_justify_row_height');
    		}
      
      }
      
      if ($this->request->post['thumb_style'] == 2) {
      
        if ($this->request->post['pinto_width']<100 || $this->request->post['pinto_width']>400) {
    			$this->error['pinto_width'] = $this->language->get('error_pinto_width');
    		}
      
      }
    
    }
    
    if (!empty($this->request->post['resize'])) {
    
      if (!$this->request->post['gwidth']) {
  			$this->error['gwidth'] = $this->language->get('error_width');
  		}
  		
  		if (!$this->request->post['gheight']) {
  			$this->error['gheight'] = $this->language->get('error_height');
  		}
    
    }
    
    if (!$this->request->post['loading_text_color']) {
  	 $this->error['loading_text_color'] = $this->language->get('error_color');
  	}
    
    if (isset($this->request->post['thumb_title']) && $this->request->post['thumb_title'] == 1) {
    
      if (!$this->request->post['thumb_title_font_size']) {
  			$this->error['thumb_title_font_size'] = $this->language->get('error_size');
  		}
  		
  		if (!$this->request->post['thumb_title_font_color']) {
  			$this->error['thumb_title_font_color'] = $this->language->get('error_color');
  		}
      
      if (!$this->request->post['thumb_title_background_color']) {
  			$this->error['thumb_title_background_color'] = $this->language->get('error_background_color');
  		}
    
    }
    
    if (isset($this->request->post['hover_animation']) && $this->request->post['hover_animation'] == 1) {
    
  		if (!$this->request->post['hover_animation_zoom']) {
  			$this->error['hover_animation_zoom'] = $this->language->get('error_zoom');
  		}
    
    }
    
    if (isset($this->request->post['border']) && $this->request->post['border'] == 1) {
    
  		if (!$this->request->post['border_color']) {
  			$this->error['border_color'] = $this->language->get('error_color');
  		}
    
    }
    
    if (isset($this->request->post['box_shadow']) && $this->request->post['box_shadow'] == 1) {
    
  		if (!$this->request->post['box_shadow_color']) {
  			$this->error['box_shadow_color'] = $this->language->get('error_color');
  		}
    
    }
    
		return !$this->error;
	}
}