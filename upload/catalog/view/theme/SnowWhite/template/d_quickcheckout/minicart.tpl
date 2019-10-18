<?php if($products): ?>
<div class="table-responsive">
    <table class="table table stripped">
        <thead>
        <tr>
            <th>Фото</th>
            <th>Наименование</th>
            <th>Кол-во</th>
            <th>Цена</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach($products as $product): ?>
        <tr>
            <td><img src="<?=$product['thumb'] ?>"></td>
            <td><?=$product['name'] ?></td>
            <td><?=$product['quantity'] ?></td>
            <td><?=$product['price'] ?></td>
        </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
    <!--<div class="total_popup dostavka-popup" style="padding-left: 8px;">Стоимость доставки: <?=$totals[count($totals) - 2]['text']?></div>-->
    <?php foreach($totals as $totals_item):?>
        <div class="total_popup itog-popup" style="padding-left: 8px;"><?=$totals_item['title']?>: <?=$totals_item['text']?></div>
    <?php endforeach; ?>
</div>
<?php else: ?>
<?=$text_empty?>
<?php endif; ?>