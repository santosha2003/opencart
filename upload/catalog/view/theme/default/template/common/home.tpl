<?php echo $header; ?>
<br>
<br>
<div id="container" class="col-sm-12"> <!-- col-sm-12 style=width: 100%; float: left; position: relative; min-height: 1px; padding-right: 15px;padding-left: 15px; -->
 <div class="row" style="margin-top: 10px; margin-left: 10px" > <!--; float: left; display: block"> -->
  <ul class="breadcrumb" style="float: left; left: 0;"> <!-- style="float: left; display: block" -->
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
 </div>

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { //автоподбор ширины - есть ли боковые кол. ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } // class col-sm-9 - left panel visible; ?>

  <!--  <a вкл aside и col-sm-3 120 пикселей в стиле шир. 1/4 25%  СМОТРЕТЬ vqmod он вызвает модули из system как рабочие -->
 <!-- левая колонка на каждой странице может по разному настраиваться.. часть шаблона товара и категорий в системном каталоге -->
 <!--    <aside id="column-left" class="col-sm-3"> style width: 25%; float: left; вкл в лев колонке уже -->
  <!-- eto wrode levaja  ... home -->
<div class="containbody" style="display: block" > <?php echo $column_left; // echo $class;width: 25%; float: left  style="margin-top: 10px,margin-left: 0px ?> 
 <!--    </aside>  -->
  <div id="content" class="<?php echo $class; ?>">
<?php if ($modules) { ?>
  <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
<?php } ?>
    <?php echo $content_top; ?>
  </div>
    <?php echo $content_bottom; ?>
  <div>
    <?php echo $column_right; ?>
  </div>
</div>

     <hr>
<?php echo $footer; ?>

