
<!-- левая колонка общий блок //aside уже здесь можно откл закоментир. и посмотреть что будет  col-sm-3 подходит по ширине 25% -->
<?php if ($modules) { ?>
<aside id="column-left" class="col-sm-3">
  <?php //echo $route; ?>
   <?php foreach ($modules as $module) { ?>
  <?php echo $module; ?>
  <?php } ?>
</aside>
<?php  } ?>


