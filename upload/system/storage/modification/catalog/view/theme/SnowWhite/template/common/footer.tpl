<?php echo $footer_new; ?>
    <footer>
        <div class="container">
            <div class="row">
                <div class="footer-info col-md-3 col-sm-6">
                    <img src="/image/catalog/logo.png" class="img-fluid">
                    <div class="social"> <span class="social-text">Мы в соц.сетях</span>
			<div>
                        <a target="_blank" href="https://www.instagram.com/belosnezhka_tm/" class="ig"><img src="catalog/view/theme/SnowWhite/img/instagram.svg"></a>
                        <a target="_blank" href="https://vk.com/club56235121" class="vk"><img src="catalog/view/theme/SnowWhite/img/vk.png"></a>
                        <a target="_blank" href="https://www.facebook.com/Homeartsru-133369520174884/" class="fb"><img src="catalog/view/theme/SnowWhite/img/facebook-logo.png"></a>
                        <a target="_blank" href="https://ok.ru/group/54341480873996" class="ig"><img src="catalog/view/theme/SnowWhite/img/ok.png"></a>
                        <a target="_blank" href="https://www.youtube.com/channel/UCoIATATaUzt2SYxWAehwE0Q/videos" class="ig"><img src="catalog/view/theme/SnowWhite/img/YT_logo.jpg"></a>
                        </div>
                    </div>
                    <div class="copy">
                        Копирайт. Все права защищены<br>
						Разработка сайта - <a href="http://softmg.ru" target="_blank">Soft Media Group</a>
                    </div>
                </div>
				<div class="footer-menu col-md-3 col-sm-6">
                    <div class="footer-menu-title">О компании
                    </div>
                    <nav class="nav flex-column">
             			<a class="nav-link active" href="/about_us">О нас</a>
						<a class="nav-link active" href="/contact-us">Контакты</a>
						<a class="nav-link active" href="/wholesale">Оптовым покупателям</a>
						<a class="nav-link active" href="/index.php?route=information/news">Новости</a>
                    </nav>
                </div>
                <div class="footer-menu col-md-3 col-sm-6">
                    <div class="footer-menu-title">Мой аккаунт
                    </div>
                    <nav class="nav flex-column">
                        <a class="nav-link" href="/my-account">Личный кабинет</a>
                        <a class="nav-link" href="/cart">Корзина</a>
                        <a class="nav-link" href="/contact-us">Обратная связь</a>
                    </nav>
                </div>
                <div class="footer-menu col-md-3 col-sm-6">
                    <div class="footer-menu-title"><?=$text_information?>
                    </div>
                    <nav class="nav flex-column">
                        <?php foreach ($informations as $information) { ?>
				
						  <a class="nav-link" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
						
						  <?php } ?>
						
                    </nav>
                </div>
            </div>
        </div>
    </footer>

<!-- Optional JavaScript -->
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

    <script type="text/javascript" src="catalog/view/theme/SnowWhite/js/slick.js"></script>
    <script type="text/javascript" src="catalog/view/theme/SnowWhite/js/main.js"></script>
	<script type="text/javascript" src="catalog/view/theme/SnowWhite/js/lightbox.js"></script>

 <!--LiveInternet counter--><script type="text/javascript">
     document.write("<a href='//www.liveinternet.ru/click' "+
         "target=_blank><img src='//counter.yadro.ru/hit?t44.11;r"+
         escape(document.referrer)+((typeof(screen)=="undefined")?"":
             ";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
             screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
         ";h"+escape(document.title.substring(0,150))+";"+Math.random()+
         "' alt='' title='LiveInternet' "+
         "border='0' width='31' height='31'><\/a>")
 </script><!--/LiveInternet-->
	

				<?php if ($loadmore_status) {?>
					<style>
						a.load_more {
							<?php if (isset($loadmore_style)) {echo $loadmore_style;} else {?>
								display:inline-block; margin:0 auto 20px auto; padding: 0.5em 2em; border: 1px solid #000; color: #000;  text-decoration:none; text-transform:uppercase;
							<?php } ?>
						}
					</style>		
					<div id="load_more" style="display:none;">
						<div class="row text-center">
							<a href="#" class="load_more"><?php echo $loadmore_button; ?></a>
						</div>
					</div>
				<?php } ?>
            

				<?php if ($loadmore_arrow_status) {?>
					<a id="arrow_top" style="display:none;" onclick="scroll_to_top();"></a>
				<?php } ?>
            
</body>

</html>