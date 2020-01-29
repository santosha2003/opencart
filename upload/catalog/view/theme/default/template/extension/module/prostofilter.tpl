<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="list-group">
    <?php foreach ($prostofilter_groups as $prostofilter_group) { ?>
	<?php $kolvo = 0; ?>
    <a class="list-group-item"><?php echo $prostofilter_group['name']; ?></a>
    <div class="list-group-item">
      <div id="prostofilter-group<?php echo $prostofilter_group['prostofilter_group_id']; ?>">
        <?php foreach ($prostofilter_group['prostofilter'] as $prostofilter) { ?>
		<?php if ($prostofilter_group['prostofilter_group_id'] == 'price') {
				$minprice = $prostofilter['name'] -1;
				$maxprice = $prostofilter['prostofilter_id'] + 1;
				foreach ($prostofilter_category as $priceprostofilter) {
					if (substr($priceprostofilter,0,8) == 'minprice') {
						$minprice = str_replace('[','',str_replace(']','',substr($priceprostofilter,8,10)));
					}
					if (substr($priceprostofilter,0,8) == 'maxprice') {
						$maxprice = str_replace('[','',str_replace(']','',substr($priceprostofilter,8,10)));
					}
				}
				echo '<input id="ex2" type="text" class="span2" value="" data-slider-min="' . $prostofilter['name'] . '" data-slider-max="' . $prostofilter['prostofilter_id'] . '" data-slider-step="5" data-slider-value="[' . $minprice . ',' . $maxprice . ']"/>';
			}
			else {
				$kolvo++;
				if ($kolvo == 7) {
					echo '<a href="colfil' . $prostofilter_group['prostofilter_group_id'] . '" data-toggle="collapse">Показать еще</a>';
					echo '<div id="colfil' . $prostofilter_group['prostofilter_group_id'] . '" class="collapse">';
				}
				echo '<div class="checkbox">';
				echo '<label for="' . $prostofilter['prostofilter_id'] . '">';
				if (in_array($prostofilter['prostofilter_id'], $prostofilter_category)) {
					echo '<input id="' . $prostofilter['prostofilter_id'] . '" class="red" type="checkbox" name="prostofilter[]" value="' . $prostofilter['prostofilter_id'] . '" checked="checked" />';
				}
				else {
					echo '<input id="' . $prostofilter['prostofilter_id'] . '" class="red" type="checkbox" name="prostofilter[]" value="' . $prostofilter['prostofilter_id'] . '" />';
				}
				echo $prostofilter['name'];
				echo '</label></div>';
			}
		?>
        <?php } ?>
		<?php if ($kolvo>6) { echo '</div>';} ?>
      </div>
    </div>
    <?php } ?>
  </div>
  <div class="panel-footer text-right">
    <button type="button" id="button-prostofilter" class="btn btn-primary"><?php echo $button_filter; ?></button>
  </div>
</div>
<script type="text/javascript"><!--
$( document ).ready(function() {
	$('input[name^=\'prostofilter\']:checked').each(function(element) {
		$movingel = $(this).parent().parent();
		if ($movingel.parent().parent().hasClass('collapse')) {
			$movingel.prependTo($movingel.parent().parent().parent());
		}
		else {
			$movingel.prependTo($movingel.parent().parent());
		}
	});
});
$('#button-prostofilter').on('click', function() {
	prostofilter = [];

	$('input[name^=\'prostofilter\']:checked').each(function(element) {
		prostofilter.push(this.value);
	});
	if (document.getElementById('ex2') != null) {
		prostofilter.push('minprice[' + slider.getValue()[0] + ']');
		prostofilter.push('maxprice[' + slider.getValue()[1] + ']');
	}
	location = '<?php echo $action; ?>&filter=' + prostofilter.join(',');
});
if (document.getElementById('ex2') != null) {
	var slider = new Slider('#ex2', {});
}
//--></script> 
