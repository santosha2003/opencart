<a title="<?=$text_items?>" class="cart" data-toggle="modal" data-target=".bd-example-modal-lg"><img class="table-cell" src="catalog/view/theme/SnowWhite/img/cart.png">
	<div class="count-block">
    <?php if($count){ ?><span class="items-to-cart">
        <?=$count?></span>
    <?php } ?>
	</div>
</a>

<div class="modal bd-example-modal-lg" tabindex="-1" role="dialog" id="cart-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Корзина</h5>
                <button type="button" class="close close-cart-modal" data-dismiss=".bd-example-modal-lg" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <?php if($products): ?>
                    <div class="table-responsive">
                        <table class="table table stripped">
                            <thead>
                                <tr>
                                    <th>Фото</th>
                                    <th>Наименование</th>
                                    <th>Кол-во</th>
                                    <th>Цена</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach($products as $product): ?>
                                    <tr>
                                        <td><img src="<?=$product['thumb'] ?>"></td>
                                        <td><?=$product['name'] ?></td>
                                        <td><?=$product['quantity'] ?></td>
                                        <td><?=$product['price'] ?></td>
                                        <td><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                <?php else: ?>
                    <?=$text_empty?>
                <?php endif; ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn butn butn-modal-cart btn-secondary close-cart-modal" data-dismiss="cart-modal">Продолжить покупки</button>
                <a href="<?=$cart?>" class="btn butn butn-modal-cart btn-primary">
                    <?=$text_cart?></a>
            </div>
        </div>
    </div>
</div>