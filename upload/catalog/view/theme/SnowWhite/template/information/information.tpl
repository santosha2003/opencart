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
			<h1 class="col-md-12">
				<?=$heading_title?>
			</h1>
		
		<div id="content" class="<?php echo $class; ?>">
			<?php echo $description; ?>
		</div>

	</div>
</div>
<?php echo $footer; ?>
