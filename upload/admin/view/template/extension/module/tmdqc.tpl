<?php echo $header; ?>
<script src="view/javascript/bootstrap/js/highlight.js"></script>
<script src="view/javascript/bootstrap/js/bootstrap-switch.js"></script>
<script src="view/javascript/bootstrap/js/main.js"></script>
<link href="view/javascript/bootstrap/css/bootstrap-switch.css" rel="stylesheet"/>
<?php echo $column_left; ?>
<div id="content">
 <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
				<?php if($install_setting_permission){ ?>
				<a href="<?php echo $install_setting; ?>" data-toggle="tooltip" title="<?php echo $button_install_setting; ?>" class="btn btn-default"><i class="fa fa-plus"></i></a>
				<?php } ?>
        <button type="submit" form="form-tmdqc" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			</div>
      <h1><?php echo $heading_title; ?></h1>
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
		<?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
		</div>
		<div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tmdqc" class="form-horizontal">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab-layout" data-toggle="tab"><?php echo $tab_layout; ?></a></li>
			<li><a href="#tab-setting" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
			<li><a href="#tab-shipping" data-toggle="tab"><?php echo $tab_shipping; ?></a></li>
			<li><a href="#tab-payment" data-toggle="tab"><?php echo $tab_payment; ?></a></li>
			<li><a href="#tab-customfeild" data-toggle="tab"><?php echo $tab_custom; ?></a></li>
			<li><a href="#tab-google_tracking" data-toggle="tab"><?php echo $tab_google_tracking; ?></a></li>
			<li><a href="#tab-color-picker" data-toggle="tab"><?php echo $tab_color_picker; ?></a></li>
			<li><a href="#tab-title" data-toggle="tab"><?php echo $tab_title; ?></a></li>
			
		</ul>
		<div class="tab-content">
			<div class="tab-pane active in" id="tab-layout">
				 <div class="col-sm-2">
						<h2>Short Code</h2>
						<ul class="list-unstyled">
							 <li>{cart}</li>
							 <li>{login}</li>
							 <li>{delivery_detail}</li>
							 <li>{shipping_method}</li>
							 <li>{payment_method}</li>
							 <li>{confirmation}</li>
						</ul>
				 </div>
				 <div class="col-sm-10">
						<textarea cols="35" rows="10" name="tmdqc_layout_description" class="form-control"><?php echo $tmdqc_layout_description; ?></textarea>
				 </div>
			</div>
			<div class="tab-pane" id="tab-setting">
				<div class="row">
					<div class="col-sm-2">
						<ul class="nav nav-pills nav-stacked" id="setting">
							<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
							<li><a href="#tab-cart" data-toggle="tab"><?php echo $tab_cart; ?></a></li>
							<li><a href="#tab-register" data-toggle="tab"><?php echo $tab_register; ?></a></li>
							<li><a href="#tab-guest" data-toggle="tab"><?php echo $tab_guest; ?></a></li>
							<li><a href="#tab-bill-address" data-toggle="tab"><?php echo $tab_bill_address; ?></a></li>
							<li><a href="#tab-delivery-address" data-toggle="tab"><?php echo $tab_delivery_address; ?></a></li>
						</ul>
					</div>
					<div class="col-sm-10">
						<div class="tab-content">
						  <div class="tab-pane active" id="tab-general">
							  <div class="form-group">
									<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
									<div class="col-sm-10">
										<label class="radio-inline">
											<input <?php if($tmdqc_status){ echo"checked=checked"; } ?>  type="radio" name="tmdqc_status" value="1" data-radio-all-off="true" class="switch-radio"  />
										</label>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_country_default ?>"></span></label>
									<div class="col-sm-10">
										<select name="tmdqc_country_id" id="input-country" class="form-control">
											<?php foreach ($countries as $country) { ?>
											<?php if ($country['country_id'] == $tmdqc_country_id) { ?>
											<option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_zone_default ?>"></span></label>
									<div class="col-sm-10">
										<select name="tmdqc_zone_id" id="input-zone" class="form-control">
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-account-option"><?php echo $entry_account_option; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_account_option ?>"></span></label>
									<div class="col-sm-10">
										<select name="tmdqc_account_option" id="input-register-guest" class="form-control">
											<option value=""><?php echo $text_all ?></option>
											<option value="register" <?php echo ($tmdqc_account_option=='register') ? 'selected="selected"' :'';?>><?php echo $text_register ?></option>
											<option value="guest" <?php echo ($tmdqc_account_option=='guest') ? 'selected="selected"' :'';?>><?php echo $text_guest ?></option>
										</select>
									</div>
								</div>
								<div class="form-group">
                  <label class="col-sm-2 control-label" for="input-account"><span data-toggle="tooltip" title="<?php echo $help_account; ?>"><?php echo $entry_account; ?></span></label>
                  <div class="col-sm-4">
                    <select name="tmdqc_account_id" id="input-account" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $tmdqc_account_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
									<label class="col-sm-2 control-label" for="input-account-auto-select"><?php echo $entry_default_select; ?></label>
									<div class="col-sm-4">
											<input <?php if($tmdqc_account_default_checked){ echo"checked=checked"; } ?> id="input-account-auto-select" type="radio" name="tmdqc_account_default_checked" value="1" data-radio-all-off="true" class="switch-radio"  />
									</div>
                </div>
								<div class="form-group">
                  <label class="col-sm-2 control-label" for="input-checkout"><span data-toggle="tooltip" title="<?php echo $help_chkout; ?>"><?php echo $entry_checkout; ?></span></label>
                  <div class="col-sm-4">
                    <select name="tmdqc_checkout_id" id="input-checkout" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $tmdqc_checkout_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
									<label class="col-sm-2 control-label" for="input-checkout-auto-select"><?php echo $entry_default_select; ?></label>
									<div class="col-sm-4">
											<input <?php if($tmdqc_checkout_default_checked){ echo"checked=checked"; } ?> id="input-checkout-auto-select" type="radio" name="tmdqc_checkout_default_checked" value="1" data-radio-all-off="true" class="switch-radio"  />
									</div>
                </div>
							  <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_customer_group; ?></label>
                  <div class="col-sm-10">
                    <select name="tmdqc_customer_group_id" id="input-customer-group" class="form-control">
                      <?php foreach ($customer_groups as $customer_group) { ?>
                      <?php if ($customer_group['customer_group_id'] == $tmdqc_customer_group_id) { ?>
                      <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
							</div>
							<div class="tab-pane" id="tab-cart">
								 <div class="form-group">
										<label class="col-sm-2 control-label"  for="input-image" ><?php echo $entry_image; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_image ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_image_status){ echo"checked=checked"; } ?>  type="radio" name="tmdqc_cart_image_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-name" ><?php echo $entry_name; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_name ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_name_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_name_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-model" ><?php echo $entry_model; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_model ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_model_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_model_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-ean" ><?php echo $entry_ean; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_ean ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_ean_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_ean_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-isbn" ><?php echo $entry_isbn; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_isbn; ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_isbn_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_isbn_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-isbn" ><?php echo $entry_upc; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_upc; ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_upc_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_upc_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-qty" ><?php echo $entry_qty; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_qty; ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_qty_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_qty_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-unit_price" ><?php echo $entry_unit_price; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_unitprice; ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_unitprice_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_unitprice_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-qty" ><?php echo $entry_total; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_total; ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_total_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_total_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-coupan" ><?php echo $entry_coupan; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_coupan; ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_coupan_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_coupan_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-gift" ><?php echo $entry_gift; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_gift; ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_gift_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_gift_status" value="1" data-radio-all-off="true" class="switch-radio"/>
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-taxes" ><?php echo $entry_taxess; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_taxess; ?>"></span></label>
										<div class="col-sm-10">
											<label class="radio-inline">
												<input <?php if($tmdqc_cart_reward_status){ echo"checked=checked"; } ?> type="radio" name="tmdqc_cart_reward_status" value="1" data-radio-all-off="true" class="switch-radio"  />
											</label>
										</div>
									</div>
							</div>
							<div class="tab-pane" id="tab-register">
								<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-firstname"><?php echo $entry_firstname; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_firstname; ?>"></span></label>
										<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																	<?php 
																			if(!empty($tmdqc_register_firstname['label'][$language['language_id']])){
																				$value = $tmdqc_register_firstname['label'][$language['language_id']];
																			}else{
																				$value = $entry_firstname;
																			}
																	?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_firstname[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_firstname['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_firstname[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_firstname['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_firstname[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_firstname[sort_order]" value="<?php echo(isset($tmdqc_register_firstname['sort_order']) ? $tmdqc_register_firstname['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-lastname"><?php echo $entry_lastname; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_lastname; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_lastname['label'][$language['language_id']])){
																				$value = $tmdqc_register_lastname['label'][$language['language_id']];
																			}else{
																				$value = $entry_lastname;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_lastname[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_lastname['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_lastname[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_lastname['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_lastname[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_lastname[sort_order]" value="<?php echo(isset($tmdqc_register_lastname['sort_order']) ? $tmdqc_register_lastname['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-lastname"><?php echo $entry_email; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_email; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_email['label'][$language['language_id']])){
																				$value = $tmdqc_register_email['label'][$language['language_id']];
																			}else{
																				$value = $entry_email;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input class="form-control" type="text" name="tmdqc_register_email[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_email['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_email[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_email['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_email[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_email[sort_order]" value="<?php echo(isset($tmdqc_register_email['sort_order']) ? $tmdqc_register_email['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-telephone"><?php echo $entry_telephone; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_telephone; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_telephone['label'][$language['language_id']])){
																				$value = $tmdqc_register_telephone['label'][$language['language_id']];
																			}else{
																				$value = $entry_telephone;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_telephone[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_telephone['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_telephone[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_telephone['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_telephone[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_telephone[sort_order]" value="<?php echo(isset($tmdqc_register_telephone['sort_order']) ? $tmdqc_register_telephone['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>	
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-fax"><?php echo $entry_fax; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_fax; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_fax['label'][$language['language_id']])){
																				$value = $tmdqc_register_fax['label'][$language['language_id']];
																			}else{
																				$value = $entry_fax;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_fax[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_fax['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_fax[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_fax['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_fax[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_fax[sort_order]" value="<?php echo(isset($tmdqc_register_fax['sort_order']) ? $tmdqc_register_fax['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>									
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-fax"><?php echo $entry_company; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_company; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_company['label'][$language['language_id']])){
																				$value = $tmdqc_register_company['label'][$language['language_id']];
																			}else{
																				$value = $entry_company;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_company[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_company['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_company[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_company['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_company[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_company[sort_order]" value="<?php echo(isset($tmdqc_register_company['sort_order']) ? $tmdqc_register_company['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-address1"><?php echo $entry_address1; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_address1; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_address1['label'][$language['language_id']])){
																				$value = $tmdqc_register_address1['label'][$language['language_id']];
																			}else{
																				$value = $entry_address1;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_address1[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_address1['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_address1[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_address1['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_address1[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_address1[sort_order]" value="<?php echo(isset($tmdqc_register_address1['sort_order']) ? $tmdqc_register_address1['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-address2"><?php echo $entry_address2; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_address2; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>				
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_address2['label'][$language['language_id']])){
																				$value = $tmdqc_register_address2['label'][$language['language_id']];
																			}else{
																				$value = $entry_address2;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_address2[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_address2['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_address2[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_address2['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_address2[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_address2[sort_order]" value="<?php echo(isset($tmdqc_register_address2['sort_order']) ? $tmdqc_register_address2['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-city"><?php echo $entry_city; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_city; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_city['label'][$language['language_id']])){
																				$value = $tmdqc_register_city['label'][$language['language_id']];
																			}else{
																				$value = $entry_city;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_city[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_city['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_city[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_city['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_city[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_city[sort_order]" value="<?php echo(isset($tmdqc_register_city['sort_order']) ? $tmdqc_register_city['sort_order'] : 0); ?>"/></td>	
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-postal_code"><?php echo $entry_postal_code; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_posta_code; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_postal_code['label'][$language['language_id']])){
																				$value = $tmdqc_register_postal_code['label'][$language['language_id']];
																			}else{
																				$value = $entry_postal_code;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_register_postal_code[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_postal_code['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_postal_code[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_postal_code['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_postal_code[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_postal_code[sort_order]" value="<?php echo(isset($tmdqc_register_postal_code['sort_order']) ? $tmdqc_register_postal_code['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-country"><?php echo $entry_country; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_country; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_country['label'][$language['language_id']])){
																				$value = $tmdqc_register_country['label'][$language['language_id']];
																			}else{
																				$value = $entry_country;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_register_country[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_country['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_country[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_country['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_country[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_country[sort_order]" value="<?php echo(isset($tmdqc_register_country['sort_order']) ? $tmdqc_register_country['sort_order'] : 0); ?>"/>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-state"><?php echo $entry_state; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_state; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_state['label'][$language['language_id']])){
																				$value = $tmdqc_register_state['label'][$language['language_id']];
																			}else{
																				$value = $entry_state;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_register_state[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_state['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_state[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_state['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_state[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_state[sort_order]" value="<?php echo(isset($tmdqc_register_state['sort_order']) ? $tmdqc_register_state['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-state"><?php echo $entry_newsletter; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_newsletter; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_newsletter['label'][$language['language_id']])){
																				$value = $tmdqc_register_newsletter['label'][$language['language_id']];
																			}else{
																				$value = 'I wish to subscribe to the Your Store newsletter';
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_register_newsletter[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_newsletter['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_newsletter[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_newsletter['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_newsletter[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_newsletter[sort_order]" value="<?php echo(isset($tmdqc_register_newsletter['sort_order']) ? $tmdqc_register_newsletter['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-password"><?php echo $entry_password; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_password; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_password['label'][$language['language_id']])){
																				$value = $tmdqc_register_password['label'][$language['language_id']];
																			}else{
																				$value = $entry_password;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_password[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_password['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_password[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_password['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_password[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_password[sort_order]" value="<?php echo(isset($tmdqc_register_password['sort_order']) ? $tmdqc_register_password['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-cpassword"><?php echo $entry_cpassword; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_cpassword; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_register_cpassword['label'][$language['language_id']])){
																				$value = $tmdqc_register_cpassword['label'][$language['language_id']];
																			}else{
																				$value = $entry_cpassword;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_register_cpassword[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_register_cpassword['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_cpassword[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_register_cpassword['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_register_cpassword[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_register_cpassword[sort_order]" value="<?php echo(isset($tmdqc_register_cpassword['sort_order']) ? $tmdqc_register_cpassword['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
							</div>
							<div class="tab-pane" id="tab-guest">
							 <div class="form-group">
									<label class="col-sm-2 control-label" for="input-guest"><?php echo $entry_guest; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_guest ?>"></span></label>
									<div class="col-sm-10">
										<label class="radio-inline">
											<input <?php if($tmdqc_guest_status){ echo"checked=checked"; } ?>  type="radio" name="tmdqc_guest_status" value="1" data-radio-all-off="true" class="switch-radio"  />
										</label>
									</div>
								</div>
								<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-firstname"><?php echo $entry_firstname; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_firstname; ?>"></span></label>
										<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																	<?php 
																			if(!empty($tmdqc_guest_firstname['label'][$language['language_id']])){
																				$value = $tmdqc_guest_firstname['label'][$language['language_id']];
																			}else{
																				$value = $entry_firstname;
																			}
																	?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_guest_firstname[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_firstname['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_firstname[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_firstname['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_firstname[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_firstname[sort_order]" value="<?php echo(isset($tmdqc_guest_firstname['sort_order']) ? $tmdqc_guest_firstname['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-lastname"><?php echo $entry_lastname; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_lastname; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_lastname['label'][$language['language_id']])){
																				$value = $tmdqc_guest_lastname['label'][$language['language_id']];
																			}else{
																				$value = $entry_lastname;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_guest_lastname[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_lastname['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_lastname[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_lastname['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_lastname[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_lastname[sort_order]" value="<?php echo(isset($tmdqc_guest_lastname['sort_order']) ? $tmdqc_guest_lastname['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-lastname"><?php echo $entry_email; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_email; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_email['label'][$language['language_id']])){
																				$value = $tmdqc_guest_email['label'][$language['language_id']];
																			}else{
																				$value = $entry_email;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input class="form-control" type="text" name="tmdqc_guest_email[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_email['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_email[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_email['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_email[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_email[sort_order]" value="<?php echo(isset($tmdqc_guest_email['sort_order']) ? $tmdqc_guest_email['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-telephone"><?php echo $entry_telephone; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_telephone; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_telephone['label'][$language['language_id']])){
																				$value = $tmdqc_guest_telephone['label'][$language['language_id']];
																			}else{
																				$value = $entry_telephone;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_guest_telephone[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_telephone['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_telephone[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_telephone['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_telephone[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_telephone[sort_order]" value="<?php echo(isset($tmdqc_guest_telephone['sort_order']) ? $tmdqc_guest_telephone['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>	
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-fax"><?php echo $entry_fax; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_fax; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_fax['label'][$language['language_id']])){
																				$value = $tmdqc_guest_fax['label'][$language['language_id']];
																			}else{
																				$value = $entry_fax;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_guest_fax[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_fax['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_fax[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_fax['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_fax[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_fax[sort_order]" value="<?php echo(isset($tmdqc_guest_fax['sort_order']) ? $tmdqc_guest_fax['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>									
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-fax"><?php echo $entry_company; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_company; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_company['label'][$language['language_id']])){
																				$value = $tmdqc_guest_company['label'][$language['language_id']];
																			}else{
																				$value = $entry_company;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_guest_company[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_company['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_company[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_company['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_company[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_company[sort_order]" value="<?php echo(isset($tmdqc_guest_company['sort_order']) ? $tmdqc_guest_company['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-address1"><?php echo $entry_address1; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_address1; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_address1['label'][$language['language_id']])){
																				$value = $tmdqc_guest_address1['label'][$language['language_id']];
																			}else{
																				$value = $entry_address1;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_guest_address1[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_address1['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_address1[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_address1['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_address1[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_address1[sort_order]" value="<?php echo(isset($tmdqc_guest_address1['sort_order']) ? $tmdqc_guest_address1['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-address2"><?php echo $entry_address2; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_address2; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>				
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_address2['label'][$language['language_id']])){
																				$value = $tmdqc_guest_address2['label'][$language['language_id']];
																			}else{
																				$value = $entry_address2;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_guest_address2[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_address2['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_address2[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_address2['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_address2[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_address2[sort_order]" value="<?php echo(isset($tmdqc_guest_address2['sort_order']) ? $tmdqc_guest_address2['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-city"><?php echo $entry_city; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_city; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_city['label'][$language['language_id']])){
																				$value = $tmdqc_guest_city['label'][$language['language_id']];
																			}else{
																				$value = $entry_city;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_guest_city[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_city['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_city[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_city['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_city[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_city[sort_order]" value="<?php echo(isset($tmdqc_guest_city['sort_order']) ? $tmdqc_guest_city['sort_order'] : 0); ?>"/></td>	
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-postal_code"><?php echo $entry_postal_code; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_posta_code; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_postal_code['label'][$language['language_id']])){
																				$value = $tmdqc_guest_postal_code['label'][$language['language_id']];
																			}else{
																				$value = $entry_postal_code;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_guest_postal_code[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_postal_code['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_postal_code[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_postal_code['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_postal_code[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_postal_code[sort_order]" value="<?php echo(isset($tmdqc_guest_postal_code['sort_order']) ? $tmdqc_guest_postal_code['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-country"><?php echo $entry_country; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_country; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_country['label'][$language['language_id']])){
																				$value = $tmdqc_guest_country['label'][$language['language_id']];
																			}else{
																				$value = $entry_country;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_guest_country[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_country['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_country[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_country['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_country[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_country[sort_order]" value="<?php echo(isset($tmdqc_guest_country['sort_order']) ? $tmdqc_guest_country['sort_order'] : 0); ?>"/>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-state"><?php echo $entry_state; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_state; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_guest_state['label'][$language['language_id']])){
																				$value = $tmdqc_guest_state['label'][$language['language_id']];
																			}else{
																				$value = $entry_state;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_guest_state[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_guest_state['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_state[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_guest_state['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_guest_state[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_guest_state[sort_order]" value="<?php echo(isset($tmdqc_guest_state['sort_order']) ? $tmdqc_guest_state['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
							</div>
							<div class="tab-pane" id="tab-bill-address">
								<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-firstname"><?php echo $entry_firstname; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_firstname; ?>"></span></label>
										<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																	<?php 
																			if(!empty($tmdqc_billaddress_firstname['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_firstname['label'][$language['language_id']];
																			}else{
																				$value = $entry_firstname;
																			}
																	?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_billaddress_firstname[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_firstname['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_firstname[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_firstname['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_firstname[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_firstname[sort_order]" value="<?php echo(isset($tmdqc_billaddress_firstname['sort_order']) ? $tmdqc_billaddress_firstname['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-lastname"><?php echo $entry_lastname; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_lastname; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_billaddress_lastname['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_lastname['label'][$language['language_id']];
																			}else{
																				$value = $entry_lastname;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_billaddress_lastname[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_lastname['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_lastname[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_lastname['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_lastname[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_lastname[sort_order]" value="<?php echo(isset($tmdqc_billaddress_lastname['sort_order']) ? $tmdqc_billaddress_lastname['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-company"><?php echo $entry_company; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_company; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_billaddress_company['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_company['label'][$language['language_id']];
																			}else{
																				$value = $entry_company;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_billaddress_company[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_company['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_company[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_company['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_company[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_company[sort_order]" value="<?php echo(isset($tmdqc_billaddress_company['sort_order']) ? $tmdqc_billaddress_company['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-address1"><?php echo $entry_address1; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_address1; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_billaddress_address1['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_address1['label'][$language['language_id']];
																			}else{
																				$value = $entry_address1;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_billaddress_address1[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_address1['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_address1[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_address1['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_address1[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_address1[sort_order]" value="<?php echo(isset($tmdqc_billaddress_address1['sort_order']) ? $tmdqc_billaddress_address1['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-address2"><?php echo $entry_address2; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_address2; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>	
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_billaddress_address2['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_address2['label'][$language['language_id']];
																			}else{
																				$value = $entry_address2;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_billaddress_address2[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_address2['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_address2[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_address2['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_address2[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_address2[sort_order]" value="<?php echo(isset($tmdqc_billaddress_address2['sort_order']) ? $tmdqc_billaddress_address2['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-city"><?php echo $entry_city; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_city; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_billaddress_city['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_city['label'][$language['language_id']];
																			}else{
																				$value = $entry_city;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_billaddress_city[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_city['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_city[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_city['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_city[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_city[sort_order]" value="<?php echo(isset($tmdqc_billaddress_city['sort_order']) ? $tmdqc_billaddress_city['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-postal_code"><?php echo $entry_postal_code; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_posta_code; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_billaddress_postal_code['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_postal_code['label'][$language['language_id']];
																			}else{
																				$value = $entry_postal_code;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_billaddress_postal_code[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_postal_code['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_postal_code[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_postal_code['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_postal_code[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_postal_code[sort_order]" value="<?php echo(isset($tmdqc_billaddress_postal_code['sort_order']) ? $tmdqc_billaddress_postal_code['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-country"><?php echo $entry_country; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_country; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_billaddress_country['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_country['label'][$language['language_id']];
																			}else{
																				$value = $entry_country;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_billaddress_country[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_country['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_country[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_country['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_country[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_country[sort_order]" value="<?php echo(isset($tmdqc_billaddress_country['sort_order']) ? $tmdqc_billaddress_country['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-state"><?php echo $entry_state; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_state; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_billaddress_state['label'][$language['language_id']])){
																				$value = $tmdqc_billaddress_state['label'][$language['language_id']];
																			}else{
																				$value = $entry_state;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_billaddress_state[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_billaddress_state['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_state[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_billaddress_state['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_billaddress_state[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_billaddress_state[sort_order]" value="<?php echo(isset($tmdqc_billaddress_state['sort_order']) ? $tmdqc_billaddress_state['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
							</div>
							<div class="tab-pane" id="tab-delivery-address">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-delivery-address"><?php echo $entry_delivery_address_status; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_deliveryaddress; ?>"></span></label>
									<div class="col-sm-10">
											<input type="radio" <?php if($tmdqc_deliveryaddress_status){ echo"checked=checked"; } ?> name="tmdqc_deliveryaddress_status" value="1" data-radio-all-off="true" class="switch-radio"  />
									</div>
								</div>
								<div class="form-group">
										<label class="col-sm-2 control-label"  for="input-firstname"><?php echo $entry_firstname; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_firstname; ?>"></span></label>
										<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																	<?php 
																			if(!empty($tmdqc_deliveryaddress_firstname['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_firstname['label'][$language['language_id']];
																			}else{
																				$value = $entry_firstname;
																			}
																	?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_deliveryaddress_firstname[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_firstname['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_firstname[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_firstname['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_firstname[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_firstname[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_firstname['sort_order']) ? $tmdqc_deliveryaddress_firstname['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-lastname"><?php echo $entry_lastname; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_lastname; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_deliveryaddress_lastname['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_lastname['label'][$language['language_id']];
																			}else{
																				$value = $entry_lastname;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_deliveryaddress_lastname[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_lastname['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_lastname[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_lastname['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_lastname[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_lastname[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_lastname['sort_order']) ? $tmdqc_deliveryaddress_lastname['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-company"><?php echo $entry_company; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_company; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_deliveryaddress_company['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_company['label'][$language['language_id']];
																			}else{
																				$value = $entry_company;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_deliveryaddress_company[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_company['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_company[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_company['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_company[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_company[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_company['sort_order']) ? $tmdqc_deliveryaddress_company['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-address1"><?php echo $entry_address1; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_address1; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_deliveryaddress_address1['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_address1['label'][$language['language_id']];
																			}else{
																				$value = $entry_address1;
																			}
																			?>
																	<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_deliveryaddress_address1[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_address1['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_address1[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_address1['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_address1[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_address1[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_address1['sort_order']) ? $tmdqc_deliveryaddress_address1['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-address2"><?php echo $entry_address2; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_address2; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_deliveryaddress_address2['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_address2['label'][$language['language_id']];
																			}else{
																				$value = $entry_address2;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_deliveryaddress_address2[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_address2['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_address2[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_address2['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_address2[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_address2[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_address2['sort_order']) ? $tmdqc_deliveryaddress_address2['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-city"><?php echo $entry_city; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_city; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_deliveryaddress_city['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_city['label'][$language['language_id']];
																			}else{
																				$value = $entry_city;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input  src="" class="form-control" type="text" name="tmdqc_deliveryaddress_city[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_city['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_city[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_city['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_city[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_city[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_city['sort_order']) ? $tmdqc_deliveryaddress_city['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-postal_code"><?php echo $entry_postal_code; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_posta_code; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>
															<td><?php echo $entry_sort_order; ?></td>															
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_deliveryaddress_postal_code['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_postal_code['label'][$language['language_id']];
																			}else{
																				$value = $entry_postal_code;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_deliveryaddress_postal_code[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_postal_code['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_postal_code[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_postal_code['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_postal_code[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_postal_code[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_postal_code['sort_order']) ? $tmdqc_deliveryaddress_postal_code['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-country"><?php echo $entry_country; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_country; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_deliveryaddress_country['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_country['label'][$language['language_id']];
																			}else{
																				$value = $entry_country;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_deliveryaddress_country[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_country['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_country[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_country['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_country[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_country[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_country['sort_order']) ? $tmdqc_deliveryaddress_country['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"  for="input-state"><?php echo $entry_state; ?> <span data-toggle="tooltip"  data-original-title="<?php echo $help_state; ?>"></span></label>
									<div class="col-sm-10">
											<div class="col-sm-12 table-responsive">
												<table class="table table-bordered table-hover">
													<thead>
														<tr>
															<td><?php echo $entry_label; ?></td>	
															<td><?php echo $entry_required; ?></td>	
															<td><?php echo $entry_status; ?></td>	
															<td><?php echo $entry_sort_order; ?></td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																	<?php foreach ($languages as $language) { ?>
																			<?php 
																			if(!empty($tmdqc_deliveryaddress_state['label'][$language['language_id']])){
																				$value = $tmdqc_deliveryaddress_state['label'][$language['language_id']];
																			}else{
																				$value = $entry_state;
																			}
																			?>
																		<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_deliveryaddress_state[label][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
																	<?php } ?>
															</td>
															<td>
																<?php
																	if(!empty($tmdqc_deliveryaddress_state['required'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_state[required]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td>
															<?php
																	if(!empty($tmdqc_deliveryaddress_state['status'])){
																			$check = "checked=checked";
																	}else{
																		  $check = '';
																	}
																?>
																<label class="radio-inline">
																	<input <?php echo $check; ?>  type="radio" name="tmdqc_deliveryaddress_state[status]" value="1" data-radio-all-off="true" class="switch-radio"  />
																</label>
															</td>
															<td><input type="text" size="2" class="form-control" name="tmdqc_deliveryaddress_state[sort_order]" value="<?php echo(isset($tmdqc_deliveryaddress_state['sort_order']) ? $tmdqc_deliveryaddress_state['sort_order'] : 0); ?>"/></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab-shipping">
				<div class="form-group">
						<label class="col-sm-2 control-label"  for="input-shipping_label" ><?php echo $entry_shipping_label; ?> </label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<input <?php if($tmdqc_shipping_label){ echo"checked=checked"; } ?> id="input-shipping_label" type="radio" name="tmdqc_shipping_label" value="1" data-radio-all-off="true" class="switch-radio"  />
							</label>
						</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-shipping-comment"><?php echo $entry_shipping_comment; ?></label>
					<div class="col-sm-10">
						<label class="radio-inline">
							<input <?php if($tmdqc_shipping_comment){ echo"checked=checked"; } ?> id="input-shipping-comment" type="radio" name="tmdqc_shipping_comment" value="1" data-radio-all-off="true" class="switch-radio"  />
						</label>
					</div>
				</div>
				<?php foreach($shippings as $shipping){ ?>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-<?php echo $shipping['code']; ?>"><?php echo $shipping['heading']; ?></label>
					<div class="col-sm-10">
						<div class="col-sm-12 table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<td><?php echo $entry_icon; ?></td>	
										<td><?php echo $entry_label; ?></td>	
										<td><?php echo $entry_status; ?></td>	
										<td><?php echo $entry_sort_order; ?></td>	
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										 <?php foreach ($languages as $language){
												if(!empty($tmdqc_shipping_admin[$shipping['code']]['language'][$language['language_id']]['image'])){
													$image = $tmdqc_shipping_admin[$shipping['code']]['language'][$language['language_id']]['image'];
												}else{
													$image = '';
											  }
												
												if(!empty($tmdqc_shipping_thum[$shipping['code']][$language['language_id']])){
													$thumb = $tmdqc_shipping_thum[$shipping['code']][$language['language_id']];
												}else{
													$thumb = '';
											  }
											?>
										 <div class="col-sm-10"><a href="" id="thumb-<?php echo $shipping['code']; ?>-<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
											<input type="hidden" name="tmdqc_<?php echo $shipping['code']; ?>[<?php echo $language['language_id']; ?>][image]" value="<?php echo $image; ?>" id="input-image-<?php echo $shipping['code']; ?>-<?php echo $language['language_id']; ?>" />
											<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
											</div>
											<?php } ?>
										</td>
										<td>
												<?php foreach ($languages as $language) { ?>
														<?php 
														if(!empty($tmdqc_shipping_admin[$shipping['code']]['language'][$language['language_id']]['label'])){
															$value = $tmdqc_shipping_admin[$shipping['code']]['language'][$language['language_id']]['label'];
														}else{
															$value = $shipping['heading'];
														}
														
														if(!empty($tmdqc_shipping_admin[$shipping['code']]['sort_order'])){
															$sort_order = $tmdqc_shipping_admin[$shipping['code']]['sort_order'];
														}else{
															$sort_order = 0;
														}
														
														if(!empty($tmdqc_shipping_admin[$shipping['code']]['status'])){
															$status = $tmdqc_shipping_admin[$shipping['code']]['status'];
														}else{
															$status = '';
														}
														
														
														?>
													<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_<?php echo $shipping['code']; ?>[<?php echo $language['language_id']; ?>][label]" value="<?php echo $value; ?>" />
												<?php } ?>
										</td>
										<td><?php echo $status; ?></td>
										<td><?php echo $sort_order ?></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div> 
				</div>
			 <?php } ?>
			</div>
			<div class="tab-pane" id="tab-payment">
				<div class="form-group">
						<label class="col-sm-2 control-label"  for="input-payment_label" ><?php echo $entry_payment_label; ?> </label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<input <?php if($tmdqc_payment_label){ echo"checked=checked"; } ?> id="input-payment_label" type="radio" name="tmdqc_payment_label" value="1" data-radio-all-off="true" class="switch-radio"  />
							</label>
						</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-payment-comment"><?php echo $entry_payment_comment; ?></label>
					<div class="col-sm-10">
						<label class="radio-inline">
								<input <?php if($tmdqc_payment_comment){ echo"checked=checked"; } ?> id="input-payment-comment" type="radio" name="tmdqc_payment_comment" value="1" data-radio-all-off="true" class="switch-radio"  />
							</label>
					</div>
				</div>	
				<?php foreach($payments as $payment){ ?>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-<?php echo $payment['code']; ?>"><?php echo $payment['heading']; ?></label>
					<div class="col-sm-10">
						<div class="col-sm-12 table-responsive">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<td><?php echo $entry_icon; ?></td>	
										<td><?php echo $entry_label; ?></td>	
										<td><?php echo $entry_status; ?></td>	
										<td><?php echo $entry_sort_order; ?></td>	
									</tr>
								</thead>
								<tbody>
									<tr>
									<td>
										 <?php foreach ($languages as $language){
												if(!empty($tmdqc_payment_admin[$payment['code']]['language'][$language['language_id']]['image'])){
													$image = $tmdqc_payment_admin[$payment['code']]['language'][$language['language_id']]['image'];
												}else{
													$image = '';
											  }
												
												if(!empty($tmdqc_payment_thum[$payment['code']][$language['language_id']])){
													$thumb = $tmdqc_payment_thum[$payment['code']][$language['language_id']];
												}else{
													$thumb = '';
											  }
											?>
										 <div class="col-sm-10"><a href="" id="thumb-<?php echo $payment['code']; ?>-<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
											<input type="hidden" name="tmdqc_<?php echo $payment['code']; ?>[<?php echo $language['language_id']; ?>][image]" value="<?php echo $image; ?>" id="input-image-<?php echo $payment['code']; ?>-<?php echo $language['language_id']; ?>" />
											<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" />
											</div>
											<?php } ?>
										</td>
										<td>
												<?php foreach ($languages as $language) { ?>
														<?php 
														if(!empty($tmdqc_payment_admin[$payment['code']]['language'][$language['language_id']]['label'])){
															$value = $tmdqc_payment_admin[$payment['code']]['language'][$language['language_id']]['label'];
														}else{
															$value = $payment['heading'];
														}
														
														if(!empty($tmdqc_payment_admin[$payment['code']]['sort_order'])){
															$sort_order = $tmdqc_payment_admin[$payment['code']]['sort_order'];
														}else{
															$sort_order = 0;
														}
														
														if(!empty($tmdqc_payment_admin[$payment['code']]['status'])){
															$status = $tmdqc_payment_admin[$payment['code']]['status'];
														}else{
															$status = '';
														}
														?>
													<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <input   class="form-control" type="text" name="tmdqc_<?php echo $payment['code']; ?>[<?php echo $language['language_id']; ?>][label]" value="<?php echo $value; ?>" />
												<?php } ?>
										</td>
										<td><?php echo $status; ?></td>
										<td><?php echo $sort_order ?></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div> 
				</div>
			  <?php } ?>
			</div>
			<div id="tab-customfeild" class="tab-pane">
					<div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $column_name; ?></td>
                  <td class="text-left"><?php echo $column_location; ?></td>
                  <td class="text-left"><?php echo $column_type; ?></td>
                  <td class="text-left"><?php echo $column_sort_order; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if($custom_fields){ ?>
                <?php foreach ($custom_fields as $custom_field){ ?>
                <tr>
                  <td class="text-left"><?php echo $custom_field['name']; ?></td>
                  <td class="text-left"><?php echo $custom_field['location']; ?></td>
                  <td class="text-left"><?php echo $custom_field['type']; ?></td>
                  <td class="text-left"><input class="form-control" name="tmdqc_custom_sort_oder[<?php echo $custom_field['custom_field_id']; ?>]" type="text" size="2" value="<?php echo (isset($tmdqc_custom_sort_oder[$custom_field['custom_field_id']]) ? $tmdqc_custom_sort_oder[$custom_field['custom_field_id']] : $custom_field['sort_order']) ?>"/></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
			</div>
			<div id="tab-google_tracking" class="tab-pane">
				<div class="form-group">
					 <label class="col-sm-2 control-label"><?php echo $entry_google_tracking; ?></label>
					 <div class="col-sm-10">
							<textarea class="form-control" style="width: 919px; height: 399px;" name="tmdqc_trackingcode" cols="35" rows="4"><?php echo $tmdqc_trackingcode; ?></textarea>
					 </div>
				</div>
			</div>
			<div class="tab-pane" id="tab-color-picker">
				<fieldset>
					<legend><?php echo $text_main_content ?></legend>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-content_background"><?php echo $entry_content_background; ?></label>
					<div class="col-sm-5">
							<input type="text" class="form-control color-picker"  id="input-content_background" name="tmdqc_content_background"  value="<?php echo $tmdqc_content_background; ?>" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-content_heading_color"><?php echo $entry_content_heading_color; ?></label>
					<div class="col-sm-5">
							<input type="text" class="form-control color-picker" id="input-content_heading_color" name="tmdqc_content_heading_color"  value="<?php echo $tmdqc_content_heading_color; ?>" />
					</div>
				</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_sub_content; ?></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-block_heading_background"><?php echo $entry_block_heading_background; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-block_heading_background" name="tmdqc_block_heading_background" value="<?php echo $tmdqc_block_heading_background; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-block_heading_border"><?php echo $entry_block_heading_border; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-block_heading_border" name="tmdqc_block_heading_border" value="<?php echo $tmdqc_block_heading_border; ?>" />
						</div>
					</div>
				
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-sub_content_background"><?php echo $entry_sub_content_background; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-sub_content_background" name="tmdqc_sub_content_background" value="<?php echo $tmdqc_sub_content_background; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-sub_content_border"><?php echo $entry_sub_content_border; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-sub_content_border" name="tmdqc_sub_content_border" value="<?php echo $tmdqc_sub_content_border; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-block_heading_background"><?php echo $entry_logintextcolor; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-logintextcolor" name="tmdqc_logintextcolor" value="<?php echo $tmdqc_logintextcolor; ?>" />
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_shopping_cart; ?></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-cart_heading_color"><?php echo $entry_cart_heading_color; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-cart_heading_color" name="tmdqc_cart_heading_color"  value="<?php echo $tmdqc_cart_heading_color; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-cart_heading_background"><?php echo $entry_cart_heading_background; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-cart_heading_background" name="tmdqc_cart_heading_background"  value="<?php echo $tmdqc_cart_heading_background; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-cart_table_color"><?php echo $entry_cart_table_color; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-cart_table_color" name="tmdqc_cart_table_color"  value="<?php echo $tmdqc_cart_table_color; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-cart_table_background"><?php echo $entry_cart_table_background; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-cart_table_background" name="tmdqc_cart_table_background"  value="<?php echo $tmdqc_cart_table_background; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-cart_table_border"><?php echo $entry_cart_table_border; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-cart_table_border" name="tmdqc_cart_table_border" value="<?php echo $tmdqc_cart_table_border; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-block_heading_color"><?php echo $entry_block_heading_color; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-block_heading_color" name="tmdqc_block_heading_color" value="<?php echo $tmdqc_block_heading_color; ?>" />
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_buttons; ?></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-primary_button_color"><?php echo $entry_primary_button_color; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-primary_button_color" name="tmdqc_primary_button_color" value="<?php echo $tmdqc_primary_button_color; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-primary_button_background"><?php echo $entry_primary_button_background; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-primary_button_background" name="tmdqc_primary_button_background" value="<?php echo $tmdqc_primary_button_background; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-primary_button_background_hover"><?php echo $entry_primary_button_background_hover; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-primary_button_background_hover" name="tmdqc_primary_button_background_hover" value="<?php echo $tmdqc_primary_button_background_hover; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-primary_button_border"><?php echo $entry_primary_button_border; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-primary_button_border" name="tmdqc_primary_button_border" value="<?php echo $tmdqc_primary_button_border; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-danger_button_color"><?php echo $entry_danger_button_color; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-danger_button_color" name="tmdqc_danger_button_color" value="<?php echo $tmdqc_danger_button_color; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-danger_button_background"><?php echo $entry_danger_button_background; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-danger_button_background" name="tmdqc_danger_button_background" value="<?php echo $tmdqc_danger_button_background; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-danger_button_background_hover"><?php echo $entry_danger_button_background_hover; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-danger_button_background_hover" name="tmdqc_danger_button_background_hover" value="<?php echo $tmdqc_danger_button_background_hover; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-danger_button_border"><?php echo $entry_danger_button_border; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-danger_button_border" name="tmdqc_danger_button_border" value="<?php echo $tmdqc_danger_button_border; ?>" />
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_input_labels; ?></legend>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-input_color"><?php echo $entry_input_color; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-input_color" name="tmdqc_input_color" value="<?php echo $tmdqc_input_color; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-input_background"><?php echo $entry_input_background; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-input_background" name="tmdqc_input_background" value="<?php echo $tmdqc_input_background; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-input_border"><?php echo $entry_input_border; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-input_border" name="tmdqc_input_border" value="<?php echo $tmdqc_input_border; ?>" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-label_color"><?php echo $entry_label_color; ?></label>
						<div class="col-sm-5">
								<input type="text" class="form-control color-picker" id="input-label_color" name="tmdqc_label_color" value="<?php echo $tmdqc_label_color; ?>" />
						</div>
					</div>
				</fieldset>
			</div>
			<div class="tab-pane" id="tab-title">
				<fieldset>
					<legend><?php echo $text_heading_title; ?></legend>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-heading-title"><?php echo $entry_heading_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['heading_title'][$language['language_id']])){
												$value = $tmdqc_title['heading_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[heading_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_cart_title; ?></legend>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-cart-title"><?php echo $entry_cart_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['cart_title'][$language['language_id']])){
												$value = $tmdqc_title['cart_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[cart_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_account_type; ?></legend>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-checkout-option-title"><?php echo $entry_checkout_option_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['chekout_option_title'][$language['language_id']])){
												$value = $tmdqc_title['chekout_option_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[chekout_option_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-login-title"><?php echo $entry_customer_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['custmer_title'][$language['language_id']])){
												$value = $tmdqc_title['custmer_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[custmer_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-login-title"><?php echo $entry_login_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['login_title'][$language['language_id']])){
												$value = $tmdqc_title['login_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[login_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-register-title"><?php echo $entry_register_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['register_title'][$language['language_id']])){
												$value = $tmdqc_title['register_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[register_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-guest-title"><?php echo $entry_guest_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['guest_title'][$language['language_id']])){
												$value = $tmdqc_title['guest_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[guest_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-guest-title"><?php echo $entry_personal_detail; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['personal_detail_title'][$language['language_id']])){
												$value = $tmdqc_title['personal_detail_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[personal_detail_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-guest-title"><?php echo $entry_afterlogincustomer; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['afterlogincustomer'][$language['language_id']])){
												$value = $tmdqc_title['afterlogincustomer'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[afterlogincustomer][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-guest-title"><?php echo $entry_selectaddress; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['selectaddress'][$language['language_id']])){
												$value = $tmdqc_title['selectaddress'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[selectaddress][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_delivery_details_title; ?></legend>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-cart-title"><?php echo $entry_delivery_details_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['delivery_details_title'][$language['language_id']])){
												$value = $tmdqc_title['delivery_details_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[delivery_details_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_delivery_method_title; ?></legend>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-cart-title"><?php echo $entry_delivery_method_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['delivery_method_title'][$language['language_id']])){
												$value = $tmdqc_title['delivery_method_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[delivery_method_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_payment_method_title; ?></legend>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-cart-title"><?php echo $entry_payment_method_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['payment_method_title'][$language['language_id']])){
												$value = $tmdqc_title['payment_method_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[payment_method_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
				</fieldset>
				<fieldset>
					<legend><?php echo $text_button_title; ?></legend>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-login-title"><?php echo $entry_login_button_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['login_button_title'][$language['language_id']])){
												$value = $tmdqc_title['login_button_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[login_button_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-shopping-title"><?php echo $entry_continue_shopping_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['continue_shopping_title'][$language['language_id']])){
												$value = $tmdqc_title['continue_shopping_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[continue_shopping_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
					<div class="form-group">
							<label class="col-sm-2 control-label" for="input-order-title"><?php echo $entry_order_title; ?></label>
							<div class="col-sm-10">
									<?php foreach ($languages as $language) { ?>
											<?php 
											if(!empty($tmdqc_title['order_title'][$language['language_id']])){
												$value = $tmdqc_title['order_title'][$language['language_id']];
											}else{
												$value = '';
											}
											?>
									<img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> 
									<input  src="" class="form-control" type="text" name="tmdqc_title[order_title][<?php echo $language['language_id']; ?>]" value="<?php echo $value; ?>" />
									<?php } ?>
							</div>
					</div>
				</fieldset>
			</div>
			
		</div>
	 </form>
  </div>
 </div>
</div>
</div>
<script type="text/javascript"><!--
$('select[name=\'tmdqc_country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'tmdqc_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
          			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $tmdqc_zone_id; ?>') {
            			html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'tmdqc_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'tmdqc_country_id\']').trigger('change');
//--></script>

<script src="view/javascript/colorbox/jquery.minicolors.js"></script>
<link rel="stylesheet" href="view/javascript/colorbox/jquery.minicolors.css">
<script type="text/javascript"><!--
$(document).ready( function() {
	$('.color-picker').each( function() {
		$(this).minicolors({
			control: $(this).attr('data-control') || 'hue',
			defaultValue: $(this).attr('data-defaultValue') || '',
			inline: $(this).attr('data-inline') === 'true',
			letterCase: $(this).attr('data-letterCase') || 'lowercase',
			opacity: $(this).attr('data-opacity'),
			position: $(this).attr('data-position') || 'bottom left',
			change: function(hex, opacity) {
				if( !hex ) return;
				if( opacity ) hex += ', ' + opacity;
				try {
					console.log(hex);
				} catch(e) {}
			},
			theme: 'bootstrap'
		});
	});
});
//--></script>

<style>
	.minicolors-theme-bootstrap .minicolors-input{width:100%; height:35px;}
</style>
<?php echo $footer; ?>