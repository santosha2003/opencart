<?php echo $header; ?>
<div id="container" class="col-sm-12"><!-- info -->
  <ul class="breadcrumb" style="width: 100%;">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
<!--     <aside id="column-left" class="col-sm-3"> -->
  <div class="col-sm-12"><!-- info tpl class col-sm-9 - left panel visible // Santosha.no-ip.info --><?php echo $column_left; ?>
<!--  </aside> -->
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
     <div id="content" class="<?php //echo $class; ?>col-sm-12"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $description; ?><?php echo $content_bottom; ?>
     </div>
    <?php echo $column_right; ?>
   </div>
</div>
<?php echo $footer; ?>