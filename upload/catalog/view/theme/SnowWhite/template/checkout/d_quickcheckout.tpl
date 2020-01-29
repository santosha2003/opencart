<?php echo $header; ?>
<div class="container" id="container">
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
		<h1 class="col-lg-12">Корзина</h1>
	</div>
	<?php if ($error_warning) { ?>
	<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
		<?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	<?php } ?>
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
			<?php echo $content_top; ?>

			<?php echo $d_quickcheckout; ?>

			<?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>
