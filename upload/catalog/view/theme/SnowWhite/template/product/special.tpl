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
			<h1>
				<?php echo $heading_title; ?>
			</h1>
			<?php if ($products) { ?>
			<div class="row d-flex justify-content-between" style="padding-bottom: 15px;">
				<div class="sort col-md-8">
					<span class="sort-title">Сортировка:</span>

					<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>

					<span class="sort-item sort-active sort-active-up"><a href="<?php echo $sorts['href2']; ?>">
							<?php echo $sorts['text']; ?>
						</a>
					</span>

					<?php } else { ?>

					<span class="sort-item <?php if($_GET['sort'] == $sorts['label']){echo 'sort-active sort-active-down';}?>"><a href="<?php echo $sorts['href']; ?>">
							<?php echo $sorts['text']; ?>
						</a>
					</span>
					<?php } ?>
					<?php } ?>

					<!--<span class="sort-item sort-active sort-active-up"><a href="">Название</a></span>
						<span class="sort-item">Артикул</span>
						<span class="sort-item">Новинки</span>
						<span class="sort-item sort-active-down">Цена</span>-->
				</div>
				<div class="sort com-md-4 pl-15">
					<span class="sort-title">На странице:</span>
					<?php foreach ($limits as $limits) { ?>
					<?php if ($limits['value'] == $limit && $limits['value'] < 51) { ?>
					<span class="sort-item sort-active">
						<?php echo $limits['text']; ?></span>
					<?php } elseif($limits['value'] > 50){?>
					<?php } else{?>
					<span class="sort-item"><a href="<?php echo $limits['href']; ?>">
							<?php echo $limits['text']; ?></a></span>
					<?php } ?>
					<?php } ?>
				</div>
			</div>
			<div class="row">
				<?php foreach ($products as $product) { ?>

				<div class="item col-md-3">
					<a href="<?php echo $product['href']; ?>" class="item-img"><img src="<?php echo $product['thumb']; ?>"></a>
					<div class="item-title">
						<?=$product['name']?>
					</div>
					<?php if($product['sku']): ?>
					<div class="item-meta item-art"><strong style="font-size: 12px;">Артикул:</strong>
						<?=$product['sku']?>
					</div>
					<?php endif; ?>
					<?php if($product['length'] > 0 || $product['width'] > 0 || $product['height'] > 0) { ?>
					<div class="item-meta item-size"><strong style="font-size: 12px;">Размер:</strong>
						<? if($product['length'] != '0.00') echo $product['length'];?>
						<? if($product['width'] != '0.00') echo ' * '.$product['width']; ?>
						<? if($product['height'] != '0.00') echo ' * '.$product['height']; ?> см</div>
					<?php } ?>
					<div class="item-action">
						<div class="item-price">
							<?php if($product['special']): ?>
								<s style="font-size:10px;"><?=$product['price']?></s>
								<?=$product['special']?>
							<?php else: ?>
								<?=$product['price']?>
							<?php endif; ?>
						</div>
						<button class="go-like" onclick="wishlist.add('<?php echo $product_id; ?>');">&#032;</button>
						<?php if($product['stock'] == 'Нет в наличии'): ?>
						<div style="display: inline-block; font-size: 12px; line-height: 33px; padding-top: 0;">Товар закончился</div>
						<?php else: ?>
						<button class="go-cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">В корзину</button>
						<?php endif; ?>
					</div>
				</div>
				<?php } ?>
			</div>
			<!--<div class="row">
				<div class="col-sm-6 text-left">
					<?php echo $pagination; ?>
				</div>
				<div class="col-sm-6 text-right">
					<?php echo $results; ?>
				</div>
			</div>-->
			<?php } else { ?>
			<p>
				<?php echo $text_empty; ?>
			</p>
			<div class="buttons">
				<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary">
						<?php echo $button_continue; ?></a></div>
			</div>
			<?php } ?>
			<?php echo $content_bottom; ?>
		</div>
		<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>
