<h4><?php echo ' '; echo 'Отделы магазина'; //$heading_title; ?></h4>
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?> <!-- cat-wall modified раздел выбран -->
     <ul class="menu-cats1-act"><!--  background:transparent url(http://belosnezhka.ru/catalog/view/theme/default/image/5left.png) repeat-x scroll 0 0;-->
                <li class="caption" style="min-height: 20px">
		  <?php if($category['image']){ ?>
                    <h5> <img src="<?php echo $category['image']; ?>" alt="<?php echo $category['href']; ?>"><a class="list-group-item active"  href="<?php echo $category['href']; ?>"> <?php echo $category['name']; ?></a></h5>
                  <?php } else { ?>
                    <h5><a class="list-group-item active" href="<?php echo $category['href']; ?>"> <?php echo $category['name']; ?></a></h5>
                  <?php } ?>
                </li>
 <!--  </ul> -->
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?> <!-- category_id - child_id выбраны и выделяются синеньким -->
<!-- <i class="fa fa-check-circle-o" aria-hidden="false"></i> -->
     <ul style="border-top:1px solid #949cff;border-radius:18px;border-bottom:1px solid #949cff; text-align:left;"><!--  background:transparent url(http://belosnezhka.ru/catalog/view/theme/default/image/5left.png) repeat-x scroll 0 0;-->
      <li class="caption" style="min-height: 20px">
     <?php // echo $child; ?>
       <a class="list-group-item active" style="border-top:1px solid #949cff;border-bottom:1px solid #949cff;border-radius:18px;" href="<?php echo $child['href']; ?>"> - <?php echo $child['name']; ?></a>
      </li>
     </ul>
  <?php } else { ?>
    <ul  style="list-style:none; border-top:1px solid #949cff;border-bottom:1px solid #949cff;border-radius:18px; text-align:left; background:transparent url(http://belosnezhka.ru/catalog/view/theme/default/image/5left.png) repeat round 0 0;">
     <li class="caption" style="min-height: 20px"> <!-- подкаталог пока не выбран -->

     <a class="list-group-item" style="border-top:1px solid #949cff;border-bottom:1px solid #949cff;border-radius:18px;" href="<?php echo $child['href']; ?>"> <br> <?php echo $child['name']; ?></a>
     </li>
    </ul>
  <?php } ?>
  <?php } ?>
  <?php } ?>
     </ul>
  <?php } else { ?> <!-- не выбранные разделы все -->
     <ul  style="list-style:none; border-top:1px solid #949cff;border-bottom:1px solid #949cff;border-radius:18px; text-align:left; background:transparent url(http://belosnezhka.ru/catalog/view/theme/default/image/5left.png) repeat round 0 0 ;">
                <li class="caption" style="min-height: 20px"> <!--ne wybranij element class="caption" style="text-decoration: none" -->
		  <?php if($category['image']){ ?>
                     <img src="<?php echo $category['image']; ?>" alt="<?php echo $category['href']; ?>"><a class="list-group-item" style="border-top:1px solid #949cff;border-bottom:1px solid #949cff;border-radius:18px;" href="<?php echo $category['href']; ?>"> <?php echo $category['name']; ?></a>
                  <?php } else { ?>
                    <a class="list-group-item" style="border-top:1px solid #949cff;border-radius:18px;border-bottom:1px solid #949cff; text-align:left;" href="<?php echo $category['href']; ?>"> <?php echo $category['name']; ?></a>
                  <?php } ?>
                </li>
  <?php if ($category['children']) { ?>
     <?php //foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $child2)   ?>

  <?php //foreach ($category['children'] as $child2)   ; ?>
    <?php foreach ($category['children'] as $child) { ?>
     <li class="caption" style="min-height: 20px"> <!-- подкаталог пока не выбран -->
       <a class="list-group-item" style="border-top:1px solid #949cff;border-bottom:1px solid #949cff;border-radius:18px;" href="<?php echo $child['href']; ?>"> -> <?php echo $child['name']; ?></a> <!-- в контроллере отключить проверку для выбранного только каталога загружать подкатегории- тогда загрузит все вложеные-->
     </li>
  <?php } ?>
  <?php } ?>
     </ul>
   <?php } ?><!-- хвостик вывода кнопки или линки каталога -->
  <?php } ?><!-- хвостик вывода списка всех и выбранного и остальных каталогов -->
   

