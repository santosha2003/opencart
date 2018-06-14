<?php
/**
 * @package     default2 Theme
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2016, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

class ControllerExtensionThemeDefault2 extends Controller
{
    private $theme = 'default2'; // theme folder

    public function install()
    {
        $this->rhythm->loadData($this->theme);
        $this->rhythm->library('model')->install();
    }

    public function uninstall()
    {
        $this->rhythm->loadData($this->theme);
        $this->rhythm->library('model')->uninstall();
    }

    public function update()
    {
        $this->rhythm->loadData($this->theme);
        $this->rhythm->library('model')->update();
    }


    // ========================================================================

    public function index()
    {
        // Validate store
        if (!isset($this->request->get['store_id'])) {
            $this->response->redirect($this->url->link('extension/theme', 'token=' . $this->session->data['token'], true));
        }

        //=== Init
        $this->rhythm->loadData($this->theme);
        if ($this->rhythm->library('model')->isNeedUpdate($this->theme, $this->rhythm->getData('version'))) {
            $this->update();
        }

        $theme_config   = $this->rhythm->getData('config');
        $custom_presets = $this->rhythm->library('model')->getAllPresets();
        $meta_presets   = array();
        foreach ($this->rhythm->getData('presets') as $preset) {
            $temp_preset = json_decode($preset, true);
            $meta_presets[$temp_preset['preset_id']] = $temp_preset;
        }

        $all_presets      = $meta_presets + $custom_presets;
        $store_id         = $this->request->get['store_id'];
        $active_preset_id = $this->rhythm->library('model')->getActivePresets($store_id);
        $preset_id        = isset($this->request->get['preset_id']) ? $this->request->get['preset_id'] : 0;
        $preset_id        = $preset_id ?: $active_preset_id;

        if (empty($preset_id) || !isset($all_presets[$preset_id])) {
            $preset_id = array_rand($all_presets);
        }

        $data  = array();
        $data += $this->load->language('extension/theme/' . $this->theme);

        $form  = $preset_id ? array_merge($this->rhythm->getData('setting'), $all_presets[$preset_id]) : $this->rhythm->getData('setting');
        $form['config'][$this->theme . '_status'] = $this->rhythm->library('model')->getSettingValue($this->theme, $this->theme . '_status', $store_id);

        //=== Document
        $this->document->setTitle($this->rhythm->getData('name'));

        $this->rhythm->library('document')->loadAdminAsset();
        $this->document->addStyle('view/stylesheet/' . $this->theme . '/style.min.css?v=' . $this->rhythm->getData('version'), 'stylesheet');

        //=== Breadcrumbs
        $data['breadcrumbs']    = array();
        $data['breadcrumbs'][]  = array(
            'text'  => '<i class="uk-icon-home uk-icon-nano"></i>',
            'href'  => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true),
            'class' => ''
        );
        $data['breadcrumbs'][]  = array(
            'text'  => $this->language->get('text_theme'),
            'href'  => $this->url->link('extension/extension', 'type=theme&token=' . $this->session->data['token'], true),
            'class' => '',
        );
        $data['breadcrumbs'][]  = array(
            'text'  => $this->rhythm->getData('name'),
            'href'  => $this->url->link('extension/theme/' . $this->theme, 'store_id=' . $store_id . '&preset_id=' . $preset_id . '&token=' . $this->session->data['token'], true),
            'class' => 'active',
        );

        //=== Content
        $data['store_id']           = $store_id;
        $data['token']              = $this->session->data['token'];
        $data['url_close']          = $this->url->link('extension/extension', 'type=theme&token=' . $this->session->data['token'], true);
        $data['form_action']        = $this->url->link('extension/theme/' . $this->theme . '/save', 'store_id=' . $store_id . '&token=' . $this->session->data['token'], true);
        
        $data['theme_name']         = $this->rhythm->getData('name');
        $data['theme_version']      = $this->rhythm->getData('version');
        $data['theme_folder']       = $this->theme;
        $data['theme_info']         = $this->rhythm->getData('info');

        $data['preset_id']          = $preset_id;
        $data['active_preset_id']   = $active_preset_id;
        $data['all_presets']        = array(
            $this->language->get('text_preset_default') => $meta_presets,
            $this->language->get('text_preset_custom')  => $custom_presets
        );

        $data['form']               = $form;
        $data['custom_css']         = $this->rhythm->library('tool')->getFileContent('style/build/custom-style-' . $preset_id . '.less', $this->theme);


        // Styling
        $fonts = $this->rhythm->getData('fonts');
        $data['fonts'] = array();
        foreach ($fonts as $key => $value) {
            $data['fonts'][ucwords($value['group'])][$key] = $value['title'];
        }

        // Page Options
        $this->load->model('catalog/category');
        for ($i=1; $i <= $theme_config['template_options']['category']; $i++) { 
            $categories = array();
            $temp_data  = !is_array($form['template_category_specific_' . $i]) ? array_map('trim', explode(',', $form['template_category_specific_' . $i])) : $form['template_category_specific_' . $i];
            $temp_data  = count($temp_data) == 1 && !$temp_data[0] ? array() : $temp_data;

            foreach ($temp_data as $category_id) {
                $category_info = $this->model_catalog_category->getCategory($category_id);

                if ($category_info) {
                    $categories[] = array(
                        'id'    => $category_info['category_id'],
                        'name'  => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
                    );
                }
            }

            $data['form']['template_category_specific_' . $i] = $categories;
        }

        $this->load->model('catalog/product');
        for ($i=1; $i <= $theme_config['template_options']['product']; $i++) { 
            $products   = array();
            $temp_data  = !is_array($form['template_product_specific_' . $i]) ? array_map('trim', explode(',', $form['template_product_specific_' . $i])) : $form['template_product_specific_' . $i];
            $temp_data  = count($temp_data) == 1 && !$temp_data[0] ? array() : $temp_data;

            foreach ($temp_data as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);

                if ($product_info) {
                    $products[] = array(
                        'id'    => $product_info['product_id'],
                        'name'  => $product_info['name']
                    );
                }
            }

            $data['form']['template_product_specific_' . $i] = $products;
        }


        // Block Position
        $data['block_widths'] =  $this->rhythm->getData('block_widths');

        $positions = $this->rhythm->getData('positions');
        $data['positions'] = array();
        foreach ($positions as $key => $value) {
            if ($value['block_opt']) {
                $data['positions'][$key] = $value['title'];
            }
        }

        // Warn user if no preset is activated for current store
        if (!$active_preset_id) {
            $this->session->data[$this->theme . '_alert_warning'] = $this->language->get('text_no_preset_active');
        }

        // Warn user if theme status disabled on active preset
        if ($preset_id == $active_preset_id && !$data['form']['config'][$this->theme . '_status']) {
            $this->session->data[$this->theme . '_alert_danger'] = $this->language->get('text_theme_not_enabled');
        }

        // Global Alerts
        $alerts = array('success', 'danger', 'warning');
        foreach ($alerts as $alert) {
            if (isset($this->session->data[$this->theme . '_alert_' . $alert])) {
                $data['alert_'.$alert] = $this->session->data[$this->theme . '_alert_' . $alert];
                unset($this->session->data[$this->theme . '_alert_' . $alert]);
            }
        }
        $data['alerts'] = $alerts;

        //=== H-MVC
        $data['header']             = $this->load->controller('common/header');
        $data['column_left']        = $this->load->controller('common/column_left');
        $data['footer']             = $this->load->controller('common/footer');

        //=== Render
        $this->response->setOutput($this->load->view('extension/theme/' . $this->theme, $data));        
    }

    public function save()
    {
        $post     = $this->request->post;
        $store_id = $this->request->get['store_id'];

        $this->rhythm->loadData($this->theme);
        $this->load->language('extension/theme/' . $this->theme);

        if (!$this->user->hasPermission('modify', 'extension/theme/' . $this->theme)) {
            $post['error']    = true;
            $post['errorMsg'] = $this->language->get('js_error_permission');
            $post['errorStatus'] = 'danger';

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($post));
        }
        elseif ($post['is_protected'] && (isset($post['activate']) || isset($post['delPresetId']) || isset($post['save']))) {
            $post['error']    = true;
            $post['errorMsg'] = $this->language->get('js_error_protected');
            $post['errorStatus'] = 'warning';

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($post));
        }
        else {
            $custom_css     = isset($post['custom_css']) ? htmlspecialchars_decode($post['custom_css']) : '';
            $post['uniqid'] = uniqid();

            unset($post['custom_css']);

            if (isset($post['activate'])) {
                $post['is_activate'] = 1;
                $this->rhythm->library('model')->savePreset($this->theme, $post, $store_id);
                $this->rhythm->library('model')->activatePreset($this->theme, $post['preset_id'], $store_id);
            }
            elseif (isset($post['newPresetId'])) {
                $newPresetId = (int)$post['newPresetId'] + 1;

                $this->rhythm->library('model')->newPreset($this->theme, $newPresetId);

                $post['redirect'] = str_replace('&amp;', '&', $this->url->link('extension/theme/' . $this->theme, 'store_id=' . $store_id . '&preset_id=' . $newPresetId . '&token=' . $this->session->data['token'], true));
            }
            elseif (isset($post['copyPresetId'])) {
                $newPresetId         = (int)$post['copyPresetId'] + 1;
                $post['preset_id']   = $newPresetId;
                $post['preset_name'] = $post['preset_name'] . ' - COPY';

                $this->rhythm->library('model')->savePreset($this->theme, $post, $store_id);

                $post['redirect'] = str_replace('&amp;', '&', $this->url->link('extension/theme/' . $this->theme, 'store_id=' . $store_id . '&preset_id=' . $newPresetId . '&token=' . $this->session->data['token'], true));
            }
            elseif (isset($post['delPresetId'])) {
                $this->rhythm->library('model')->delPreset($this->theme, $post['preset_id']);

                $post['redirect'] = str_replace('&amp;', '&', $this->url->link('extension/theme/' . $this->theme, 'store_id=' . $store_id . '&token=' . $this->session->data['token'], true));
            }
            else {
                $this->rhythm->library('model')->savePreset($this->theme, $post, $store_id);
            }

            $path  = DIR_CATALOG . 'view/theme/' . $this->theme . '/style/';
            $fonts = $this->rhythm->getData('fonts');
            $variables = array(
                'container-tablet'      => $post['container_tablet'],
                'container-desktop'     => $post['container_desktop'],
                'container-xdesktop'    => $post['container_xdesktop'],
                'font-heading'          => $fonts[$post['font_header']]['style'],
                'font-base'             => $fonts[$post['font_base']]['style'],
                'font-size'             => $post['font_size'],
                'font-color'            => $post['font_color'],
                'link-color'            => $post['link_color'],
                'btn-primary-color'     => $post['btn_primary_color'],
                'btn-primary-bg'        => $post['btn_primary_bg'],
                'btn-cart-color'        => $post['btn_cart_color'],
                'btn-cart-bg'           => $post['btn_cart_bg'],
                'btn-wishlist-color'    => $post['btn_wishlist_color'],
                'btn-wishlist-bg'       => $post['btn_wishlist_bg'],
                'btn-compare-color'     => $post['btn_compare_color'],
                'btn-compare-bg'        => $post['btn_compare_bg'],
            );

            // Generate preset stylesheet
            if ($post['is_activate'] || isset($post['activate'])) {
                $file_input  = $path . 'less/theme-preset.less';
                $file_output = $path . 'build/theme-preset-' . $post['preset_id'] . '.min.css';
                $this->rhythm->library('tool')->lessCompile($file_input, $file_output, $variables);
            }

            // Custom stylesheet
            $file_input  = $path . 'build/custom-style-' . $post['preset_id'] . '.less';
            $file_output = $path . 'build/custom-style-' . $post['preset_id'] . '.min.css';
            if ($custom_css) {
                $this->rhythm->library('tool')->editFileContent($file_input, 'w', $custom_css);
                $this->rhythm->library('tool')->lessCompile($file_input, $file_output, $variables);
            } else {
                if (file_exists($file_input)) { unlink($file_input); }
                if (file_exists($file_output)) { unlink($file_output); }
            }

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($post));
        }
    }
}