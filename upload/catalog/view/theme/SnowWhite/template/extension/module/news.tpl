<section class="news">
        <div class="container">
            <div class="row">
                <h3><?php echo $heading_title; ?></h3>
				<?php foreach ($news as $news_item) { ?>
                <div class="news-item col-md-4">
                    <div class="row">
                        <div class="col-md-5">
							<?php if($news_item['thumb']) { ?>
								<img class="news-img" src="<?php echo $news_item['thumb']; ?>">
							<?php } ?>
                        </div>
                        <div class="col-md-7 news-text">
                            <div class="news-date"><?php echo $news_item['posted']; ?></div>
                            <a class="article-title"><?php echo $news_item['title']; ?></a>
                            <p class="news-text"><?php echo $news_item['description']; ?></p>
                            <a href="<?php echo $news_item['href']; ?>" class="read-more">Читать далее</a>
                        </div>
                    </div>
                </div>
                <?php } ?>
                <div class="col-md-12" style="text-align: center;"><a href="/index.php?route=information/news" class="read-all butn">Читать все</a></div>
            </div>
        </div>
    </section>