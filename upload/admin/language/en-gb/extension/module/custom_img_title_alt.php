<?php
// Heading
$_['heading_title']          = 'Image Alt and Title';

//Button
$_['button_setting']         = 'Settings';
$_['button_getlist']         = 'View of attributes';
$_['button_filter']          = 'Filter';

//Tab
$_['tab_setting']            = 'Setting';
$_['tab_help']               = 'Help';
$_['tab_debug']              = 'Debug';

// Entry
$_['entry_status']           = 'Status';
$_['entry_add_expand']       = 'Rules for the formation of additional text in linked images';
$_['entry_add_title']        = 'Rules for the formation of the title attribute of the additional image';
$_['entry_add_alt']          = 'Rules for the formation of the alt attribute of the additional image';
$_['entry_main_alt']         = 'Rules for the formation of the title attribute of the main image';
$_['entry_main_title']       = 'Rules for the formation of the alt attribute of the additional image';

//Collumn
$_['column_image']           = 'Img';
$_['column_name']            = 'Name';

// Text
$_['text_extension']         = 'Extension';
$_['text_success']           = 'Settings changed successfully!';
$_['text_edit']              = 'Setting of module';
$_['text_view']              = 'View of attributes';
$_['text_custom_list']       = 'List All products';

$_['text_help']              = '<ul class="media-list" id="faqs">
  <li class="media">
    <div class="pull-left">
      <i class="fa fa-question-circle fa-4x media-object"></i>
    </div>
    <div class="media-body">
      <h3 class="media-heading">How to integrate the extension with a custom theme?</h3>
        <p>
If title and alt did not appear after applying the modifier, it means that your theme is different from the default template.
In this case, you need to make changes to the file modifier, or to create a separate file for modifying the product template.
If you yourself is not, contact the author, typically the author will advise, and sometimes set up.</p>
<p>
Если у вас что-то не получилось - жмите на эту кнопку <a class="btn btn-default" href="%s">Помогите! Спасайте!</a>, а содержимое файла предайте автору модуля
</p>
    </div>
  </li>
  <li class="media">
    <div class="pull-left">
      <i class="fa fa-question-circle fa-4x media-object"></i>
    </div>
    <div class="media-body">
      <h3 class="media-heading">Что такое шаблон подстановки?</h3>
        <p>
На этапе настройки значения атрибута неизвестно ни название товара, ни названия категории, ни других характеристик.
Для этого используюся макросы(шаблоны), которые автаматически подставятся.
Например, для уникализации дополнительных изображений можно подставить текущий номер, для этого достатчно добавить шаблон <b>[N]</b>
		</p>
<p>		Шаблоны для заполнения атрибутов:<br>
<b>[name]</b> - название товара,<br>
<b>[category]</b> - название категории,<br>
<b>[manufacturer]</b> - название производителя,<br>
<b>[N]</b> - порядковый номер фото
</p>
    </div>
  </li>
</ul>';

$_['text_original']          = 'Original template';
$_['text_modification']      = 'Modification template';
$_['text_modification_code'] = 'Code Modification';

$_['text_patern']            = 'Pattern Templates to filling the attributes:<br>
[name] - product name,<br>
[category] - category name,<br>
[manufacturer] - manufacturer name,<br>
[N] - number image';

// Error
$_['error_permission']       = 'You do not Have permission to modify module Image Alt and Title!';