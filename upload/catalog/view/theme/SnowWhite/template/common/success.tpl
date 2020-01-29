<?php echo $header; ?>
<div class="container">
  <div class="row">
		<div class="breadcrumbs col-md-12">
            <?php $i = 0; foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php if($i != count($breadcrumbs) - 1){ ?>
            <span class="bread"><a href="<?php echo $breadcrumb['href']; ?>"> 
                    <?php echo $breadcrumb['text']; ?> </a></span><i> / </i>
			<?php } else { ?>
				<span class="bread"> <?php echo $breadcrumb['text']; ?></span>
			<?php } ?>
            <?php $i++; } ?>
        </div>
  </div>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="butn"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>