<?php echo $header; ?>
<?php echo $column_left; ?>

<!--
@category  : OpenCart
@module    : Smart Wishlist Without Login
@author    : OCdevWizard <ocdevwizard@gmail.com>
@copyright : Copyright (c) 2015, OCdevWizard
@license   : http://license.ocdevwizard.com/Noncommercial_Licensing_Policy.pdf
 -->

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" formaction="<?php echo $action; ?>" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a onclick="confirm('Are you sure?') ? href='<?php echo $uninstall; ?>' : false;" data-toggle="tooltip" title="<?php echo $button_uninstall; ?>" class="btn btn-danger"><i class="fa fa-trash"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_name; ?></h1>
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
    <?php if ($warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" id="setting-tabs">
            <li class="active"><a href="#general-block" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $tab_control_panel; ?></a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-life-ring" aria-hidden="true"></i> <?php echo $tab_support_setting; ?> <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#support-general-block" data-toggle="tab"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $tab_support_general_setting; ?></a></li>
                <li><a href="#support-extension-block" data-toggle="tab"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $tab_support_extension_setting; ?></a></li>
                <li><a href="#support-terms-block" data-toggle="tab"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $tab_support_terms_setting; ?></a></li>
                <li><a href="#support-service-block" data-toggle="tab"><i class="fa fa-info-circle" aria-hidden="true"></i> <?php echo $tab_support_service_setting; ?></a></li>
                <li><a href="#support-faq-block" data-toggle="tab"><i class="fa fa-question-circle" aria-hidden="true"></i> <?php echo $tab_support_faq_setting; ?></a></li>
                <li><a href="#promo-block" data-toggle="tab"><i class="fa fa-briefcase"></i> <?php echo $tab_promo_setting; ?></a></li>
              </ul>
            </li>
          </ul>
          <div class="tab-content">
            <!-- TAB General setting -->
            <div class="tab-pane active" id="general-block">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_activate_module; ?></label>
                <div class="col-sm-10">
                  <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-success <?php echo $form_data['activate'] == 1 ? 'active' : ''; ?>">
                      <input type="radio"
                        name="<?php echo $_module_name; ?>_form_data[activate]"
                        value="1"
                        autocomplete="off"
                        <?php echo $form_data['activate'] == 1 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_yes; ?>
                    </label>
                    <label class="btn btn-success <?php echo $form_data['activate'] == 0 ? 'active' : ''; ?>">
                      <input type="radio"
                        name="<?php echo $_module_name; ?>_form_data[activate]"
                        value="0"
                        autocomplete="off"
                        <?php echo $form_data['activate'] == 0 ? 'checked="checked"' : ''; ?>
                      /><?php echo $text_no; ?>
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <!-- TAB Support General block -->
            <div class="tab-pane" id="support-general-block">
              <?php echo $support_info['general']; ?>
            </div>
            <!-- TAB Support Extension block -->
            <div class="tab-pane" id="support-extension-block">
              <div class="panel panel-default">
                <div class="panel-heading"><b><?php echo $tab_support_extension_setting; ?></b></div>
                <table class="table">
                  <?php if ($products) { ?>
                  <?php foreach ($products as $product) { ?>
                  <?php if ($product['extension_id'] == 21136) { ?>
                  <tr>
                    <td width="20%"><?php echo $text_installed_module_name; ?></td>
                    <td><i class="fa fa-external-link" aria-hidden="true"></i> <a href="<?php echo $product['url']; ?>" target="_blank"><?php echo $product['title']; ?></td>
                  </tr>
                  <tr>
                    <td><?php echo $text_installed_module_version; ?></td>
                    <?php $_tmp_module_version = version_compare($_module_version, $product['latest_version']); ?>
                    <td><?php echo $_module_version; ?> <?php if ($_tmp_module_version == "-1") { ?><a class="btn btn-success btn-sm" href="<?php echo $product['url']; ?>" target="_blank"><?php echo $text_new_module_version; ?> <?php echo $product['latest_version']; ?></a><?php } ?></td>
                  </tr>
                  <?php } ?>
                  <?php } ?>
                  <?php } ?>
                  <tr>
                    <td width="20%"><?php echo $text_opencart_version; ?></td>
                    <td><?php echo $opencart_version; ?></td>
                  </tr>
                </table>
              </div>
            </div>
            <!-- TAB Support General block -->
            <div class="tab-pane" id="support-terms-block">
              <?php echo $support_info['terms']; ?>
            </div>
            <!-- TAB Support Faq block -->
            <div class="tab-pane" id="support-faq-block">
              <?php echo $support_info['faq']; ?>
            </div>
            <!-- TAB Support Service block -->
            <div class="tab-pane" id="support-service-block">
              <?php echo $support_info['service']; ?>
            </div>
            <!-- TAB OCdev Products -->
            <div class="tab-pane" id="promo-block">
              <?php if ($products) { ?>
              <div class="row">
                <?php foreach ($products as $product) { ?>
                <div class="col-xs-6 col-md-2 col-sm-3">
                  <div class="thumbnail" onclick='$("#extension_id-<?php echo $product['extension_id']; ?>").modal();' data-toggle="tooltip" data-placement="bottom" title="Click to Read more..." >
                    <img src="<?php echo $product['img']; ?>" alt="<?php echo $product['title']; ?>" width="100%" />
                  </div>
                  <!-- Modal -->
                  <div class="modal fade" id="extension_id-<?php echo $product['extension_id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="max-width:450px;">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                          <h4 class="modal-title" id="myModalLabel"><?php echo $product['title']; ?></h4>
                        </div>
                        <div class="modal-body">
                          <div role="tabpanel">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                              <li class="active"><a href="#modal-info-<?php echo $product['extension_id']; ?>" data-toggle="tab"><i class="fa fa-info-circle"></i> <?php echo $tab_modal_info; ?></a></li>
                              <li><a href="#modal-opencart-version-<?php echo $product['extension_id']; ?>" data-toggle="tab"><i class="fa fa-check-circle"></i> <?php echo $tab_modal_for_opencart; ?></a></li>
                              <li><a href="#modal-features-<?php echo $product['extension_id']; ?>" data-toggle="tab"><i class="fa fa-star"></i> <?php echo $tab_modal_features; ?></a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                              <div class="tab-pane active" id="modal-info-<?php echo $product['extension_id']; ?>">
                                <ul class="list-group">
                                  <li class="list-group-item"><?php echo $text_modal_price; ?> <b class="pull-right"><?php echo $product['price']; ?></b></li>
                                  <li class="list-group-item"><?php echo $text_modal_date_added; ?> <b class="pull-right"><?php echo $product['date_added']; ?></b></li>
                                  <li class="list-group-item"><?php echo $text_modal_latest_version; ?> <b class="pull-right"><?php echo $product['latest_version']; ?></b></li>
                                </ul>
                              </div>
                              <div class="tab-pane" id="modal-opencart-version-<?php echo $product['extension_id']; ?>">
                                <ul class="list-group">
                                  <li class="list-group-item">
                                    <div class="row">
                                    <?php $opencart_version_array = explode(',', $product['opencart_version']); ?>
                                    <?php foreach ($opencart_version_array as $value) { ?>
                                      <div class="col-xs-6 col-md-2 col-sm-3"><?php echo $value; ?></div>
                                    <?php } ?>
                                    </div>
                                  </li>
                                </ul>
                              </div>
                              <div class="tab-pane" id="modal-features-<?php echo $product['extension_id']; ?>">
                                <ul class="list-group">
                                  <li class="list-group-item">
                                    <div class="row">
                                    <?php $opencart_features_array = explode(';', $product['features']); ?>
                                    <?php foreach ($opencart_features_array as $value) { ?>
                                      <div class="col-xs-12 col-md-12 col-sm-12"><?php echo $value; ?></div>
                                    <?php } ?>
                                    </div>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <a href="<?php echo $product['url']; ?>" target="blank" class="btn btn-primary" style="width:100%;"><i class="fa fa-external-link"></i> <?php echo $button_visit_sales_page; ?></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(function() {
  $('#module li:first-child a').tab('show');
});

if (window.localStorage && window.localStorage['last_active_tab']) {
  $('#setting-tabs a[href=' + window.localStorage['last_active_tab'] + ']').trigger('click');
}
$('#setting-tabs a[data-toggle="tab"]').click(function() {
  if (window.localStorage) {
    window.localStorage['last_active_tab'] = $(this).attr('href');
  }
});
//--></script>
<?php echo $footer; ?>
