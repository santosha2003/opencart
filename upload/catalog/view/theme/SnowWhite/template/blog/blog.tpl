<?php echo $header; ?>
<div class="container">
  <div class="row">
		<div class="breadcrumbs col-md-12">
			<?php $i = 0; foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php if($i != count($breadcrumbs) - 1){ ?>
			<span class="bread"><a href="<?php echo $breadcrumb['href']; ?>">
					<?php echo $breadcrumb['text']; ?> </a></span><i> / </i>
			<?php } else { ?>
			<span class="bread">
				<?php echo $breadcrumb['text']; ?></span>
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
      <h2><?php echo $name; ?></h2>
      <?php if ($articles) { ?>

        <?php foreach ($articles as $article) { ?>
          <div class="panel panel-default">
              <div class="panel-body">
                <div class="article-layout article-list col-xs-12">
                  <div class="article-intro">
                    <div>
                        <h3><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></h3>
                        <p><?php echo $article['date_modified']; ?></p>
                        <p><?php echo $article['intro_text']; ?></p>
                    </div>
                  </div>
                  <div class="buttons">
                        <div class="pull-right"><a href="<?php echo $article['href']; ?>" class="btn btn-primary"><?php echo $button_read_more; ?></a></div>
                  </div>
                </div>
              </div>
          </div>
        <?php } ?>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
