<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><i class="fa fa-picture-o fa-fw text-primary"></i> <?php echo $heading_title; ?></h1>
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
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-setting" data-toggle="tab"><i class="fa fa-cog"></i> <?php echo $tab_setting; ?></a></li>
          <li><a href="#tab-help" data-toggle="tab"><i class="fa fa-question-circle"></i> <?php echo $tab_help; ?></a></li>
<!-- debug-tab -->		  
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-setting">
            <div class="container-fluid">
              <div class="pull-right">
               <a style="margin-right:40px" href="<?php echo $getlist; ?>" data-toggle="tooltip" title="<?php echo $button_getlist; ?>" class="btn btn-default"><i class="fa fa-th-list"></i></a>
               <button type="submit" form="form-custom_img_title_alt" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
               <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
              </div>
            </div>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-custom_img_title_alt" class="form-horizontal">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="custom_img_title_alt_enable" id="input-status" class="form-control">
                    <?php if ($custom_img_title_alt_enable) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-main_title"><?php echo $entry_main_title; ?></label>
                <div class="col-sm-10">
	              <?php foreach ($languages as $language) { ?>
		          <div class="input-group"><span class="input-group-addon"><img title="<?php echo $language['name']; ?>" src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
		          	<input type="text" class="form-control" value="<?php echo isset($custom_img_title_alt_main_title[$language['language_id']]) ? $custom_img_title_alt_main_title[$language['language_id']] : ''; ?>" name="custom_img_title_alt_main_title[<?php echo $language['language_id']; ?>]">
		          </div>
	              <?php } ?>
								<?php
								if (preg_match_all('#\[(.+?)\]#',$text_patern,$matches)) {
									foreach ($matches[0] as $match) {
										$text_patern = str_replace(
										$match , 
'<button type="button" class="btn btn-default btn-xs" data-insert-pattern="' . $match . '"><i class="fa fa-plus-circle"></i> ' . $match . '</button>',$text_patern);
									}
								}
?>				  
				  <div class="patern"><?php echo $text_patern; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-main_alt"><?php echo $entry_main_alt; ?></label>
                <div class="col-sm-10">
                  <?php foreach ($languages as $language) { ?>
                  <div class="input-group"><span class="input-group-addon"><img title="<?php echo $language['name']; ?>" src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                    <input type="text" class="form-control" value="<?php echo isset($custom_img_title_alt_main_alt[$language['language_id']]) ? $custom_img_title_alt_main_alt[$language['language_id']] : ''; ?>" name="custom_img_title_alt_main_alt[<?php echo $language['language_id']; ?>]">
                  </div>
                  <?php } ?>
				  <div class="patern"><?php echo $text_patern; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-add_alt"><?php echo $entry_add_alt; ?></label>
                <div class="col-sm-10">
                 <?php foreach ($languages as $language) { ?>
                   <div class="input-group"><span class="input-group-addon"><img title="<?php echo $language['name']; ?>" src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                     <input type="text" class="form-control" value="<?php echo isset($custom_img_title_alt_add_alt[$language['language_id']]) ? $custom_img_title_alt_add_alt[$language['language_id']] : ''; ?>" name="custom_img_title_alt_add_alt[<?php echo $language['language_id']; ?>]">
                   </div>
				  <div class="patern"><?php echo $text_patern; ?></div>
                 <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-add_title"><?php echo $entry_add_title; ?></label>
                <div class="col-sm-10">
                 <?php foreach ($languages as $language) { ?>
                   <div class="input-group"><span class="input-group-addon"><img title="<?php echo $language['name']; ?>" src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                     <input type="text" class="form-control" value="<?php echo isset($custom_img_title_alt_add_title[$language['language_id']]) ? $custom_img_title_alt_add_title[$language['language_id']] : ''; ?>" name="custom_img_title_alt_add_title[<?php echo $language['language_id']; ?>]">
                   </div>
                 <?php } ?>
				  <div class="patern"><?php echo $text_patern; ?></div>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-add_expand"><?php echo $entry_add_expand; ?></label>
                <div class="col-sm-10">
                 <?php foreach ($languages as $language) { ?>
                   <div class="input-group"><span class="input-group-addon"><img title="<?php echo $language['name']; ?>" src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"></span>
                     <input type="text" class="form-control" value="<?php echo isset($custom_img_title_alt_add_expand[$language['language_id']]) ? $custom_img_title_alt_add_expand[$language['language_id']] : ''; ?>" name="custom_img_title_alt_add_expand[<?php echo $language['language_id']; ?>]">
                   </div>
                 <?php } ?>
				  <div class="patern"><?php echo $text_patern; ?></div>
                </div>
              </div>
            </form>
		   </div>
          <div class="tab-pane" id="tab-help">
            <?php echo $text_help; ?>
          </div>
<!-- debug-block -->		  
		</div>
      </div>
    </div>
  </div>
</div>
<script>
var last_input = false;
$('input').focus(function(){last_input=this});
$('[data-insert-pattern]').on('click', function() {
	if (last_input) {
		var last = $(last_input);
		var caretPos = last[0].selectionStart;
		var val = last.val();
		var data_insert_pattern = $(this).attr('data-insert-pattern');
		last.val(val.substring(0, caretPos) + ' ' + data_insert_pattern + ' ' + val.substring(caretPos) );
	}
});
</script>
<?php echo $footer; ?>