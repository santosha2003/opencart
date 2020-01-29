<?php

class ControllerExtensionPaymentRbs extends Controller
{
    private $error = array();

    /**
     * Вывод и сохранение настроек
     */
    public function index()
    {
        $this->load->language('extension/payment/rbs');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');

        // Сохранение настроек через POST запрос
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('rbs', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', 'SSL'));
        }

        // Заголовок страницы
        $data['heading_title'] = $this->language->get('heading_title');

        // Хлебные крошки
        $data['breadcrumbs'] = array();
        array_push($data['breadcrumbs'],
            array(  // Главная
                'text' => $this->language->get('text_home'),
                'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
            ),
            array(  // Оплата
                'text' => $this->language->get('text_payment'),
                'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
            ),
            array(  // Оплата через {{банк}}
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('extension/payment/rbs', 'token=' . $this->session->data['token'], 'SSL')
            )
        );

        // Кнопки сохранения и отмены
        $data['action'] = $this->url->link('extension/payment/rbs', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL');

        // Кнопки
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        // Заголовок панели
        $data['text_settings'] = $this->language->get('text_settings');

        // Статус модуля: Включен/Выключен
        $data['entry_status'] = $this->language->get('status');
        $data['status_enabled'] = $this->language->get('status_enabled');
        $data['status_disabled'] = $this->language->get('status_disabled');
        $data['rbs_status'] = $data['rbs_status'] = $this->config->get('rbs_status');

        // Логин мерчанта
        $data['entry_merchantLogin'] = $this->language->get('merchantLogin');
        $data['rbs_merchantLogin'] = $this->config->get('rbs_merchantLogin');

        // Логин мерчанта
        $data['entry_merchantPassword'] = $this->language->get('merchantPassword');
        $data['rbs_merchantPassword'] = $this->config->get('rbs_merchantPassword');

        // Режим работы модуля: Тестовый/Боевой
        $data['entry_mode'] = $this->language->get('mode');
        $data['mode_test'] = $this->language->get('mode_test');
        $data['mode_prod'] = $this->language->get('mode_prod');
        $data['rbs_mode'] = $this->config->get('rbs_mode');

        // Стадийность платежа
        $data['entry_stage'] = $this->language->get('stage');
        $data['stage_one'] = $this->language->get('stage_one');
        $data['stage_two'] = $this->language->get('stage_two');
        $data['rbs_stage'] = $this->config->get('rbs_stage');

        // Статус по завершении платежа
        $data['entry_order_status'] = $this->language->get('entry_order_status');

        if (isset($this->request->post['rbs_order_status_id'])) {
            $data['rbs_order_status_id'] = $this->request->post['rbs_order_status_id'];
        } else {
            $data['rbs_order_status_id'] = $this->config->get('rbs_order_status_id');
        }

        $this->load->model('localisation/order_status');

        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();


        // Логирование
        $data['entry_logging'] = $this->language->get('logging');
        $data['logging_enabled'] = $this->language->get('logging_enabled');
        $data['logging_disabled'] = $this->language->get('logging_disabled');
        $data['rbs_logging'] = $this->config->get('rbs_logging');

        // Валюта
        $data['entry_currency'] = $this->language->get('currency');
        $data['currency_list'] = array_merge(
            array(
                array(
                    'numeric' => 0,
                    'alphabetic' => 'По умолчанию'
                )
            ), // Валюта по умолчанию в платежном шлюзе
            $this->getCurrencyList()  // Список валют
        );
        $data['rbs_currency'] = $this->config->get('rbs_currency');


        // Передача корзины: Включена/Выключена
        $data['entry_ofdStatus'] = $this->language->get('entry_ofdStatus');
        $data['rbs_ofd_status'] = $this->config->get('rbs_ofd_status');
        $data['ofd_enabled'] = $this->language->get('ofd_enabled');
        $data['ofd_disabled'] = $this->language->get('ofd_disabled');

        // Системы налогообложения
        $data['entry_taxSystem'] = $this->language->get('entry_taxSystem');
        $data['taxSystem_list'] = $this->getTaxSystemList();
        $data['rbs_taxSystem'] = $this->config->get('rbs_taxSystem');

        // Ставка НДС по умолчанию
        $data['entry_taxType'] = $this->language->get('entry_taxType');
        $data['taxType_list'] = $this->getTaxTypeList();
        $data['rbs_taxType'] = $this->config->get('rbs_taxType');


        //FFD version
        $data['entry_ffdVersionFormat'] = $this->language->get('entry_ffdVersionFormat');
        $data['ffd_versionList'] = $this->getFFDVersionlist();
        $data['rbs_ffdVersion'] = $this->config->get('rbs_ffdVersion');

        //FFD method
        $data['entry_paymentMethod'] = $this->language->get('entry_paymentMethod');
        $data['ffd_paymentMethodTypeList'] = $this->getPaymentMethodTypeList();
        $data['rbs_paymentMethodType'] = $this->config->get('rbs_paymentMethodType');

        //FFD object
        $data['entry_paymentObject'] = $this->language->get('entry_paymentObject');
        $data['ffd_paymentObjectTypeList'] = $this->getPaymentObjectTypeList();
        $data['rbs_paymentObjectType'] = $this->config->get('rbs_paymentObjectType');


        // Хедер, футер, левое меню для отрисовки страницы настроек модуля
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        // Рендеринг шаблона
        $this->response->setOutput($this->load->view('extension/payment/rbs', $data));
    }

    /**
     * Валидация данных.
     * В данном случае проверка прав на редактирование настроек платежного модуля.
     * @return bool
     */
    private function validate()
    {
        if (!$this->user->hasPermission('modify', 'extension/payment/rbs')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        return !$this->error;
    }

    /**
     * Список валют в ISO 4217
     * @return array
     */
    private function getCurrencyList()
    {
        return [
            [
                'numeric' => 643,
                'alphabetic' => 'RUR'
            ],
            [
                'numeric' => 810,
                'alphabetic' => 'RUB'
            ],
            [
                'numeric' => 840,
                'alphabetic' => 'USD'
            ],
            [
                'numeric' => 933,
                'alphabetic' => 'BYN'
            ],
            [
                'numeric' => 978,
                'alphabetic' => 'EUR'
            ],
        ];
    }


    /**
     * Список Ситем налогообложения
     * @return array
     */
    private function getTaxTypeList()
    {
        return [
            [
                'numeric' => 0,
                'alphabetic' => 'Без НДС'
            ],
            [
                'numeric' => 1,
                'alphabetic' => 'НДС по ставке 0%'
            ],
            [
                'numeric' => 2,
                'alphabetic' => 'НДС чека по ставке 10%'
            ],
            [
                'numeric' => 3,
                'alphabetic' => 'НДС чека по ставке 18%'
            ],
            [
                'numeric' => 4,
                'alphabetic' => 'НДС чека по расчетной ставке 10/110'
            ],
            [
                'numeric' => 5,
                'alphabetic' => 'НДС чека по расчетной ставке 10/118'
            ],

            [
                'numeric' => 6,
                'alphabetic' => 'НДС чека по расчетной ставке 20%'
            ],
            [
                'numeric' => 7,
                'alphabetic' => 'НДС чека по расчетной ставке 20/120'
            ],
        ];
    }


    /**
     * Список Ситем налогообложения
     * @return array
     */
    private function getTaxSystemList()
    {
        return [
            [
                'numeric' => 0,
                'alphabetic' => 'Общая'
            ],
            [
                'numeric' => 1,
                'alphabetic' => 'Упрощенная, доход'
            ],
            [
                'numeric' => 2,
                'alphabetic' => 'Упрощенная, доход минус расход'
            ],
            [
                'numeric' => 3,
                'alphabetic' => 'Eдиный налог на вменённый доход'
            ],
            [
                'numeric' => 4,
                'alphabetic' => 'Единый сельскохозяйственный налог'
            ],
            [
                'numeric' => 5,
                'alphabetic' => 'Патентная система налогообложения'
            ],
        ];
    }

    /**
     * Формат фискальных документов
     * @return array
     */
    private function getFFDVersionlist()
    {
        return [
            [
                'value' => 'v10',
                'title' => '1.00'
            ],
            [
                'value' => 'v105',
                'title' => '1.05'
            ],
//            [
//                'value' => 'v11,
//                'title' => '1.1'
//            ],
        ];
    }

    /**
     * Список типов платежей
     * @return array
     */
    private function getPaymentMethodTypeList()
    {
        return [
            [
                'numeric' => 1,
                'alphabetic' => 'Полная предварительная оплата до момента передачи предмета расчёта'
            ],
            [
                'numeric' => 2,
                'alphabetic' => 'Частичная предварительная оплата до момента передачи предмета расчёта'
            ],
            [
                'numeric' => 3,
                'alphabetic' => 'Аванс'
            ],
            [
                'numeric' => 4,
                'alphabetic' => 'Полная оплата в момент передачи предмета расчёта'
            ],
            [
                'numeric' => 5,
                'alphabetic' => 'Частичная оплата предмета расчёта в момент его передачи с последующей оплатой в кредит'
            ],
            [
                'numeric' => 6,
                'alphabetic' => 'Передача предмета расчёта без его оплаты в момент его передачи с последующей оплатой в кредит'
            ],
            [
                'numeric' => 7,
                'alphabetic' => 'Оплата предмета расчёта после его передачи с оплатой в кредит'
            ],

        ];
    }

    /**
     * Список типов оплачиваемой позиции
     * @return array
     */
    private function getPaymentObjectTypeList()
    {
        return [
            [
                'numeric' => 1,
                'alphabetic' => 'Товар'
            ],
            [
                'numeric' => 2,
                'alphabetic' => 'Подакцизный товар'
            ],
            [
                'numeric' => 3,
                'alphabetic' => 'Работа'
            ],
            [
                'numeric' => 4,
                'alphabetic' => 'Услуга'
            ],
            [
                'numeric' => 5,
                'alphabetic' => 'Ставка азартной игры'
            ],
//            [
//                'numeric' => 6,
//                'alphabetic' => 'Выигрыш азартной игры'
//            ],
            [
                'numeric' => 7,
                'alphabetic' => 'Лотерейный билет'
            ],
//            [
//                'numeric' => 8,
//                'alphabetic' => 'Выигрыш лотереи'
//            ],
            [
                'numeric' => 9,
                'alphabetic' => 'Предоставление РИД'
            ],
            [
                'numeric' => 10,
                'alphabetic' => 'Платёж'
            ],
//            [
//                'numeric' => 11,
//                'alphabetic' => 'Агентское вознаграждение'
//            ],
            [
                'numeric' => 12,
                'alphabetic' => 'Составной предмет расчёта'
            ],
            [
                'numeric' => 13,
                'alphabetic' => 'Иной предмет расчёта'
            ],
        ];
    }

}