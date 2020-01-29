<section class="trends">
        <div class="container">
            <div class="row">
                <h3>Хиты продаж</h3>
                <?php foreach ($products as $product): ?>
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
                <?php endforeach; ?>
            </div>
        </div>
    </section>