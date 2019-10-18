<?php if($tagcloud) { ?>
    <?php foreach($tagcloud as $tag): ?>
    <a href="<?=$tag['href']?>">
        <span <?php if(rand() % 3 == 0){ echo 'class="w1"';} ?>><?=$tag['name']?></span>
    </a>
    <?php endforeach; ?>
<?php } ?>
