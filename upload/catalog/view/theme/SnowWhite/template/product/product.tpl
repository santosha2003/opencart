<?=$header?>

<section class="item-card">
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
			<?=$content_top?>

			<div class="col-md-7">
				<?php if ($thumb || $images): ?>
					<?php if($images): ?>
						<div class="row" style="position: relative;">
							<div class="slider-navigation col-md-2">
								<div><img class="image-center" src="<?=$thumb?>"></div>
								<?php foreach ($images as $image) { ?>
								<div><img src="<?=$image['thumb']; ?>"></div>
								<?php } ?>
							</div>
							<div class="slider-arr"></div>
							<div class="vertical-slider col-md-10">

								<div>
									<a class="image-link" data-lightbox="image-set" href="<?=$popup; ?>">
										<img tytle="<?=$image_title?>" src="<?=$thumb; ?>">
										<div class="caption">
											<?php if($img_title){
												echo $img_title;
											} else{
												echo $product_name;
											}?>
										</div>
									</a>
								</div>

								<?php foreach ($images as $image) { ?>
								<div>
									<a class="image-link" data-lightbox="image-set" href="<?=$image['popup']; ?>">
										<img tytle="<?=$image["image_description"]["title"]?>" src="<?=$image['popup']; ?>">
										<div class="caption">
											<?=$image["image_description"]["title"]?>
										</div>
									</a>
								</div>
								<?php } ?>
							</div>
						</div>
					<?php else: ?>
						<div class="row">
							<a class="image-link mb-20" data-lightbox="image-set" href="<?=$popup; ?>">
								<img class="image-center" src="<?=$thumb?>">
							</a>
						</div>
					<?php endif; ?>
				<?php else: ?>
					<div class="row">
						<img class="image-center" src="image/no_photo.jpg">
					</div>
				<?php endif; ?>
			</div>
			<div class="col-md-5 card-desc">
				<h1>
					<?=$product_name?>
				</h1>
				<div class="rating">
					<p>
						<?php for ($i = 1; $i <= 5; $i++) { ?>
						<?php if ($rating >= $i) { ?>
						<span class="fa fa-stack"><i class="fas fa-star"></i></span>
						<?php } else { ?>
						<span class="fa fa-stack"><i class="far fa-star"></i></span>
						<?php } ?>
						<?php } ?>
						<span class="rating-int"><?=$rating?></span>
				</div>
				<div class="card-meta">
					<?php if($sku): ?>
					<p><span>Артикул:</span>
						<?=$sku ?>
					</p>
					<?php endif; ?>
					<?php if($length > 0 || $width > 0 || $height > 0) { ?>
					<p><span>Размер:</span>
						<? if($length != '0.00') echo $length;?>
						<? if($width != '0.00') echo ' * '.$width; ?>
						<? if($height != '0.00') echo ' * '.$height; ?> см</p>
					<?php } ?>
					<div class="status <?php if($stock == 'Нет в наличии'){echo 'status-bad bg-gray';} ?>">
						<?=$stock?>
					</div>
				</div>
				<div class="price-line">
					<span class="price">
						<?php if($special): ?>
						<s style="font-size:10px;"><?=$price?></s>
						<?=$special?>
						<?php else: ?>
						<?=$price?>
						<?php endif; ?>
					<div class="amount">
						<span class="down">-</span>
						<input type="text" id="quantity" value="1" />
						<span class="up">+</span>
					</div>
						<?php if($stock == 'Нет в наличии'): ?>
						<div style="font-size: 16px; width: 214px; text-align: center;">Товар закончился</div>
						<?php else: ?>
						<button class="butn to-cart" onclick="cart.add('<?=$product_id?>', request_quantity())">В корзину</button>
						<?php endif; ?>
				</div>
				<button class="like-btn" onclick="wishlist.add('<?php echo $product_id; ?>');">Добавить в избранное</button>
				<div class="repost">
					Поделиться с друзьями:
					<a target="_top" href="https://vk.com/share.php?url=<?php echo $_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']; ?>" class="repost-link"><img src="catalog/view/theme/SnowWhite/img/vk1.png"></a>
					<a target="_top" href="https://www.facebook.com/sharer/sharer.php?u=<?php echo $_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']; ?>" class="repost-link"><img src="catalog/view/theme/SnowWhite/img/fb1.png"></a>
					<a target="_top" href="https://connect.ok.ru/offer?url=<?php echo $_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI']; ?>" class="repost-link"><img src="catalog/view/theme/SnowWhite/img/ok1.png" height="16"></a>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="item-haract">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<div class="complect">
					<?=$description?>
				</div>
				<?php if($attribute_groups): ?>

				<div class="haract">
					<h2>Характеристики:</h2>
					<table class="table table-striped">
						<tbody>
							<?php foreach ($attribute_groups as $attribute_group) { ?>
							<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<tr>
								<th scope="row">
									<?=$attribute['name'] ?>
								</th>
								<td>
									<?=$attribute['text'] ?>
								</td>
							</tr>
							<?php } ?>
							<?php } ?>

						</tbody>
					</table>
				</div>
				<?php endif; ?>
			</div>
			<div class="col-md-5">
				<?php if($ext_description): ?>
				<div class="desc-3">
					<?php echo $ext_description; ?> 
				</div>
				<?php endif; ?>
				<div class="tags">
					<p>
						<?php foreach($tags as $tag): ?>
						<a href="<?=$tag['href']?>"><span <?php if(rand() % 3 == 0){
							echo 'class="w1"';
						} ?>><?=$tag['tag']?></span></a>
						<?php endforeach; ?>
                    </p>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="rewiev">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<div class="rew-header">

					<!-- REVIEWS -->



					<?php if ($review_status) { ?>
					<?php } ?>
					<!-- ///////////////////////////// -->
					
					<div class="row">
						<h2>Отзывы: <?=intval($reviews); ?></h2>
						<button data-toggle="collapse" data-target="#tab-review" class="butn add-comment">Добавить отзыв</button>
						<?php if ($review_status) { ?>
						<div class="tab-pane collapse" id="tab-review">
							<form class="form-horizontal" id="form-review">
								<h2>
									<?php echo $text_write; ?>
								</h2>
								<?php if ($review_guest) { ?>
								<div class="form-group required">
									<div class="col-sm-12">
										<label class="control-label" for="input-name">
											<?php echo $entry_name; ?></label>
										<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
									</div>
								</div>
								<div class="form-group required">
									<div class="col-sm-12">
										<label class="control-label" for="input-review">
											<?php echo $entry_review; ?></label>
										<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
										<div class="help-block">
											<?php echo $text_note; ?>
										</div>
									</div>
								</div>
								<div class="form-group required">
									<div class="col-sm-12">
										<label class="control-label">
											<?php echo $entry_rating; ?></label>
										&nbsp;&nbsp;&nbsp;
										<?php echo $entry_bad; ?>&nbsp;
										<input type="radio" name="rating" value="1" />
										&nbsp;
										<input type="radio" name="rating" value="2" />
										&nbsp;
										<input type="radio" name="rating" value="3" />
										&nbsp;
										<input type="radio" name="rating" value="4" />
										&nbsp;
										<input type="radio" name="rating" value="5" />
										&nbsp;
										<?php echo $entry_good; ?>
									</div>
								</div>
								<?php echo $captcha; ?>
								<div id="review-alert"></div>
								<div class="buttons clearfix">
									<div class="pull-right">
										<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">
											<?php echo $button_continue; ?></button>
									</div>
								</div>
								<?php } else { ?>
								<?php echo $text_login; ?>
								<?php } ?>
							</form>
						</div>
						<?php } ?>
					</div>
				</div>
				<div class="rew-container" id="review"></div>
			</div>
		</div>
	</div>
</section>



<?php if ($products) { ?>
<div class="container">
<h3><?php echo $text_related; ?></h3>
<div class="row">
	<?php foreach ($products as $product) { ?>



	<div class="item col-md-3">
		<a href="<?php echo $product['href']; ?>" class="item-img"><img src="<?php echo $product['thumb']; ?>"></a>
		<div class="item-title"><?php echo $product['name']; ?></div>

		<?php if($product['sku']): ?>
		<div class="item-meta item-art"><strong style="font-size: 12px;">Артикул:</strong> <?=$product['sku'] ?></div>

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
			<button class="go-cart" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">В корзину</button>
		</div>
	</div>




	<?php } ?>
</div>
</div>
<?php } ?>



</script>
<script type="text/javascript">
	<!--
	$('#review').delegate('.pagination a', 'click', function(e) {
		e.preventDefault();

		$('#review').fadeOut('slow');

		$('#review').load(this.href);

		$('#review').fadeIn('slow');
	});

	$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

	$('#button-review').on('click', function() {
		$.ajax({
			url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $("#form-review").serialize(),
			beforeSend: function() {
				$('#button-review').button('loading');
			},
			complete: function() {
				$('#button-review').button('reset');
			},
			success: function(json) {
				$('.alert-success, .alert-danger').remove();

				if (json['error']) {
					$('#review-alert').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}

				if (json['success']) {
					$('#review-alert').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').prop('checked', false);
				}
			}
		});
		grecaptcha.reset();
	});

</script>

<?=$footer?>
