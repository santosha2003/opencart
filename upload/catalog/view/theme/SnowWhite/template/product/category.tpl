<?=$header?>

<section class="archive">
	<div class="container category-container">
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
			<?=$column_left?>

			<div class="col-lg-9 col-md-8 catalog-grid">
				<div class="row" style="padding-bottom: 15px;">
					<div class="sort col-lg-8 col-md-12">
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
					<div class="sort pl-15 com-md-4">
						<span class="sort-title">На странице:</span>
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] < 25){ ?>
						<?php } elseif ($limits['value'] == $limit && $limits['value'] < 101) { ?>
						<span class="sort-item sort-active">
							<?php echo $limits['text']; ?></span>
						<?php } elseif($limits['value'] > 100){?>
						<span class="sort-item"><a href="<?php echo $limits['href']; ?>">
								Все</a></span>
						<?php } else{?>
						<span class="sort-item"><a href="<?php echo $limits['href']; ?>">
								<?php echo $limits['text']; ?></a></span>
						<?php } ?>
						<?php } ?>
					</div>
				</div>
				<div class="row catalog-list">
					<?=$content_top?>
					<?php if($products): ?>
					<?php foreach($products as $product): ?>
					<div class="item col-lg-4 col-sm-6">
						<a href="<?php echo $product['href']; ?>" class="item-img"><img src="<?php echo $product['thumb']; ?>"></a>
						<div class="item-title">
							<a href="<?php echo $product['href']; ?>" style="color:#292b31;"><?=$product['name']?></a>
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
							<button class="go-like" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">&#032;</button>
							<?php if($product['stock'] == 'Нет в наличии'): ?>
							<div style="display: inline-block; font-size: 12px; line-height: 33px; padding-top: 0;">Товар закончился</div>
							<?php else: ?>
							<button class="go-cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">В корзину</button>
							<?php endif; ?>
						</div>
					</div>
					<?php endforeach; ?>
					<?php else: ?>
						<p>В этой категории пока нет товаров.</p>
					<?php endif; ?>
				</div>

				<?php echo $pagination; ?>

			</div>
			<?php if($description){ ?>
			<div class="cat-description">
				<?=$description?>
			</div>
			<?php } ?>
		</div>
	</div>
</section>

<?=$footer?>
