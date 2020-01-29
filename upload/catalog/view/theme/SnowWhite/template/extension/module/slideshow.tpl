<div class="col-lg-9 col-md-12">
    <div class="top-slider">

        <?php foreach($banners as $banner): ?>

        <div style="position: relative;">
            <?php if($banner['link']): ?>
            <a href="<?=$banner['link']?>">
                <?php endif; ?>
                <img src="<?=$banner['image']?>">
                <?php if($banner['link']): ?>
            </a>
            <?php endif; ?>
            <div class="slide__caption">
                <?=$banner['title']?>
            </div>
        </div>

        <?php endforeach; ?>
    </div>

    <div class="slider-nav hidden-md-down">
        <div class="row">
            <div class="col-md-6 dots"></div>
            <div class="col-md-6 arrows"></div>
        </div>
    </div>
</div>
