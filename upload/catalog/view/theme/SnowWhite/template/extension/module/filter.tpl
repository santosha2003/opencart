<div class="panel panel-default filter-show">
	<div class="list-group">
		<?php foreach ($filter_groups as $filter_group) { ?>
		<div class="filter-container">
			<a class="list-group-item">
				<?php echo $filter_group['name']; ?></a>
			<div class="list-group-item">
				<div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
					<?php foreach ($filter_group['filter'] as $filter) { ?>
					<div class="checkbox-box">
						<?php if (in_array($filter['filter_id'], $filter_category)) { ?>
						<input class="checkbox" type="checkbox" name="filter[]" id="filter<?=$filter['filter_id']?>" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
						<?php } else { ?>
						<input class="checkbox" type="checkbox" id="filter<?=$filter['filter_id']?>" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
						<?php } ?>
						<label for="filter<?=$filter['filter_id']?>">
							<?php echo $filter['name']; ?></label>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
		<?php } ?>
	</div>
	<div class="panel-footer text-right filter-buttons">
		<button type="button" id="button-filter" class="btn btn-primary filtering">
			Фильтровать</button>
		<button type="button" id="button-filter-reset" class="btn btn-primary unfilter">
			Сбросить</button>
	</div>
</div>
<div class="butn filter-show-btn text-center">Открыть фильтр</div>
<script type="text/javascript">
	<!--
	$('#button-filter').on('click', function() {
		filter = [];

		$('input[name^=\'filter\']:checked').each(function(element) {
			filter.push(this.value);
		});

		location = '<?php echo $action; ?>&filter=' + filter.join(',');
	});
	$('#button-filter-reset').on('click', function() {
		location = '<?=$action; ?>';
	});
	//-->

</script>
