<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo 'наборы живописи по номерам, скрапбукинг, алмазная мозаика и вышивка Белоснежка'; // $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo 'Белоснежка, алмазная вышивка, картины по номерам, раскраски по цифрам, алмазная живопись, живопись по номерам, скрапбукинг'; //$keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php //echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<!-- верх маленькие иконки значки линейка -->
<nav id="top">
<!--  <span id="nav-top" class="list-inline"> --> <!--nav navbar-nav -->
    <?php // echo $currency; ?>
    <?php // echo $language; ?>
<!--    <div id="top-links" class="list-inline"> -->
<!--    </div> -->
    <div id="top-links" class="list-inline">
      <ul class="nav navbar-nav" style="float: left">
        <?php if ($informations) { // nav navbar-nav добавлены 3 пункта с подвала наверх и добавлен блок информации в контроллер ?>
         <!--<span class="caret"></span> -->
            <?php foreach ($informations as $information) { // только раскрывать меню по клику -  class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true" ?>
        <li> <a  title="<?php echo $text_information; ?>" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>

          <ul class="nav navbar-nav" style="float: right"> <!-- class="dropdown-menu dropdown-menu-right" -->
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
           <li><a href="<?php echo $contact; ?>"><?php echo "Телефон";//echo $telephone; ?></a></li>
            <!-- <li><a href="<?php //echo $register; ?>"><?php //echo $text_register; ?></a></li> -->
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
            <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
            <!-- <li><a href="<?php echo $checkout; ?>" title="<?php //echo $text_checkout; ?>"><?php //echo $text_checkout; ?></a></li> -->
      </ul>
        <!-- <i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"></span></a></li>  <i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"></span></a></li>        <i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"></span></a></li> <i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"></span> -->
    </div>
  <!-- </span> -->
</nav>
<header>
  <div ><!-- большой картинка на всю экрану class="containbody" "display:block; padding-right: 10px; height: 280px;"-->
    <div class="container" style=" padding-left: 10px; maggin-right: 5px; margin-top: 5px; margin-bottom: 15px; margin-left: 5px; background: url(background_blue.gif) repeat-x;">
          <?php if ($logo) { ?>   <!-- class="img-responsive" width height auto -->
          <a href="<?php echo $home; ?>"><img class="row" src="<?php echo $logo; ?>" width="75%" align="center" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" style="border: none"> </a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } //logo as banner big picture ?>
    </div>
  </div>
<!-- <a header use twitter bootstrap3 </a>  -->
  <div id="menu" class="containbody">
  <nav id="bottom">
<?php if ($categories) { //menu srazu pod bolshim logotipom kartinkoj ?>
<!-- <div class="container"> -->
<!--    <nav id="menu" class="navbar"> <a> вкл это и поиск с корзиной опускаются ниже кнопок  </a> -->
    <div class="navbar-header">
     <span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <span class="caret"></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" aria-expanded="true" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
<!--     <div class="collapse navbar-collapse navbar-ex1-collapse"> -->
      <ul class="nav navbar-nav">
        <?php //GLOBAL $cat1; $cat1=$categories;  //print_r ($categories); ?>
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>

        <li class="dropdown"><a href="<?php echo 'http://belosnezhka.ru/shop/vyshivanie-kanva-aida-14'; //echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" aria-expanded="true"><?php echo 'Вся продукция'; //echo $category['name']; ?></a>
          <div class="dropdown-menu" style="min-width: 400px; font-size: 16px">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-group-item"><!-- list-unstyled -->
                <?php foreach ($children as $child) { ?>
                <!-- <li><a href="<?php //echo $child['href']; ?>"><?php //echo $child['name']; ?></a></li> -->
<!--///////// Level 1--> 
           <li style="padding: 6px 7px 5px 8px; background: url(http://belosnezhka.ru/catalog/view/theme/default/image/3.png) repeat-x 0 0;"><!-- display: block;  --><a href="<?php echo $child['href']; ?>"> 
             <?php if ($child['image']) { ?>
             <img src="<?php echo $child['image']; ?>" >
             <?php } //echo $child['image']; ?>
             <?php echo $child['name']; ?>
           </a></li>
 <?php if ($child['subchildren']) { ?>
<!--///////// Level 2--> 
 <?php foreach ($child['subchildren'] as $subchild) { ?>
   <li style="padding-left: 8px;"><a href="<?php echo $subchild['href']; ?>"><img src="<?php if($subchild['image']) { echo $subchild['image']; } ?>"><?php echo $subchild['name']; ?></a></li>
  <?php } ?>
  <?php } ?>
<!--///////// xvost 2 -->
                <?php } //child ?>
               </ul>
             <?php } // all children ?>
            </div>
<!--///////// xvost 1 -->
<!-- 2 колонка раскрывается вниз -->
            <a href="<?php echo 'http://belosnezhka.ru/index.php?route=blog/blog'; //echo $category['href']; ?>" class="see-all"><?php //echo $text_all; ?> <?php //echo 'Вышивка'; //echo $category['name']; ?></a>
        <li class="nav navbar-nav"><a href="<?php echo 'http://belosnezhka.ru/index.php?route=blog/blog'; //echo $category['href']; ?>" class="nav navbar-nav" ><?php echo 'О хобби и творчестве'; //echo $category['name']; ?></a>
            <!-- <a href="<?php echo 'http://belosnezhka.ru/shop/xolst-4050-sm'; //echo $category['href']; ?>" class="see-all"><?php //echo $text_all; ?> <?php //echo 'Картины раскраски 40x50' //echo $category['name']; ?></a> -->
          </div>
        </li>

          </div>
        </li>
        <?php } else { ?>
        <!-- <li><a href="<?php //echo $category['href']; ?>"><?php //echo $category['name']; ?></a></li> -->
        <?php } ?>
        <?php } ?>
      </ul>
<!--    </div> -->
<!--   </nav> <a> вкл это и поиск с корзиной опускаются ниже кнопок  </a> -->
  </nav>
<?php } ?>  <!-- menu xwost -->
  </div>
<div class="container" style="padding: 8px 9px 5px 8px;">
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?>
      </div>
</div>
</header>
