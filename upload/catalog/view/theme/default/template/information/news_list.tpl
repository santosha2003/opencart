<?php echo $header; ?>
<div class="container">
  
  <div class="row">
	  <div class="col-xs-12">
				<div class="content-in">
					<div class="row">
					
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
	
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
		<?php echo $content_top; ?>
		 <h2 class="page-title"><?php echo $heading_title; ?></h2>
			<div class="news-list">
			<?php foreach ($all_news as $news) { ?>
			<div class="news-item">
			<div class="row">
			 <?php if ($news['image']) { ?>
				<div class="col-md-2 col-sm-3 text-center"><a href="<?php echo $news['view']; ?>"><img src="<?php echo $news['image']; ?>" style="max-width:100%" /></a></div>
				<div class="col-md-10 col-sm-9">
					<div class="news-title"><a href="<?php echo $news['view']; ?>"><?php echo $news['title']; ?></a></div>
					<div class="news-date"><?php echo $news['date_added']; ?></div>
					<div class="news-descr"><?php echo $news['description']; ?></div>
					<a href="<?php echo $news['view']; ?>" class="read-more-news">&#8674; Читать далее</a>
				</div>
			 <? } else { ?>
				<div class="col-xs-12">
					<div class="news-title"><?php echo $news['title']; ?></div>
					<div class="news-date"><?php echo $news['date_added']; ?></div>
					<div class="news-descr"><?php echo $news['description']; ?></div>
					<a href="<?php echo $news['view']; ?>" class="read-more-news">&#8674; Читать далее</a>
				</div>
			  <? } ?>
			</div>
			</div>
			<?php } ?>
			</div>
	  <div class="row">
        <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
      </div>
	  <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
	</div></div></div>
</div>
<?php echo $footer; ?> 