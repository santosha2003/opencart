<?php echo $header; ?>
<div id="badlink" class="col-sm-12"><!-- плохая ссылка class="col-sm-12" style="width: 100%;" ul class="breadcrumb" style="display: block; width: 100%;" -->
  <div class="row" style="margin-top: 10px,margin-left: 10px">
  <ul class="breadcrumb" style="float: left">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  </div>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
</div>
<!-- <aside id="column-left" class="col-sm-3"> дубль -->
<div class="col-sm-12"  ><?php echo $column_left; //style width: 25%; float: left; ?>
<!--     </aside> -->
  <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <p><?php echo $text_error; ?></p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
        </div>
      </div>
    <?php echo $content_bottom; ?>
    <?php echo $column_right; ?>
  </div>
</div>
<hr>
<?php echo $footer; ?>
