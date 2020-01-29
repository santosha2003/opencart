<div id="confirm_view" class="col-md-12 pl-0 qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
<script type="text/html" id="confirm_template">
<div id="confirm_wrap">
	<div class="panel panel-default">
		<div class="panel-body pl-0 pt-0">
			<form id="confirm_form" class="form-horizontal">
			</form>
			
			<button id="qc_confirm_order" class="" <%= model.show_confirm ? '' : 'disabled="disabled"' %>><% if(Number(model.payment_popup)) { %><?php //echo $button_continue; ?>Оформить заказ<% }else{ %><?php //echo $button_confirm; ?><% } %></span></button>

		</div>
	</div>
</div>
</script>
<script>

$(function() {
	qc.confirm = $.extend(true, {}, new qc.Confirm(<?php echo $json; ?>));
	qc.confirmView = $.extend(true, {}, new qc.ConfirmView({
		el:$("#confirm_view"), 
		model: qc.confirm, 
		template: _.template($("#confirm_template").html())
	}));
});

</script>