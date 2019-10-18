<?=$header?>

    <section class="top-section">
    <div class="container">
        <div class="row" style="padding-right:15px;">
            
<?=$content_top?>

        </div>
    </div>
</section>
    <?=$content_bottom?>
    <section class="articles">
        <div class="container">
            <div class="row">
                <h3>Статьи</h3>
				<?php foreach ($articles as $article): ?>
                <div class="article-item col-md-4">
                    <div class="row">
                        <img src="<?=$article['original']?>">
                        <a class="article-title"><?=$article['name']?></a>
                        <a href="<?=$article['href']?>" class="read-more">Читать далее</a>
                    </div>
                </div>
				<?php endforeach; ?>
                <div class="col-md-12" style="text-align: center;"><a href="/articles/" class="read-all butn">Читать все</a></div>
            </div>
        </div>
    </section>
    <section class="tags">
        <div class="container">
            <div class="row">
                <p><?=$column_right?></p>
            </div>
        </div>
    </section>
   
<?=$footer?>