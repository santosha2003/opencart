<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<base href="<?=$base?>">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/SnowWhite/css/slick.css" />
	<link rel="stylesheet" href="catalog/view/theme/SnowWhite/css/lightbox.min.css">
	<link rel="stylesheet" href="catalog/view/theme/SnowWhite/style.css">


	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

	<link href="https://fonts.googleapis.com/css?family=Roboto+Slab" rel="stylesheet">

	<title>
		<?=$title?>
	</title>
	<meta name="description" content="<?=$description?>">
	<meta name="keywords" content="<?=$keywords?>">



	<?php foreach($links as $link): ?>
	<link href="<?=$link['href']?>" rel="<?=$link['rel']?>">
	<?php endforeach; ?>

	<?php foreach($styles as $style): ?>
	<link href="<?=$style['href']?>" rel="<?=$style['rel']?>">
	<?php endforeach; ?>

	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>-->
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="catalog/view/theme/SnowWhite/js/common.js"></script>

	<?php foreach($scripts as $script): ?>
	<script type="text/javascript" src="<?=$script?>"></script>
	<?php endforeach; ?>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-139169238-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-139169238-1');
	</script>
	<!-- Yandex.Metrika counter -->
	<script type="text/javascript" >
		(function(m,e,t,r,i,k,a){m[i]=m[i]||function(){(m[i].a=m[i].a||[]).push(arguments)};
				m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a)})
		(window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");

		ym(53358370, "init", {
			clickmap:true,
			trackLinks:true,
			accurateTrackBounce:true,
			webvisor:true
		});
	</script>
	<noscript><div><img src="https://mc.yandex.ru/watch/53358370" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
	<!-- /Yandex.Metrika counter -->
</head>

<body class="<?=$class?><?php if($logged != NULL){echo ' logged';}?>">
	<header>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar col-sm-12 navbar-expand-lg navbar-light bg-white nav-top">
						<div class="not-burger header-line d-inline-flex flex-column flex-md-row justify-content-between">
							<ul class="navbar-nav mr-auto first-navbar collapse navbar-collapse" id="navbarTop">
								<li class="nav-item active">
									<a class="nav-link" href="/galery">Галерея готовых работ <span class="sr-only">(current)</span></a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/articles/">О хобби и творчестве</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/specials">Акции</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="/delivery">Доставка и оплата</a>
								</li>
							</ul>
							<ul class="my-2 my-lg-0 navbar-nav">

								<?php if($logged): ?>
								<li><a class="login nav-item" href="<?=$account?>">
										<?=$text_account?></a></li>
								<?php else: ?>
								<li class="login nav-item"><a href="<?=$login?>">
										<?=$text_login?></a> / <a href="<?=$register?>">
										<?=$text_register?></a></li>
								<?php endif; ?>
								<li class="phone nav-item">
									<?=$telephone?>
								</li>
							</ul>
							<button class="navbar-toggler navbar-fix" type="button" data-toggle="collapse" data-target="#navbarTop" aria-controls="navbarTop" aria-expanded="false" aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
						</div>
					</nav>
					<nav class="navbar col-sm-12 navbar-expand-lg navbar-light bg-white logo-section d-inline-flex justify-content-between">
						<?php if($og_url != $home): ?>
						<a class="navbar-brand" href="<?=$home?>">
							<?php endif; ?>
							<img src="<?=$logo?>">
							<?php if($og_url != $home): ?>
						</a>
						<?php endif; ?>

						<?=$search?>
						<ul class="my-2 my-lg-0 navbar-nav cart-top-ul">
							<li class="addres nav-item">
								<a href="/contact-us/"><?=$address?></a></li>
							<li class="cart-group nav-item">
								<?=$cart?>
								<a title="Избранные товары" href="/wishlist/" class="like"><img src="catalog/view/theme/SnowWhite/img/like.png"></a>
							</li>
						</ul>
					</nav>
					<nav class="navbar col-sm-12 navbar-expand-md navbar-light bg-white nav-3 justify-content-between">
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span> РУБРИКИ
						</button>

						<div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
							<ul class="navbar-nav d-flex justify-content-between full-width">

									<div class="nav-link dropdown">
										<span class="navbar-toggler-icon dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></span>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
											<?php foreach($categories as $category): ?>

											<?php if($category['children']): ?>
											<a class="dropdown-item" href="<?=$category['href'] ?>"><?=$category['name'] ?></a>
												<?php foreach($category['children'] as $child): ?>
													<a class="dropdown-item ml-10" href="<?=$child['href'] ?>"><?=$child['name'] ?></a>
												<?php endforeach; ?>
											<?php else: ?>

											<a class="dropdown-item" href="<?=$category['href'] ?>"><?=$category['name'] ?></a>

											<?php endif; ?>
											<?php endforeach; ?>
										</div>
									</div>
								<?php foreach($categories as $category): ?>

								<?php if($category['children']): ?>
								<a class="nav-link" href="<?=$category['href'] ?>">
									<?=$category['name'] ?></a>
								<?php else: ?>
								<li class="nav-item">
									<a class="nav-link" href="<?=$category['href'] ?>">
										<?=$category['name'] ?></a>
								</li>
								<?php endif; ?>
								<?php endforeach; ?>

							</ul>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>