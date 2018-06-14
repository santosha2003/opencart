<?php
/**
 * @package     default2 Theme
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2016, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

class ControllerEventDefault2 extends Controller
{
    /**
     * Extra code to product
     *
     * Events trigger: catalog/view/product/product/before
     */
    public function product_product(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder'))
        {
            if (isset($data['product_id'])) // Make sure isn't not found page
            {
                $product_id     = $this->request->get['product_id'];
                $theme_preset   = $this->rhythm->getAllPreset();
                $theme_config   = $this->rhythm->getData('config');

                // Chunk template
                $data['chunk_product_detail']   = $this->load->view('_chunk/catalog_product_detail', $data);
                $data['chunk_product_option']   = $this->load->view('_chunk/catalog_product_option', $data);
                $data['chunk_product_image']    = $this->load->view('_chunk/catalog_product_image', $data);
                $data['chunk_product_content']  = $this->load->view('_chunk/catalog_product_content', $data);
                $data['chunk_product_related']  = $this->load->view('_chunk/catalog_product_related', $data);

                // Specific Template
                $template_product   = $theme_preset['template_product'];
                $template_options   = array_diff(range(1, $theme_config['template_options']['category']), array($template_product));

                foreach ($template_options as $opt) {
                    if (!empty($theme_preset['template_product_specific_' . $opt])) {
                        if (in_array($product_id, $theme_preset['template_product_specific_' . $opt])) {
                            $template_product = $opt;
                            break;
                        }
                    }
                }

                $view = $this->rhythm->library('template')->getPath($view, $template_product);
            }
        }
    }

    /**
     * Extra code to product category
     *
     * Events trigger: catalog/view/product/category/before
     */
    public function product_category(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder'))
        {
            if (isset($data['products'])) // Make sure isn't not found page
            {
                $parts          = explode('_', (string)$this->request->get['path']);
                $category_id    = (int)array_pop($parts);
                $theme_preset   = $this->rhythm->getAllPreset();
                $theme_config   = $this->rhythm->getData('config');

                // Clean category description from only <p> tags
                $data['description'] = $this->rhythm->library('format')->strip_tags($data['description']) ? $this->rhythm->library('format')->decode($data['description']) : '';

                // Sub-categories
                $results = $this->model_catalog_category->getCategories($category_id);

                $categories = array();
                foreach ($results as $result) {
                    $categories[] = array(
                        'name'      => $result['name'],
                        'image'     => $result['image'] ? $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_category_width'), $this->config->get($this->config->get('config_theme') . '_image_category_height')) : '',
                        'image_raw' => $result['image'],
                        'desc'      => $this->rhythm->library('format')->strip_tags($result['description']) ? $this->rhythm->library('format')->decode($result['description']) : '',
                    );
                }

                $data['categories'] = $categories = $this->rhythm->array_merge_recursive_distinct($data['categories'], $categories);

                // Chunk template
                $data['chunk_category_thumb'] = $this->load->view('_chunk/catalog_category_thumb', $data);

                // Specific Template
                $template_category  = $theme_preset['template_category'];
                $template_options   = array_diff(range(1, $theme_config['template_options']['category']), array($template_category));

                foreach ($template_options as $opt) {
                    if (!empty($theme_preset['template_category_specific_' . $opt])) {
                        if (in_array($category_id, $theme_preset['template_category_specific_' . $opt])) {
                            $template_category = $opt;
                            break;
                        }
                    }
                }

                if ($template_category == '2' && !empty($categories)) {
                    $data['categories'] = array();
                    foreach ($categories as $i => $category) {
                        $data['categories'][$i] = $category;
                        $data['categories'][$i]['image'] = $category['image_raw'] ? $this->model_tool_image->resize($category['image_raw'], $theme_preset['child_thumb_size_width'], $theme_preset['child_thumb_size_height']) : '';
                    }
                } else {
                    // Show product if template #2 doesn't have child category
                    $template_category = 1;
                }

                $view = $this->rhythm->library('template')->getPath($view, $template_category);
            }
        }
    }

    /**
     * Manufacturer template chunk
     *
     * Events trigger: catalog/view/product/manufacturer_info/before
     */
    public function product_manufacturer_info(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder'))
        {
            if (isset($data['products'])) // Make sure isn't not found page
            {
                // Chunk template
                $data['chunk_category_thumb'] = $this->load->view('_chunk/catalog_category_thumb', $data);
            }
        }
    }

    /**
     * Search template chunk
     *
     * Events trigger: catalog/view/product/search/before
     */
    public function product_search(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder'))
        {
            // Chunk template
            $data['chunk_category_thumb'] = $this->load->view('_chunk/catalog_category_thumb', $data);
        }
    }

    /**
     * Special template chunk
     *
     * Events trigger: catalog/view/product/special/before
     */
    public function product_special(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder'))
        {
            // Chunk template
            $data['chunk_category_thumb'] = $this->load->view('_chunk/catalog_category_thumb', $data);
        }
    }

    /**
     * Extra code to information contact
     *
     * Events trigger: catalog/view/information/contact/before
     */
    public function information_contact(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder'))
        {
            $data['mapapi']  = $this->rhythm->getPreset('mapapi');
            $data['geocode'] = $this->rhythm->getPreset('geocode') ?: $data['geocode'];

            $view = $this->rhythm->library('template')->getPath($view, $this->rhythm->getPreset('template_contact'));
        }
    }

    /**
     * Add extra body-class for maintenance mode
     *
     * Events trigger: catalog/rhythm/common/maintenance
     */
    public function maintenance_class(&$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder')) {
            $this->rhythm->library('document')->addNode('body_class', 'blank-mode');
        }
    }

    /**
     * Add extra body-class for 404 not-found
     *
     * Events trigger: catalog/rhythm/error/not_found
     */
    public function error_not_found_class(&$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder')) {
            if ($this->rhythm->getPreset('template_404') == '2') {
                $this->rhythm->library('document')->addNode('body_class', 'blank-mode');
            }
        }
    }

    /**
     * Custom 404 not found page
     *
     * Events trigger: catalog/view/error/not_found/before
     */
    public function error_not_found(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder') && isset($data['controller_error_notfound'])) {
            $this->load->language('extension/theme/' . $this->rhythm->getData('folder'));

            $data['not_found_info']     = $this->language->get('text_notfound_info');
            $data['text_home']          = $this->language->get('text_home');
            $data['text_sitemap']       = $this->language->get('text_sitemap');
            $data['text_contact']       = $this->language->get('text_contact');

            $data['link_home']          = $this->url->link('common/home');
            $data['link_sitemap']       = $this->url->link('information/sitemap');
            $data['link_contact']       = $this->url->link('information/contact');

            $view = $this->rhythm->getData('folder') . '/template/error/404';
        }
    }

    /**
     * Module Categry: Separating product count from category title
     *
     * Events trigger: catalog/view/module/category/before
     */
    public function module_category(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder')) {
            $this->load->model('catalog/category');
            $this->load->model('catalog/product');

            $categories = $this->model_catalog_category->getCategories(0);

            $data['categories'] = array();
            foreach ($categories as $category) {
                $children_data = array();

                if ($category['category_id'] == $data['category_id']) {
                    $children = $this->model_catalog_category->getCategories($category['category_id']);

                    foreach($children as $child) {
                        $filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

                        $children_data[] = array(
                            'category_id' => $child['category_id'],
                            'name'        => $child['name'],
                            'count'       => $this->config->get('config_product_count') ? $this->model_catalog_product->getTotalProducts($filter_data) : '',
                            'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                        );
                    }
                }

                $filter_data = array('filter_category_id' => $category['category_id'], 'filter_sub_category' => true );

                $data['categories'][] = array(
                    'category_id' => $category['category_id'],
                    'name'        => $category['name'],
                    'count'       => $this->config->get('config_product_count') ? $this->model_catalog_product->getTotalProducts($filter_data) : '',
                    'children'    => $children_data,
                    'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }
    }

    /**
     * Module filter
     *
     * Events trigger: catalog/view/module/filter/before
     */
    public function module_filter(&$view, &$data)
    {
        if ($this->config->get('config_theme') == $this->rhythm->getData('folder')) {
            $this->load->language('extension/theme/' . $this->rhythm->getData('folder'));
            $data['button_clear'] = $this->language->get('text_clear_filter');
        }
    }
}