<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-sm_tagcloud" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if (isset($error['error_warning'])) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error['error_warning']; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
      
      <div class="alert alert-info"><?php echo $text_info; ?></div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-sm_tagcloud" class="form-horizontal">
          
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_generate; ?></label>
            <div class="col-sm-10">
            <p><a class="btn btn-primary" id="generate-tags"><?php echo $entry_generate; ?></a></p>
            <div id="notification"></div>
            </div>
          </div>
          
          <?php foreach ($languages as $language) { ?>
            <div class="form-group">
                <label class="col-sm-2 control-label"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $entry_title; ?></label>
                <div class="col-sm-10">
                 <input type="text" name="sm_tagcloud_title[<?php echo $language['code']; ?>]" value="<?php echo $sm_tagcloud_title[$language['code']]; ?>" class="form-control"/>
                </div>
            </div>
            <?php } ?>

          <div class="form-group">
            <label class="col-sm-2 control-label" for="sm_tagcloud_limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sm_tagcloud_limit" value="<?php echo $sm_tagcloud_limit; ?>" class="form-control"/>
            </div>
          </div>
          
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="sm_tagcloud_status" id="input-status" class="form-control">
                <?php if ($sm_tagcloud_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#generate-tags').click(function(e) {
$.get('<?php echo html_entity_decode($generate_url); ?>');
$('#notification').html('<p class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $text_success; ?> <button type="button" class="close" data-dismiss="alert">&times;</button></p>');
});
//--></script>
<?php echo $footer; ?>