<?php

    /*
     *  location: admin/language
     */

//heading
    $_['heading_title'] = 'Simple One Page Checkout';
    $_['heading_title_main'] = 'Simple One Page Checkout';
    $_['text_edit'] = 'Редактирование Simple One Page Checkout';
    $_['text_module'] = 'Модули';
//entry
    $_['entry_status'] = 'Статус';
    $_['entry_config_files'] = 'Файл конфигурации';

//button
    $_['button_save_and_stay'] = 'Сохранить и остаться';

//success
    $_['success_modifed'] = 'Успешно: Вы отредактировали модуль!';

//error
    $_['error_permission'] = 'Внимание: У вас нет прав на управление модулем!';
    $_['error_select'] = 'Выбор обязателен!';
    $_['error_text'] = 'Заполните поле!';

//setting
    $_['tab_setting'] = 'Настройки';

//update
    $_['shopunity_download'] = '';
    $_['entry_update'] = 'Версия %s';
    $_['button_update'] = 'Проверить обновления';
    $_['compress_update'] = 'Обновить';
    $_['success_no_update'] = 'У вас последняя версия.';
    $_['warning_new_update'] = 'Новая версия доступна для скачивания.';
    $_['error_update'] = 'Ошибка.';
    $_['error_failed'] = 'Не возможно подключиться к серверу.';

//debug
    $_['tab_debug'] = 'Отладка';
    $_['entry_debug'] = 'Отладка';
    $_['entry_debug_file'] = 'Файл отладки';
    $_['success_clear_debug_file'] = 'Debug file cleared successfuly.';

//support
    $_['tab_support'] = 'Поддержка';
    $_['text_support'] = 'Поддержка';
    $_['entry_support'] = 'Поддержка';
    $_['button_support_email'] = 'Email';

// Heading
    $_['text_enable'] = 'Включить';
    $_['text_guest'] = 'Гость';
    $_['text_register'] = 'Регистрация';
    $_['text_login'] = 'Вход';
    $_['text_logged'] = 'Авторизован';
    $_['text_title'] = 'Заголовок';
    $_['text_description'] = 'Описание';
    $_['help_title'] = 'Заголовок шага';
    $_['help_description'] = 'Любое описание к этому шагу';
    $_['text_icon'] = 'Иконка';
    $_['help_icon'] = 'Класс иконки (библиотека FA)';
    $_['text_yes'] = 'Да';
    $_['text_no'] = 'Нет';
    $_['text_display'] = 'Вкл.';
    $_['text_always_show'] = 'Всегда показывать';
    $_['text_require'] = 'Обяз.';
    $_['text_defualt'] = 'Значение или маска';
    $_['text_input_radio'] = 'Радио кнопка';
    $_['text_input_select'] = 'Выбор (Select)';
    $_['text_input_list'] = 'Список (Checkbox)';
    $_['text_row'] = 'Строка';
    $_['text_block'] = 'Блок';
    $_['text_popup'] = 'Popup';
    $_['text_width'] = 'Ширина:';
    $_['text_height'] = 'Высота:';
    $_['text_type'] = 'Тип поля:';
    $_['entry_new_field'] = 'Добавить свое поле:';
    $_['text_custom_field'] = 'Редактировать свое поле';
    $_['help_new_field'] = 'You can add a custom field in the system, and this field will be show up here. You can then select where the field should be shown and/or required.';
    $_['button_new_field'] = 'Создать поле';
    $_['help_maskedinput'] = 'You can add a mask pattern to a input field. a - Represents an alpha character (A-Z,a-z), 9 - Represents a numeric character (0-9), * - Represents an alphanumeric character (A-Z,a-z,0-9). Example: tel (999) 999-9999?9999, date 99/99/9999.';
    $_['text_probability'] = 'Приоритет';
    $_['help_view_shop'] = 'View checkout in shop';
    $_['help_view_setting'] = 'Редактирование формы заказа';
    $_['text_create_setting'] = 'Новая форма';
    $_['text_create_setting_heading'] = 'Создать форму';
    $_['text_create_setting_probability'] = ' ';
    $_['text_intro_create_setting'] = '<h4>Simple One Page Checkout.</h4>Вы только что установили новую версию модуля Simple One Page Checkout. Для начала вам нужно будет создать и настроить оформление заказа. Нажмите "Создать модуль" и настройте внешний вид. Затем установите Статус в положение "Да" и нажмите "Сохранить".';

    $_['text_home'] = 'Главная';
    $_['text_intro_home'] = 'Настройте вашу страницу оформления заказа';

    $_['text_intro_general'] = 'Set up the general settings of your Ajax Quick Checkout (SOPC). You can also define positions as a module.';
    $_['text_intro_login'] = 'Add settings for google, facebook, linked, twitter, paypal, tumblr, VK and more login options.';
    $_['text_intro_payment_address'] = 'Display and hide, then sort the fields you want to have in your checkout. If you don\'t need this step - simply hide it.';
    $_['text_intro_shipping_address'] = 'Like with payment address, you can display/hide and sort the fields. Sorting is easy - simply drag and drop.';
    $_['text_intro_shipping_method'] = 'Set a default value, show/hide the step and select the style of the options - radio or select.';
    $_['text_intro_payment_method'] = 'Like shipping method, you can define the default option, show or hide the step and set the style of the options.';
    $_['text_intro_confirm'] = 'Style your cart - define the columns of the cart as well as the coupon, voucher and reward.';
    $_['text_intro_design'] = 'Set the number of columns in the checkout: there width and the position of steps in it. Use drag-and-drop to do it.';
    $_['text_intro_analytics'] = 'Get insites on how your customers use your checkout and make the best out of it.';
    $_['text_intro_plugins'] = 'Add more plugins to the checkout to increase its functionality. Extra fields, analytics and more.';
    $_['entry_trigger'] = 'Идентификация кнопки';
    $_['help_trigger'] = 'Opencart has many paypment methods and every payment method has a PAY button. There are no standards for this button and some developers add different types of buttons: divs, input buttons, a etc with different classes. Over time we have come to this pattern,  But in some rare cases you may need to add another trigger to this field for the SOPC to see the paybutton. it can be a class or an id of the tag. List them here separating by comma , ex. #confirm_payment .button, #confirm_payment .btn, #confirm_payment .button_oc, #confirm_payment input[type=submit]';
    $_['help_average_time'] = 'Average time of the last 50 orders';
    $_['help_average_rating'] = 'Average rating of the last 50 orders';

    $_['text_general'] = 'Настройки';
    $_['text_payment_address'] = 'Адрес плательщика';
    $_['text_shipping_address'] = 'Адрес доставки';
    $_['text_shipping_method'] = 'Способ доставки';
    $_['text_payment_method'] = 'Способ оплаты';
    $_['text_confirm'] = 'Подтвердить';
    $_['text_design'] = 'Дизайн';
    $_['text_cart'] = 'Корзина';
    $_['text_payment'] = 'Информация о платеже';
    $_['text_analytics'] = 'Аналитика';
    $_['text_plugins'] = 'Плагины';

//general
    $_['entry_name'] = 'Название:';
    $_['help_name'] = 'Set a name for your checkout setting.';
    $_['entry_general_default_option'] = 'Заказ по умолчанию как:';
    $_['help_general_default_option'] = 'Set the default option for the visitor - it can be guest checkout or registration. Please remeber that if you select guest, but you have downloadable items or items that require a registration - the checkout will still show registrated, so that we do not break any of the opencart defualt functions.';
    $_['entry_general_main_checkout'] = 'Replace the main checkout:';
    $_['help_general_main_checkout'] = 'Replace the main checkout with the SOPC';
    $_['entry_general_clear_session'] = 'Clear checkout session after page refresh:';
    $_['help_general_clear_session'] = 'When enabled, after the checkout page is refreshed - the personal data will be cleared.';
    $_['entry_general_login_refresh'] = 'Refresh page after login is successful:';
    $_['help_general_login_refresh'] = 'When you login, the system will refresh the page compleatly to update the values in the header.';
    $_['entry_general_default_email'] = 'Set default email:';
    $_['help_general_default_email'] = 'If you remove the email field from the registration, you need to specify an email which will receive the client\'s order information. Otherwise you will also not receive orders as a store administrator';
    $_['entry_general_min_order'] = 'Мин.сумма заказа:';
    $_['help_general_min_order'] = 'Set the minimum order value to allow checkout';
    $_['text_value_min_order'] = 'Минимальная сумма заказа: %s';
    $_['entry_general_min_quantity'] = 'Мин.кол-во товаров:';
    $_['help_general_min_quantity'] = 'Set the minimum order quantity to allow checkout';
    $_['text_value_min_quantity'] = 'Минимальное количество товара для оформления заказа: %s';
    $_['entry_delete_setting'] = 'Удалить настройки модуля';
    $_['button_delete_setting'] = 'Удалить настроки';
    $_['text_confirm_delete_setting'] = 'Are you sure you want to delete this setting? All the Statistic for this setting will also be deleted permanently';
    $_['entry_bulk_setting'] = 'Использовать настройки:';
    $_['help_bulk_setting'] = 'You can copy, modify and paste this JSON string as settings. CLick Save bulk setting to update the current setting. You can also save it to a text file for furture use of move it to another shop.';
    $_['entry_action_bulk_setting'] = 'Использовать настройк:';
    $_['help_action_bulk_setting'] = 'Lets you generate the currant setting as WYSIWYG and then Save it or modify it.';
    $_['button_create_bulk_setting'] = 'Сгенерировать настройки';
    $_['button_save_bulk_setting'] = 'Сохранить настройки';
    $_['entry_general_analytics_event'] = 'Аналитика Google Events';
    $_['help_general_analytics_event'] = 'You can turn on events, part of google analytics. for this you must set up your google analytics account. Refer to instructions tab for more information.';
    $_['warning_analytics_event'] = 'Please enable Google Analitics.';
    $_['entry_general_compress'] = 'Сжимать файлы';
    $_['help_general_compress'] = 'This option alows you to compress all backbone vew and model js files into one min js file. This can solve some parallel lowing issues on some webservers and increase the speed of the first load';
    $_['success_compress_file'] = 'Compress file update successfuly.';
    $_['entry_general_update_mini_cart'] = 'Обновлять корзину в шапке';
    $_['help_general_update_mini_cart'] = 'Use this option if you want the header minicart to update when you edit the checkout cart. Warning! Some themes will have a different design and this option will not wrok properly.';
//modules
    $_['text_position_module'] = 'Position modules:';
    $_['help_position_module'] = 'If you want the SOPC to show up in other locations, then you can use this option. If you just want to replace the main checkout - then do not use this option and use the optiob "Replace main checkout"';
    $_['button_add_module'] = 'Add module';

    $_['entry_general_settings'] = 'Bulk settings:';
    $_['text_general_settings_value'] = 'Use bulk settings';
    $_['help_general_settings'] = 'Copy and save to a file the settings or use the saved settings and set the checkout to them by coping them into the textarea';


//social login
    $_['text_social_login_required'] = '';
    $_['entry_socila_login_style'] = 'Select Social login style';
    $_['help_socila_login_style'] = 'Social login for SOPC uses its own settigns so that you can set different sizes of login buttons for different locations on your shop. The rest of the settings is pulled from the social login module.';
    $_['entry_social_login'] = 'Display Social login';
    $_['help_social_login'] = 'You can display social login on the login step in the checkout. Be sure to set the social networks before you use this option.';
    $_['text_icons'] = 'Icons';
    $_['text_small'] = 'Small';
    $_['text_medium'] = 'Medium';
    $_['text_large'] = 'Large';
    $_['text_huge'] = 'Huge';
    $_['button_social_login_edit'] = 'Edit Social login Settings';

//payment_address
    $_['title_payment_address'] = 'Адрес плательщика';
    $_['description_payment_address'] = '';
    $_['entry_payment_address_display'] = 'Показывать этот шаг:';
    $_['help_payment_address_display'] = 'If you disable payment address - the payment address step will not show. Be sure no not have any required input fields in the payment address list.';

//shipping_address
    $_['title_shipping_address'] = 'Адрес доставки';
    $_['description_shipping_address'] = '';
    $_['entry_shipping_address_display'] = 'Показывать этот шаг:';
    $_['help_shipping_address_display'] = 'If you disable shipping address - the shipping address step will not show. But the option in the payment address block will still be visible. You will need to turn it off so that it doesn\'t show as well. You can require the shipping address - this will make the option always show no matter what the checkbox value is. This is made to force the customer input his shipping address.';

//shipping_method
    $_['title_shipping_method'] = 'Способ доставки';
    $_['description_shipping_method'] = 'Выберите подходящий способ доставки';
    $_['entry_shipping_method_display'] = 'Включить блок выбора способа доставки';
    $_['entry_shipping_method_display_options'] = 'Показывать способы доставки';
    $_['entry_shipping_method_display_title'] = 'Показывать заголовки групп';
    $_['entry_shipping_method_input_style'] = 'Стиль';
    $_['entry_shipping_method_default_option'] = 'Способ по умолчанию';
    $_['help_shipping_method_display'] = 'You can display the shipping step or hide it. you must still have at least one shipping method that will be selected by default';
    $_['help_shipping_method_display_options'] = 'You can display just the shipping methods or hide them. If you have plugins for the shipping method step, this will allow you to show the plugins but hide the shipping method options';
    $_['help_shipping_method_display_title'] = 'You can hide the title of the groups for the shipping methods and just keep their names';
    $_['help_shipping_method_input_style'] = 'Choose the style for displaying the shipping methods: select or radio';
    $_['help_shipping_method_default_option'] = 'This shipping method option will be selected by default for every new visitor. If the visitor is not new, it will use the saved values from the earlier select options. If this shipping method is not available for the current geo zone, the first shipping method will be selected.';


//payment_method
    $_['title_payment_method'] = 'Способ оплаты';
    $_['description_payment_method'] = 'Выберите способ оплаты заказа.';
    $_['entry_payment_method_display'] = 'Включить блок выбора способа оплаты';
    $_['entry_payment_method_display_options'] = 'Показывать способы оплаты';
    $_['entry_payment_method_display_images'] = 'Показывать иконки';
    $_['entry_payment_method_input_style'] = 'Стиль';
    $_['entry_payment_method_default_option'] = 'Способ по умолчанию';
    $_['entry_payment_method_input_style'] = 'Стиль';
    $_['help_payment_method_display'] = 'You can display the payment step or hide it. you must still have at least one payment method that will be selected by default';
    $_['help_payment_method_display_options'] = 'You can display just the payment methods or hide them. If you have plugins for the payment method step, this will allow you to show the plugins but hide the payment method options';
    $_['help_payment_method_display_images'] = 'You can display the payment images for the radio style of payment methods. If you have selected the select style - the images will not show.';
    $_['help_payment_method_input_style'] = 'Choose the style for displaying the payment methods: select or radio';
    $_['help_payment_method_default_option'] = 'This payment method option will be selected by default for every new visitor. If the visitor is not new, it will use the saved values from the earlier select options. If this payment method is not available for the current geo zone, the first payment method will be selected.';
    $_['entry_payment_default_payment_popup'] = 'Способы оплаты в popup-окне';
    $_['help_payment_default_payment_popup'] = 'Here you can set the default value of the popup, which will be used in case you have not specified a specific value to each payment method below.';
    $_['callout_payment_payment_popup'] = '<h3>Выбор способа оплаты в popup-окне</h3>';


//cart
    $_['title_shopping_cart'] = 'Корзина';
    $_['description_shopping_сart'] = '';
    $_['entry_cart_display'] = 'Показать корзину';
    $_['entry_cart_columns_image'] = 'Показать изображение';
    $_['entry_cart_columns_name'] = 'Показать название товара';
    $_['entry_cart_columns_model'] = 'Показать модель';
    $_['entry_cart_columns_quantity'] = 'Показать количество';
    $_['entry_cart_columns_price'] = 'Показать цену';
    $_['entry_cart_columns_total'] = 'Показать сумму';
    $_['entry_cart_option_coupon'] = 'Показать поле купона';
    $_['entry_cart_option_voucher'] = 'Показать поле сертификата';
    $_['entry_cart_option_reward'] = 'Показать поле бонусов';
    $_['entry_confirm_display'] = 'Показывать подтверждение';
    $_['help_cart_display'] = 'By hiding the cart, you are hiding the cart and the options in it. the confirm button stays to still complete the order.';
    $_['help_cart_option_coupon'] = 'Show or hide the coupon option. Remember, if the coupon option is disabled  in the checkout totals - it will not show up in the SOPC as well. You must turn it on and then select which option gets to display it.';
    $_['help_cart_option_voucher'] = 'Show or hide the voucher option. Remember, if the voucher option is disabled  in the checkout totals - it will not show up in the SOPC as well. You must turn it on and then select which option gets to display it.';
    $_['help_cart_option_reward'] = 'Show or hide the reward option. Remeber, if the reward option is disabled  in the checkout totals - it will not show up in the SOPC as well. Also rewards are for logged in customers. You must turn it on and then select which option gets to display it.';


//design
    $_['entry_design_theme'] = 'Шаблон';
    $_['entry_design_field'] = 'Стиль селектов';
    $_['entry_design_placeholder'] = 'Плейсхолдеры';
    $_['entry_design_breadcrumb'] = 'Показывать хлебные крошки';
    $_['help_design_breadcrumb'] = 'You can turn on or off breadcrums on checkout page';
    $_['entry_design_login_option'] = 'Варианты авторизации';
    $_['entry_design_login'] = 'Дизайн блока авторизации';
    $_['entry_design_address'] = 'Выбор адреса как';
    $_['entry_design_cart_image_size'] = 'Размеры изображения';
    $_['entry_design_max_width'] = 'Max width of the checkout';
    $_['entry_design_bootstrap'] = 'Force Bootstrap';
    $_['entry_design_only_d_quickcheckout'] = 'Показывать только форму оформления заказа';
    $_['entry_design_column'] = 'Настройка колонок';
    $_['entry_design_custom_style'] = 'Пользовательский CSS';
    $_['entry_design_autocomplete'] = 'Автозаполнение';

    $_['help_login'] = 'Login block where a customer can login or select a checkout option.';
    $_['help_payment_address'] = 'Customer information and payment address.';
    $_['help_shipping_address'] = 'Extra address for shipping purposes.';
    $_['help_shipping_method'] = 'Third step. You can set a default method and hide this step.';
    $_['help_payment_method'] = 'Fourth step. You can set a default method and hide this step.';
    $_['help_cart'] = 'Part of the last step - the cart. You can move to the top as well.';
    $_['help_payment'] = 'Some payment methods have more options to fill - like paypal pro.';
    $_['help_confirm'] = 'The last step is the confirm. Edit fields.';


    $_['help_design_theme'] = 'Select a style for the frontend of SOPC. You can install other designs or create your own.';
    $_['help_design_field'] = 'Set the style of the fields in payment and shipping address blocks. Row style - the labels will be on one line with the input. Block style - the labels will be above the inputs.';
    $_['help_design_placeholder'] = 'Show or hide placeholder text in the fileds for payment and shipping addresses and on confirm step.';
    $_['help_design_login_option'] = 'Show or hide the options that are at the beggining of the checkout';
    $_['help_design_login'] = 'Select the style of the login block. you can select to show the block or use a popup for login, while the option for registration or guest checkout is a simple checkbox.';
    $_['help_design_address'] = 'Select the style of the address block for logged in users. you can select to show address as a list or as radio button options.';
    $_['help_design_cart_image_size'] = 'Set the width and height of the product pop up image when you hover on the smal product thumb image in the cart.';
    $_['help_design_max_width'] = 'If you see the checkout fill the whole screen, set the max width of the checkout and it will fit nicly in the middle. i.e. 960';
    $_['help_design_bootstrap'] = 'If you are experiancing style issues, you may whant to try this option. It will force a default bootstrap only for the ajax quickcheckout';
    $_['help_design_only_d_quickcheckout'] = 'Enable this option to hide all the information in header, footer and columns to make the checkout process as simple and clean as possible.';
    $_['help_design_column'] = 'Set the number of columns. You can set up to 3 columns and there widths.';
    $_['help_design_custom_style'] = 'Add custom styles to the checkout. Follow the right CSS standards.';
    $_['help_design_autocomplete'] = 'Turn on/off browser autocomplete option.';

// Entry
    $_['text_your_address'] = 'Ваш адрес';
    $_['entry_email_address'] = 'E-Mail:';
    $_['entry_email'] = 'E-Mail:';
    $_['entry_email_confirm'] = 'Подтвердить E-mail';
    $_['entry_password'] = 'Пароль:';
    $_['entry_confirm'] = 'Подтвердить пароль:';
    $_['entry_firstname'] = 'Имя:';
    $_['entry_lastname'] = 'Фамилия:';
    $_['entry_telephone'] = 'Телефон:';
    $_['entry_fax'] = 'Факс:';
    $_['entry_company'] = 'Компания:';
    $_['entry_customer_group'] = 'Группа:';
    $_['entry_company_id'] = 'Company ID:';
    $_['entry_tax_id'] = 'Tax ID:';
    $_['entry_address_1'] = 'Адрес:';
    $_['entry_address_2'] = 'Адрес 2:';
    $_['entry_postcode'] = 'Индекс:';
    $_['entry_city'] = 'Город:';
    $_['entry_country'] = 'Страна:';
    $_['entry_zone'] = 'Регион:';
    $_['entry_newsletter'] = 'Подписка на новости';
    $_['entry_shipping'] = 'Адрес плательщика и доставки один и тот же';
    $_['text_agree'] = 'Я принимаю условия заказа';
    $_['text_comments'] = 'Оставить комментарий к заказу';


// Entry
    $_['entry_layout'] = 'Макет:';
    $_['entry_position'] = 'Позиция:';
    $_['entry_status'] = 'Статус:';
    $_['entry_sort_order'] = 'Порядок:';


    $_['settings_select'] = 'Выпадающий список';
    $_['settings_image'] = 'Показать картинки';

//Supporting
    $_['text_no_update'] = 'Super! You have the latest version.';
    $_['text_new_update'] = 'Wow! There is a new version avalible for download.';
    $_['text_error_update'] = 'Sorry! Something went wrong. If this repeats, contact the support please.';
    $_['text_error_failed'] = 'Oops! We could not connect to the server. Please try again later.';
    $_['error_shopunity_required'] = 'Don\'t worry, to make your module look great, please install Shopunity Admin them. You can download it from <a href="http://www.opencart.com/index.php?route=extension/extension/info&extension_id=14928">here</a>';
    $_['error_permission'] = 'Warning: You do not have permission to modify module welcome!';
    $_['success_setting_created'] = 'You have successfully created a setting';
    $_['success_setting_deleted'] = 'You have successfully deleted a setting';
    $_['success_setting_saved'] = 'You have successfully saved bulk settings';
    $_['error_setting_not_created'] = 'Oops! Setting not created. Please try again.';
    $_['error_setting_not_deleted'] = 'Oops! Setting not deleted. Please try again.';
    $_['error_setting_not_saved'] = 'Oops! Bulk setting not saved. Please try again. ';
    $_['column_order_id'] = '# ID заказа';
    $_['column_customer'] = 'Клиент';
    $_['column_account'] = 'Аккаунт';
    $_['column_total'] = 'Сумма';
    $_['column_status'] = 'Статус';
    $_['column_shipping_method'] = 'Доставка';
    $_['column_payment_method'] = 'Оплата';
    $_['column_data'] = 'Данные';
    $_['column_checkout_time'] = 'Время';
    $_['column_rating'] = 'Рейтинг';

    $_['text_not_found'] = '<div class="jumbotron">
          <h1>Please install Shopunity</h1>
          <p>Before you can use this module you will need to install Shopunity. Simply download the archive for your version of opencart and install it view Extension Installer or unzip the archive and upload all the files into your root folder from the UPLOAD folder.</p>
          <p><a class="btn btn-primary btn-lg" href="https://shopunity.net/download" target="_blank">Download</a></p>
        </div>';
?>