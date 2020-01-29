<?php
/**
 * version 1.0
 * модуль для Opencart 2.3
 * тестировался на 370 категориях и 30к товаров.
 * Author: olaff (simbmail@mail.ru)
 */
class ControllerExtensionFeedYandexSitemap extends Controller
{
    const YANDEX_SITEMAP_FILENAME = 'yandex_sitemap.xml'; //имя файла для сайтмап
    protected $eol = "\n"; //окончание строки для pretty formating
    private $products = array(); //массив с продуктами
    private $output = ''; //строка вывода
    private $file_time_expired = '3600'; //in seconds -время хранения файла
    const DEBUG_MODE = false;

    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->load->model('extension/feed/yandex_sitemap');
    }

    /**
     * если файл не валидный(отсутвует либо старый) - то пишем в него и показываем его иначе просто показываем его
     */
    public function index()
    {
    	if($this->config->get('yandex_sitemap_status')){
    		if ($this->needWriteFile() || self::DEBUG_MODE === true) {
            	$this->setOutput();
            	$this->saveToFile(self::YANDEX_SITEMAP_FILENAME, $this->output);
	        } else {
	            $this->setOutputFromFile(self::YANDEX_SITEMAP_FILENAME);
	        }
	        $this->displayYml($this->output);
    	}else{
    		echo 'module is off';
    	}
        
    }

    /**
     * @return bool - если надо записать файла -false иначе true
     */
    public function needWriteFile()
    {
        if (is_file(self::YANDEX_SITEMAP_FILENAME)) {
            if ($this->isValidFileTime()) {
                return false;
            }
        }
        return true;
    }

    /**
     * проверяем время файла - если больше чем в настройках - false
     * @return bool
     */
    private function isValidFileTime()
    {
        $time = time() - filemtime(self::YANDEX_SITEMAP_FILENAME);
        if ($time > $this->file_time_expired) {
            return false;
        }
        return true;
    }

    /**
     * формируем текс yml для вывода или для сохранения
     * @return bool true || false - если модуль выключен
     */
    private function setOutput()
    {
        if ($this->config->get('yandex_sitemap_status')) {
            $this->output = '<?xml version="1.0" encoding="UTF-8"?>' . $this->eol;
            $this->output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . $this->eol;

            $this->setProducts();

            foreach ($this->products as $product) {
                $this->output .= '<url>' . $this->eol;
                $this->output .= '<loc>' . $this->url->link('product/product',
                        'product_id=' . $product['product_id'], true) . '</loc>' . $this->eol;
                $this->output .= '<changefreq>weekly</changefreq>' . $this->eol;

                //так как даты может не быть - в яндексе будет предупреждение о неврном формате (так как в базе может быть
                //время строка вида 0000-00-00 00:00:00 а не null
                $actual_date = false;
                if ($product['date_modified'] && ($product['date_modified'] != '0000-00-00 00:00:00')) {
                    $actual_date = strtotime($product['date_modified']);
                }
                if (!$actual_date && $product['date_added'] && ($product['date_added'] != '0000-00-00 00:00:00')) {
                    $actual_date = strtotime($product['date_added']);
                }
                
                if ($actual_date !== false) {
                    $this->output .= '<lastmod>' . date('Y-m-d\TH:i:sP', $actual_date) . '</lastmod>' . $this->eol;
                }
                
                $this->output .= '<priority>1.0</priority>' . $this->eol;
                $this->output .= '</url>' . $this->eol;

            }

            $this->output .= $this->getCategories(0);

            $manufacturers = $this->model_extension_feed_yandex_sitemap->getManufacturers();

            foreach ($manufacturers as $manufacturer) {
                $this->output .= '<url>' . $this->eol;
                $this->output .= '<loc>' . $this->url->link('product/manufacturer/info',
                        'manufacturer_id=' . $manufacturer['manufacturer_id'], true) . '</loc>' . $this->eol;
                $this->output .= '<changefreq>weekly</changefreq>' . $this->eol;
                $this->output .= '<priority>0.7</priority>' . $this->eol;
                $this->output .= '</url>' . $this->eol;

                $products = $this->getProducts(array('filter_manufacturer_id' => $manufacturer['manufacturer_id']));

                foreach ($products as $product) {
                    $this->output .= '<url>' . $this->eol;
                    $this->output .= '<loc>' . $this->url->link('product/product',
                            'manufacturer_id=' . $manufacturer['manufacturer_id'] . '&product_id=' . $product['product_id'], true) . '</loc>' . $this->eol;
                    $this->output .= '<changefreq>weekly</changefreq>' . $this->eol;
                    $this->output .= '</url>' . $this->eol;
                }
            }

            $informations = $this->model_extension_feed_yandex_sitemap->getInformations();

            foreach ($informations as $information) {
                $this->output .= '<url>' . $this->eol;
                $this->output .= '<loc>' . $this->url->link('information/information',
                        'information_id=' . $information['information_id'], true) . '</loc>' . $this->eol;
                $this->output .= '<changefreq>weekly</changefreq>' . $this->eol;
                $this->output .= '<priority>0.5</priority>' . $this->eol;
                $this->output .= '</url>' . $this->eol;
            }

            $this->output .= '</urlset>' . $this->eol;
            return true;
        }
        return false;
    }

    /**
     * получаем продукты для дальнейшей обработки
     */
    private function setProducts()
    {
        $this->products = $this->model_extension_feed_yandex_sitemap->getProducts();
    }

    /**
     * рекурсивно строит путь категорий
     * @param $parent_id - id родительской категории
     * @param string $current_path - текущий путь
     * @return string строка xml для категорий
     */
    protected function getCategories($parent_id, $current_path = '')
    {
        $output = '';

        $results = $this->model_extension_feed_yandex_sitemap->getCategories($parent_id);

        foreach ($results as $result) {
            if (!$current_path) {
                $new_path = $result['category_id'];
            } else {
                $new_path = $current_path . '_' . $result['category_id'];
            }

            $output .= '<url>' . $this->eol;
            $output .= '<loc>' . $this->url->link('product/category', 'path=' . $new_path, true) . '</loc>' . $this->eol;
            $output .= '<changefreq>weekly</changefreq>' . $this->eol;
            $output .= '<priority>0.7</priority>' . $this->eol;
            $output .= '</url>' . $this->eol;

            $products = $this->getProducts(array('filter_category_id' => $result['category_id']));

            foreach ($products as $product) {
                $output .= '<url>' . $this->eol;
                $output .= '<loc>' . $this->url->link('product/product',
                        'path=' . $new_path . '&product_id=' . $product['product_id'], true) . '</loc>' . $this->eol;
                $output .= '<changefreq>weekly</changefreq>' . $this->eol;
                $output .= '<priority>1.0</priority>' . $this->eol;
                $output .= '</url>' . $this->eol;
            }

            $output .= $this->getCategories($result['category_id'], $new_path);
        }

        return $output;
    }

    /**
     *
     * сортировка продуктов из сформированного массива $this->products
     * на момент вызова массив должен быть уже сформирован
     * @param array $filter_data - сортировка по id категории или производителей
     * @return array
     */
    private function getProducts($filter_data = array())
    {
        $products = array();
        if (isset($filter_data['filter_category_id']) && $filter_data['filter_category_id']) {
            foreach ($this->products as $product) {
                if ($product['category_id'] === $filter_data['filter_category_id']) {
                    $products[] = array(
                        'product_id' => $product['product_id'],
                        'date_modified' => $product['date_modified'],
                        'date_added' => $product['date_modified'],
                    );
                }
            }
        }
        if (isset($filter_data['filter_manufacturer_id']) && $filter_data['filter_manufacturer_id']) {
            foreach ($this->products as $product) {
                if ($product['manufacturer_id'] === $filter_data['filter_manufacturer_id']) {
                    $products[] = array(
                        'product_id' => $product['product_id'],
                        'date_modified' => $product['date_modified'],
                        'date_added' => $product['date_added'],
                    );
                }
            }
        }
        return $products;
    }

    /**
     * сохраняем в файл
     * @param $filename
     * @return bool
     */
    public function saveToFile($filename, $output = '')
    {
        $fp = fopen($filename, 'w+');
        fwrite($fp, $output);
        fclose($fp);
        return true;
    }

    /**
     * настраиваем вывод из файла
     * @param $filename - имя файла
     * @return bool
     */
    private function setOutputFromFile($filename)
    {
        $this->output = file_get_contents($filename);
        return true;
    }

    /**
     * отображаем то что надо в формате xml
     * @param $output
     */
    private function displayYml($output)
    {
        $this->response->addHeader('Content-Type: application/xml');
        $this->response->setOutput($output);
    }
}
