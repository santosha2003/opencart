<?=$header?>
<div class="page-header">
	<div class="container">
		<div class="row">
			<div class="page-prev col-md-12 d-table" style="background-image: url(catalog/view/theme/SnowWhite/img/about.jpg)">
				<div class="page-meta d-table-cell align-middle">
					<div class="page-breadcrumps">
						<?php $i = 0; foreach ($breadcrumbs as $breadcrumb) { ?>
						<?php if($i != count($breadcrumbs) - 1){ ?>
						<span class="bread"><a href="<?php echo $breadcrumb['href']; ?>">
								<?php echo $breadcrumb['text']; ?> </a></span><i> / </i>
						<?php } else { ?>
						<span class="bread current">
							<?php echo $breadcrumb['text']; ?></span>
						<?php } ?>
						<?php $i++; } ?>
					</div>
					<h1 class="page-title">
						<?=$heading_title?>
					</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<?=$description?>
</div>
<?=$footer?>
