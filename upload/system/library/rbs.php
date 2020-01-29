<?php
/**
 * Интеграция платежного шлюза RBS с OpenCart
 */
class RBS {
    /** @var string $test       Адрес тестового шлюза */
    private $test_url = 'https://web.rbsuat.com/ab/rest/';

    /** @var string $prod_url   Адрес боевого шлюза*/
    private $prod_url = 'https://pay.alfabank.ru/payment/rest/';

    /** @var string $language   Версия страницы оплаты*/
    private $language = 'ru';

    private $defaultMeasurement = "шт";

    /** @var string $version    Версия плагина*/
    private $version = '2.6.0';

    /** @var string $login      Логин продавца*/
    private $login;

    /** @var string $password   Пароль продавца */
    private $password;

    /** @var string $mode       Режим работы модуля (test/prod) */
    private $mode;

    /** @var string $stage      Стадийность платежа (one/two) */
    private $stage;

    /** @var boolean $logging   Логгирование (1/0) */
    private $logging;

    /** @var string $currency   Числовой код валюты в ISO 4217 */
    private $currency;

    private $ofd_status;
    private $ffd_version;
    private $paymentMethodType;
    private $paymentObjectType;

    /** @var integer $taxSystem  Код системы налогообложения */
    public $taxSystem;
    public $taxType;

    public $discountHelper;

    public function __construct()
    {
        $this->library('rbs_discount');
        $this->discountHelper = new rbsDiscount();
    }

    /**
     * @return mixed
     */
    public function getFFDVersion()
    {
        return $this->ffd_version;
    }

    /**
     * @return mixed
     */
    public function getPaymentMethodType()
    {
        return $this->paymentMethodType;
    }

    /**
     * @return mixed
     */
    public function getPaymentObjectType()
    {
        return $this->paymentObjectType;
    }

    /**
     * @return string
     */
    public function getDefaultMeasurement()
    {
        return $this->defaultMeasurement;
    }


    /**
     * Магический метод, который заполняет инстанс
     *
     * @param $property
     * @param $value
     * @return $this
     */
    public function __set($property, $value) {
        if (property_exists($this, $property)) {
            $this->$property = $value;
        }
        return $this;
    }

    /**
     * Формирование запроса в платежный шлюз и парсинг JSON-ответа
     *
     * @param string $method Метод запроса в ПШ
     * @param mixed[] $data Данные в запросе
     * @return mixed[]
     */
    private function gateway($method, $data) {

        // Добавления логина и пароля продавца к каждому запросу
        $data['userName'] = $this->login;
        $data['password'] = $this->password;
        $data['language'] = $this->language;

        // Выбор адреса ПШ в зависимости от выбранного режима
        if ($this->mode == 'test') {
            $url = $this->test_url;
        } else {
            $url = $this->prod_url;
        }

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => $url.$method,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,
            CURLOPT_SSL_VERIFYHOST => false,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_POSTFIELDS => http_build_query($data, '', '&'),
            CURLOPT_HTTPHEADER => array('CMS: OpenCart 2.3.x', 'Module-Version: ' . $this->version),
        ));

        $response = curl_exec($curl);

        if ($this->logging) {
            $this->logger($url, $method, $data, $response);
        }
        $response = json_decode($response, true);
        curl_close($curl);

        return $response;
    }

    /**
     * Логирование запроса и ответа от ПШ
     *
     * @param string $url
     * @param string $method
     * @param mixed[] $request
     * @param mixed[] $response
     * @return integer
     */
    private function logger($url, $method, $request, $response) {
        $this->library('log');
        $logger = new Log('rbs_payment.log');
        $logger->write("RBS PAYMENT: ".$url.$method."\nREQUEST: ".json_encode($request). "\nRESPONSE: ".$response."\n\n");
    }

    /**
     * Регистрация заказа в ПШ
     *
     * @param string $order_number Номер заказа в магазине
     * @param integer $amount Сумма заказа
     * @param string $return_url Страница в магазине, на которую необходимо вернуть пользователя
     * @param null $orderBundle
     * @return mixed[] Ответ ПШ
     */
    public function register_order($order_number, $amount, $return_url, $orderBundle = null) {

        $data = array(
            'orderNumber' => $order_number . "_". time(),
            'amount' => $amount,
            'returnUrl' => $return_url,
            'jsonParams' => json_encode(
                [
                    'CMS:' => 'Opencart 2.3.x',
                    'Module-Version: ' =>  $this->version
                ]
            ),
        );
        if ($this->currency != 0) {
            $data['currency'] = $this->currency;
        }

        if ($this->ofd_status && !empty($orderBundle)) {
            $data['taxSystem'] = $this->taxSystem;

            $data['orderBundle']['orderCreationDate'] = date('c');
            $data['orderBundle'] = json_encode($orderBundle);
        }


        return $this->gateway($this->stage == 'two' ? 'registerPreAuth.do' : 'register.do', $data);
    }

    /**
     * Статус заказа в ПШ
     *
     * @param string $orderId Идентификатор заказа в ПШ
     * @return mixed[] Ответ ПШ
     */
    public function get_order_status($orderId) {
        return $this->gateway('getOrderStatusExtended.do', array('orderId' => $orderId));
    }

    /**
     * В версии 2.1 нет метода Loader::library()
     * Своя реализация
     * @param $library
     */
    private function library($library) {
        $file = DIR_SYSTEM . 'library/' . str_replace('../', '', (string)$library) . '.php';

        if (file_exists($file)) {
            include_once($file);
        } else {
            trigger_error('Error: Could not load library ' . $file . '!');
            exit();
        }
    }
}