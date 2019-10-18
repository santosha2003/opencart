<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-module-custom-template" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-module-custom-template" class="form-horizontal">
          <?php $module_row = 0; ?>
          <?php foreach ($modules as $module): ?>
          <div class="panel panel-default" id="panel<?php echo $module_row ?>">
            <div class="panel-body">

              <div class="form-group module<?php echo $module_row ?> common<?php echo $module_row ?>">
                <label class="col-sm-2 control-label" for="custom_template_module_<?php echo $module_row ?>_type"><?php echo $entry_module_type; ?></label>
                <div class="col-sm-10">
                  <select class="form-control select_type" data-id="<?php echo $module_row ?>" name="custom_template_module[<?php echo $module_row ?>][type]" id="custom_template_module_<?php echo $module_row ?>_type">
                    <?php foreach ($module_types as $type_id => $type_caption): ?>
                      <?php if ($type_id == $module['type']){ ?>
                        <option value="<?php echo $type_id ?>" selected="selected"><?php echo $type_caption ?></option>
                      <?php } else { ?>
                        <option value="<?php echo $type_id ?>"><?php echo $type_caption ?></option>
                      <?php } ?>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <div class="form-group scategories module<?php echo $module_row ?>">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_category_help; ?>"><?php echo $entry_category; ?></span></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($categories as $category_key => $category_data) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($category_data['category_id'], $module['categories'])) { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" checked="checked" />
                        <?php echo $category_data['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" />
                        <?php echo $category_data['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>

              <div class="form-group sinformations module<?php echo $module_row ?>">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_information_help; ?>"><?php echo $entry_information; ?></span></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($informations as $information_key => $information_data) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($information_data['information_id'], $module['informations'])) { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]" value="<?php echo $information_data['information_id']; ?>" checked="checked" />
                        <?php echo $information_data['title']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][informations][<?php echo $information_data['information_id']; ?>]" value="<?php echo $information_data['information_id']; ?>" />
                        <?php echo $information_data['title']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>

              <div class="form-group smanufacturers module<?php echo $module_row ?>">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_manufacturer_help; ?>"><?php echo $entry_manufacturer; ?></span></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($manufacturers as $manufacturer_key => $manufacturer_data) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($manufacturer_data['manufacturer_id'], $module['manufacturers'])) { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" checked="checked" />
                        <?php echo $manufacturer_data['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" />
                        <?php echo $manufacturer_data['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>

              <div class="form-group sproducts module<?php echo $module_row ?>">
                <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $entry_product_help; ?>"><?php echo $entry_product; ?></span></span></label>
                <div class="col-sm-10">
                  <input type="text" value="" placeholder="<?php echo $entry_product; ?>" id="input-related" class="form-control product_autocomplete" data-id="<?php echo $module_row ?>" /><br>
                  <div id="custom-template-product<?php echo $module_row ?>" class="well well-sm product_container" style="height: 150px; overflow: auto;">
                    <?php foreach ($module['parsed_products'] as $product): ?>
                    <div id="custom-template-product<?php echo $module_row ?>-<?php echo $product['product_id']; ?>"><i data-id="<?php echo $module_row ?>"  class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                      <input type="hidden" name="custom_template_module[<?php echo $module_row ?>][tmp_products][]" value="<?php echo $product['product_id']; ?>" />
                    </div>
                    <?php endforeach ?>
                  </div>
                </div>
                <input type="hidden" name="custom_template_module[<?php echo $module_row ?>][products]" value="<?php echo $module['products']; ?>" />
              </div>

              <div class="form-group sproduct_categories module<?php echo $module_row ?>">
                <label class="col-sm-2 control-label"><?php echo $entry_category; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($categories as $category_key => $category_data) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($category_data['category_id'], $module['product_categories'])) { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" checked="checked" />
                        <?php echo $category_data['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][product_categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" />
                        <?php echo $category_data['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>

              <div class="form-group sproduct_manufacturers module<?php echo $module_row ?>">
                <label class="col-sm-2 control-label"><?php echo $entry_manufacturer; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($manufacturers as $manufacturer_key => $manufacturer_data) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($manufacturer_data['manufacturer_id'], $module['product_manufacturers'])) { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" checked="checked" />
                        <?php echo $manufacturer_data['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" />
                        <?php echo $manufacturer_data['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>

              <div class="form-group scustomer_groups module<?php echo $module_row ?> common<?php echo $module_row ?>">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_customer_group_help; ?>"><?php echo $entry_customer_group; ?></span></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($customer_groups as $customer_group_key => $customer_group_data) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($customer_group_data['customer_group_id'], $module['customer_groups'])) { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" value="<?php echo $customer_group_data['customer_group_id']; ?>" checked="checked" />
                        <?php echo $customer_group_data['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" id="custom_template_module[<?php echo $module_row ?>][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" value="<?php echo $customer_group_data['customer_group_id']; ?>" />
                        <?php echo $customer_group_data['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                  </div>
                <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a>
                </div>
              </div>


              <div class="form-group required stemplate module<?php echo $module_row ?> common<?php echo $module_row ?>">
                <label class="col-sm-2 control-label" for="custom_template_module_<?php echo $module_row ?>_template_name"><span data-toggle="tooltip" title="<?php echo $entry_template_help; ?>"><?php echo $entry_template; ?></span></label>
                <div class="col-sm-10">
                  <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1"><?php echo $template_addon ?></span>
                    <input type="text" id="custom_template_module_<?php echo $module_row ?>_template_name" name="custom_template_module[<?php echo $module_row ?>][template_name]" value="<?php echo $module['template_name'] ?>" placeholder="<?php echo $entry_template; ?>" class="form-control" />
                    <span class="input-group-btn">
                      <button class="btn btn-default" onClick="checkFile(<?php echo $module_row ?>);" type="button"><?php echo $button_check_file ?></button>
                    </span>
                  </div>
                  <br>
                </div>
              </div>

              <div class="form-group required module<?php echo $module_row ?> common<?php echo $module_row ?>">
                <div class="col-sm-12 text-right">
                  <button class="btn btn-danger" onClick="$('#panel<?php echo $module_row; ?>').remove();" type="button" title="<?php echo $button_remove ?>" alt="<?php echo $button_remove ?>"><i class="fa fa-trash-o"></i></button>
                </div>
              </div>

            </div>
          </div>
          <?php $module_row++ ?>
          <?php endforeach ?>
          <div class="form-group" id="adder">
            <div class="col-sm-12">
              <button class="col-sm-12 btn btn-default" onClick="addModule();" type="button" title="<?php echo $button_add_module ?>" alt="<?php echo $button_add_module ?>"><?php echo $button_add_module ?></button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;
$(document).ready(function(){
  init_form();
  // Related
  $('.product_autocomplete').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('#custom-template-product'+$(this).attr('data-id') +'-'+ item.value).remove();

      $('#custom-template-product'+$(this).attr('data-id')).append('<div id="custom-template-product' + $(this).attr('data-id') + '-' + item['value'] + '" data-id="' + $(this).attr('data-id') + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="custom_template_module['+$(this).attr('data-id')+'][tmp_products][]" value="' + item['value'] + '" /></div>');

      data = $.map($('#custom-template-product'+$(this).attr('data-id')+' input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'custom_template_module['+$(this).attr('data-id')+'][products]\']').attr('value', data.join());
    }
  });

  $('.product_container').delegate('.fa-minus-circle', 'click', function() {
    var row_id = $(this).parent().attr('data-id');
    $(this).parent().remove();
    var data = $.map($('#custom-template-product' + row_id + ' input'), function(element){
      return $(element).attr('value');
    });
    $('input[name=\'custom_template_module[' + row_id + '][products]\']').attr('value', data.join());
  });
  //end Related
});

$('#form').submit(function(event){
  $.each($('.select_type'), function(){
    var elem_id = $(this).attr('data-id');
    var elem = $('input[name=\'custom_template_module['+elem_id+'][template_name]\']');
    if (empty($(elem).val())) {
      $(elem).parents('.form-group').addClass('highlight_error');
      $(elem).focus();
      //alert('<?php echo $text_empty_field; ?>');
      event.preventDefault();
    }else{
      return;
    }
  });
});
function deleteModule(module_id){

}
function empty( mixed_var ) {
  return ( mixed_var === "" || mixed_var === 0   || mixed_var === "0" || mixed_var === null  || mixed_var === false );
}
function checkFile(module_id){
  console.log($('#custom_template_module_' + module_id + '_template_name').val());
  $.ajax({
    url: 'index.php?route=extension/module/custom_template/check_file&token=<?php echo $token ?>',
    type: 'POST',
    dataType: 'json',
    data: {path: $('#custom_template_module_' + module_id + '_template_name').val()},
  })
  .success(function(data){
    console.log(data);
    if (data['success']) {
      $('.stemplate.module' + module_id + ' br').after('<div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> ' + data['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    };

    if (data['warning']) {
      $('.stemplate.module' + module_id + ' br').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + data['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    }
  })
}
function init_form(){
  $.each($('.select_type'), function(){
    var elem_id = $(this).attr('data-id');
    $('.stemplate').find('input').on('change keyup paste', function(event){
      if (empty($(this).val())) {
        $(this).parents('.form-group').addClass('highlight_error');
      }else{
        $(this).parents('.form-group').removeClass('highlight_error');
      }
    });

    switch (parseInt($(this).val())) {
      case 0:
        $('#panel'+elem_id).addClass('categories');
        $('#panel'+elem_id).removeClass('products informations manufacturers product_categories product_manufacturers');
        $('.scategories.module'+elem_id).show();
        $('.sproducts.module'+elem_id+', .sinformations.module'+elem_id+', .smanufacturers.module'+elem_id+', .sproduct_categories.module'+elem_id+', .sproduct_manufacturers.module'+elem_id).hide();
      break;
      case 1:
        $('#panel'+elem_id).addClass('products');
        $('#panel'+elem_id).removeClass('categories informations manufacturers product_categories product_manufacturers');
        $('.sproducts.module'+elem_id).show();
        $('.scategories.module'+elem_id+', .sinformations.module'+elem_id+', .smanufacturers.module'+elem_id+', .sproduct_categories.module'+elem_id+', .sproduct_manufacturers.module'+elem_id).hide();
      break;
      case 2:
        $('#panel'+elem_id).addClass('informations');
        $('#panel'+elem_id).removeClass('categories products manufacturers product_categories product_manufacturers');
        $('.sinformations.module'+elem_id).show();
        $('.scategories.module'+elem_id+', .sproducts.module'+elem_id+', .smanufacturers.module'+elem_id+', .sproduct_categories.module'+elem_id+', .sproduct_manufacturers.module'+elem_id).hide();
      break;
      case 3:
        $('#panel'+elem_id).addClass('manufacturers');
        $('#panel'+elem_id).removeClass('categories products informations product_categories product_manufacturers');
        $('.smanufacturers.module'+elem_id).show();
        $('.scategories.module'+elem_id+', .sproducts.module'+elem_id+', .sinformations.module'+elem_id+', .sproduct_categories.module'+elem_id+', .sproduct_manufacturers.module'+elem_id).hide();
      break;
      case 4:
        $('#panel'+elem_id).addClass('product_categories');
        $('#panel'+elem_id).removeClass('products informations manufacturers categories product_manufacturers');
        $('.sproduct_categories.module'+elem_id).show();
        $('.scategories.module'+elem_id+', .sproducts.module'+elem_id+', .sinformations.module'+elem_id+', .smanufacturers.module'+elem_id+', .sproduct_manufacturers.module'+elem_id).hide();
      break;
      case 5:
        $('#panel'+elem_id).addClass('product_manufacturers');
        $('#panel'+elem_id).removeClass('products informations manufacturers categories product_categories');
        $('.sproduct_manufacturers.module'+elem_id).show();
        $('.scategories.module'+elem_id+', .sproducts.module'+elem_id+', .sinformations.module'+elem_id+', .smanufacturers.module'+elem_id+', .sproduct_categories.module'+elem_id).hide();
      break;
    }
  });
}
$('.select_type').change(function(){
  init_form();
});
function addModule(){
  html = '';
  html += '<div class="panel panel-default" id="panel' + module_row + '">';
  html += '<div class="panel-body">';

  html += '<div class="form-group module' + module_row + ' common' + module_row + '">';
  html += '<label class="col-sm-2 control-label" for="custom_template_module_' + module_row + '_type"><?php echo $entry_module_type; ?></label>';
  html += '<div class="col-sm-10">';
  html += '<select class="form-control select_type" data-id="' + module_row + '" name="custom_template_module[' + module_row + '][type]" id="custom_template_module_' + module_row + '_type">';
  <?php foreach ($module_types as $type_id => $type_caption): ?>
  html += '<option value="<?php echo $type_id ?>"><?php echo $type_caption ?></option>';
  <?php endforeach ?>
  html += '</select>';
  html += '</div>';
  html += '</div>';

  html += '<div class="form-group scategories module' + module_row + '">';
  html += '<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_category_help; ?>"><?php echo $entry_category; ?></span></label>';
  html += '<div class="col-sm-10">';
  html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
  <?php foreach ($categories as $category_key => $category_data) { ?>
  html += '<div class="checkbox">';
  html += '<label>';
  html += '<input type="checkbox" name="custom_template_module[' + module_row + '][categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[' + module_row + '][categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" />';
  html += ' <?php echo addslashes($category_data['name']); ?>';
  html += '</label>';
  html += '</div>';
  <?php } ?>
  html += '</div>';
  html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html += '</div>';
  html += '</div>';

  html += '<div class="form-group sinformations module' + module_row + '">';
  html += '<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_information_help; ?>"><?php echo $entry_information; ?></span></label>';
  html += '<div class="col-sm-10">';
  html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
  <?php foreach ($informations as $information_key => $information_data) { ?>
  html += '<div class="checkbox">';
  html += '<label>';
  html += '<input type="checkbox" name="custom_template_module[' + module_row + '][informations][<?php echo $information_data['information_id']; ?>]" id="custom_template_module[' + module_row + '][informations][<?php echo $information_data['information_id']; ?>]" value="<?php echo $information_data['information_id']; ?>" />';
  html += ' <?php echo addslashes($information_data['title']); ?>';
  html += '</label>';
  html += '</div>';
  <?php } ?>
  html += '</div>';
  html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html += '</div>';
  html += '</div>';

  html += '<div class="form-group smanufacturers module' + module_row + '">';
  html += '<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_manufacturer_help; ?>"><?php echo $entry_manufacturer; ?></span></label>';
  html += '<div class="col-sm-10">';
  html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
  <?php foreach ($manufacturers as $manufacturer_key => $manufacturer_data) { ?>
  html += '<div class="checkbox">';
  html += '<label>';
  html += '<input type="checkbox" name="custom_template_module[' + module_row + '][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[' + module_row + '][manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" />';
  html += ' <?php echo addslashes($manufacturer_data['name']); ?>';
  html += '</label>';
  html += '</div>';
  <?php } ?>
  html += '</div>';
 html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html += '</div>';
  html += '</div>';

  html += '<div class="form-group sproducts module' + module_row + '">';
  html += '<label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $entry_product_help; ?>"><?php echo $entry_product; ?></span></span></label>';
  html += '<div class="col-sm-10">';
  html += '<input type="text" value="" placeholder="<?php echo $entry_product; ?>" id="input-related" class="form-control product_autocomplete" data-id="' + module_row + '" /><br>';
  html += '<div id="custom-template-product' + module_row + '" class="well well-sm product_container" style="height: 150px; overflow: auto;">';
  html += '</div>';
  html += '</div>';
  html += '<input type="hidden" name="custom_template_module[' + module_row + '][products]" value="" />';
  html += '</div>';

  html += '<div class="form-group sproduct_categories module' + module_row + '">';
  html += '<label class="col-sm-2 control-label"><?php echo $entry_category; ?></label>';
  html += '<div class="col-sm-10">';
  html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
  <?php foreach ($categories as $category_key => $category_data) { ?>
  html += '<div class="checkbox">';
  html += '<label>';
  html += '<input type="checkbox" name="custom_template_module[' + module_row + '][product_categories][<?php echo $category_data['category_id']; ?>]" id="custom_template_module[' + module_row + '][product_categories][<?php echo $category_data['category_id']; ?>]" value="<?php echo $category_data['category_id']; ?>" />';
  html += ' <?php echo addslashes($category_data['name']); ?>';
  html += '</label>';
  html += '</div>';
  <?php } ?>
  html += '</div>';
  html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html += '</div>';
  html += '</div>';

  html += '<div class="form-group sproduct_manufacturers module' + module_row + '">';
  html += '<label class="col-sm-2 control-label"><?php echo $entry_manufacturer; ?></label>';
  html += '<div class="col-sm-10">';
  html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
  <?php foreach ($manufacturers as $manufacturer_key => $manufacturer_data) { ?>
  html += '<div class="checkbox">';
  html += '<label>';
  html += '<input type="checkbox" name="custom_template_module[' + module_row + '][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" id="custom_template_module[' + module_row + '][product_manufacturers][<?php echo $manufacturer_data['manufacturer_id']; ?>]" value="<?php echo $manufacturer_data['manufacturer_id']; ?>" />';
  html += ' <?php echo addslashes($manufacturer_data['name']); ?>';
  html += '</label>';
  html += '</div>';
  <?php } ?>
  html += '</div>';
  html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html += '</div>';
  html += '</div>';

  html += '<div class="form-group scustomer_groups module' + module_row + ' common' + module_row + '">';
  html += '<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $entry_customer_group_help; ?>"><?php echo $entry_customer_group; ?></span></label>';
  html += '<div class="col-sm-10">';
  html += '<div class="well well-sm" style="height: 150px; overflow: auto;">';
  <?php foreach ($customer_groups as $customer_group_key => $customer_group_data) { ?>
  html += '<div class="checkbox">';
  html += '<label>';
  html += '<input type="checkbox" name="custom_template_module[' + module_row + '][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" id="custom_template_module[' + module_row + '][customer_groups][<?php echo $customer_group_data['customer_group_id']; ?>]" value="<?php echo $customer_group_data['customer_group_id']; ?>" />';
  html += ' <?php echo addslashes($customer_group_data['name']); ?>';
  html += '</label>';
  html += '</div>';
  <?php } ?>
  html += '</div>';
  html += '<a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(\':checkbox\').prop(\'checked\', false);"><?php echo $text_unselect_all; ?></a>';
  html += '</div>';
  html += '</div>';

  html += '<div class="form-group required stemplate module' + module_row + ' common' + module_row + '">';
  html += '<label class="col-sm-2 control-label" for="custom_template_module_' + module_row + '_template_name"><span data-toggle="tooltip" title="<?php echo $entry_template_help; ?>"><?php echo $entry_template; ?></span></label>';
  html += '<div class="col-sm-10">';
  html += '<div class="input-group">';
  html += '<span class="input-group-addon" id="basic-addon1"><?php echo $js_template_addon ?></span>';
  html += '<input type="text" id="custom_template_module_' + module_row + '_template_name" name="custom_template_module[' + module_row + '][template_name]" value="" placeholder="<?php echo $entry_template; ?>" class="form-control" />';
  html += '<span class="input-group-btn">';
  html += '<button class="btn btn-default" onClick="checkFile(' + module_row + ');" type="button"><?php echo $button_check_file ?></button>';
  html += '</span>';
  html += '</div>';
  html += '<br>';
  html += '</div>';
  html += '</div>';

  html += '<div class="form-group required module' + module_row + ' common' + module_row + '">';
  html += '<div class="col-sm-12 text-right">';
  html += '<button class="btn btn-danger" onClick="$(\'#panel<?php echo $module_row; ?>\').remove();" type="button" title="<?php echo $button_remove ?>" alt="<?php echo $button_remove ?>"><i class="fa fa-trash-o"></i></button>';
  html += '</div>';
  html += '</div>';

  html += '</div>';
  html += '</div>';
  $('#adder').before(html);
  $('body').tooltip({
      selector: '[data-toggle=tooltip]'
  });
  init_form();
  // Related
  $('.product_autocomplete').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['product_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('#custom-template-product'+$(this).attr('data-id') +'-'+ item.value).remove();

      $('#custom-template-product'+$(this).attr('data-id')).append('<div id="custom-template-product' + $(this).attr('data-id') + '-' + item['value'] + '" data-id="' + $(this).attr('data-id') + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="custom_template_module['+$(this).attr('data-id')+'][tmp_products][]" value="' + item['value'] + '" /></div>');

      data = $.map($('#custom-template-product'+$(this).attr('data-id')+' input'), function(element){
        return $(element).attr('value');
      });
      $('input[name=\'custom_template_module['+$(this).attr('data-id')+'][products]\']').attr('value', data.join());
    }
  });

  $('.product_container').delegate('.fa-minus-circle', 'click', function() {
    var row_id = $(this).parent().attr('data-id');
    $(this).parent().remove();
    var data = $.map($('#custom-template-product' + row_id + ' input'), function(element){
      return $(element).attr('value');
    });
    $('input[name=\'custom_template_module[' + row_id + '][products]\']').attr('value', data.join());
  });
  //end Related
  $('.select_type').change(function(){
    init_form();
  });
  module_row++;
}
</script>
<style>
.categories{
  background-color: #fff4d9;
  border-left: 5px solid #ffd166;
}
.informations{
  background-color: #f4ffed;
  border-left: 5px solid #b1db95;
}
.manufacturers{
  background-color: #ebfcff;
  border-left: 5px solid #4d90fe;
}
.products{
  background-color: #f7f2ff;
  border-left: 5px solid #c4a0ff;
}
.product_categories{
  background-color: #ffeded;
  border-left: 5px solid #ffcece;
}
.product_manufacturers{
  background-color: #CFFFD7;
  border-left: 5px solid #4D814A;
}
.highlight_error{
  border-left: 5px solid #CE4C38;
  background: #ffc9c9;
}
</style>
<?php echo $footer; ?>