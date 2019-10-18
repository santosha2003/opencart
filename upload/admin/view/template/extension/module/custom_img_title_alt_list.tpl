<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $setting; ?>" data-toggle="tooltip" title="<?php echo $button_setting; ?>" class="btn btn-primary"><i class="fa fa-cog"></i></a>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
	  </div>
      <h1><i class="fa fa-picture-o fa-fw"></i> <?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><?php echo $text_view; ?></h3>
      </div>
      <div class="panel-body">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"></td>
                  <td class="text-center"style="width:60px"><?php echo $column_image; ?></td>
                  <td class="text-center" style="width:25%"><?php echo $column_name; ?></td>
                  <td class="text-left">ALT</td>
                  <td class="text-left">Title</td>
				</tr>
			  </thead>
			  <tbody>
                <tr>
                  <td style="width: 1px;" class="text-center"></td>
                  <td class="text-center"></td>
                  <td class="text-center"><input name="filter_name" class="form-control" type="text" value="<?php echo $filter_name; ?>"/></td>
                  <td class="text-right" colspan="2"><button data-toggle="tooltip" title="<?php echo $button_filter; ?>" type="button" onclick="filter()" class="btn btn-primary"><i class="fa fa-filter"></i></button></td>
				</tr>
			  </tbody>
              <tbody>
                <?php if ($products) { ?>
                <?php foreach ($products as $product_id=>$product) { ?>
                <tr>
                  <td style="width: 1px;" class="text-center"><?php echo $product_id; ?></td>
                  <td class="text-center"><img src="<?php echo $product['image']; ?>" alt="" /></td>
                  <td class="text-left"><a href="<?php echo $product['href']; ?>" target="_blank"><i class="fa fa-eye"></i> <?php echo $product['name']; ?></a></td>
                  <td class="text-left">
				  <?php foreach ($product['alt'] as $language_id=>$alt) { ?>
	<div class="form-group" data-product_id="<?php echo $product_id; ?>" data-language_id="<?php echo $language_id; ?>" data-field="alt">
		<div class="input-group editCell">
			<span class="input-group-addon"><img src="language/<?php echo $languages[$language_id]['code'];?>/<?php echo $languages[$language_id]['code'];?>.png" /></span>
			<span class="input-group-addon editDiv form-control" style="text-align:left;"><?php echo $alt; ?></span>
		</div>
	</div>				  
				  <?php } ?>
				  </td>
                  <td class="text-left">
				  <?php foreach ($product['title'] as $language_id=>$title) { ?>
	<div class="form-group" data-product_id="<?php echo $product_id; ?>" data-language_id="<?php echo $language_id; ?>" data-field="title">
		<div class="input-group editCell">
			<span class="input-group-addon"><img src="language/<?php echo $languages[$language_id]['code'];?>/<?php echo $languages[$language_id]['code'];?>.png" /></span>
			<span class="input-group-addon editDiv form-control" style="text-align:left;"><?php echo $title; ?></span>
		</div>
	</div>				  
				  <?php } ?>
				  </td>
				</tr>
				<?php }?>
				<?php } else { ?>
                <tr>
				<td colspan="5">Empty</td>
				</tr>
					
				<?php } ?>
			  </tbody>
			</table>
	      </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
		  
      </div>
    </div>
  </div>
</div>
<script>
$(document).ready(function() {
	$('[data-product_id]').on('click', '.editCell', function(){
		var $editDiv = $(this).find('.editDiv');
		if ( $editDiv.is(':visible') ) {
			$('.editTextArea').remove(); 	
			$('.editDiv').show();	
			var text = $(this).text();
			$textarea = $('<textarea name="editing" class="editTextArea">'+text.trim()+'</textarea>');
			var patern = '<span class="patern"><br><?php echo $text_patern; ?></span>';
	        $(this).append($textarea);
	        $(this).append(patern);
	        $editDiv.hide();
	        showCtrls($textarea);
			$textarea.focus();
        }
	});

    $('body').on('click', '#ctrls_holder a', function(e) {
        e.preventDefault();
        if ($(this).hasClass('cancelEdit')) {
        	$(this).closest('td').find('.editDiv').show();
            $('#ctrls_holder').remove();
            $('.editTextArea').remove();
			$('.patern').remove();
        }
        
        if ($(this).hasClass('saveEdit')) {
        	$(this).addClass('link-disabled').blur().html('<i class="fa fa-spinner fa-spin">&nbsp;</i>');
        	saveValue($('.editTextArea'));
        }
    });

	$('[data-product_id]').on('keyup', '.editTextArea', function(e) {
		if ((e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey) {
			$('.saveEdit').trigger('click');
		}
		if( e.which === 27 ){
			$('.cancelEdit').click();
		}
	});

});

function saveValue($textarea) {
	var clos = $textarea.closest('[data-product_id]');
  	var params = {
   		product_id : clos.attr('data-product_id'),
		language_id : clos.attr('data-language_id'),
		field : clos.attr('data-field'),
   		value : $textarea.val()
   	}
	var $editDiv = clos.find('.editDiv');
   	$.ajax({
		url:'index.php?route=extension/module/custom_img_title_alt/save&token=<?php echo $token; ?>',
		method:'POST',
		data: params,
		success : function(html) {
			$('#ctrls_holder').remove();
            $('.editTextArea').remove();
            $('.patern').remove();
			$editDiv.show();
			$editDiv.text(params.value);
		}
	});
}

function showCtrls($textarea) {
	$('#ctrls_holder').remove();
	var $ctrls = $('<div id="ctrls_holder"></div>')
	var $ctrlOk = $('<a href="#" class="saveEdit btn btn-primary btn-xs"><i class="fa fa-check"></i></a>');
	var $ctrlCancel = $('<a href="#" class="cancelEdit btn btn-default btn-xs"><i class="fa fa-times"></i></a>');
	$ctrls.append($ctrlOk).append($ctrlCancel);
	$textarea.before($ctrls);
}
function filter(){
	var url = 'index.php?route=extension/module/custom_img_title_alt/listTag&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	location = url;
}
</script>
<style>
#ctrls_holder {text-align:right;}
.editTextArea{width:100%}
</style>
<?php echo $footer; ?>