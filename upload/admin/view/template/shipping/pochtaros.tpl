<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
    <div class="container-fluid">
        <div class="pull-right">
            <button type="submit" form="form-pochtaros" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
            <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
<div class="panel panel-default">
<div class="panel-heading">
    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
</div>
<div class="panel-body">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-pochtaros" class="form-horizontal">
<ul class="nav nav-tabs">
    <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
    <li><a href="#tab-data" data-toggle="tab"><?php echo $text_methods; ?></a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane active" id="tab-general">

        <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_name; ?>"><?php echo $entry_name; ?></span></label>
            <div class="col-sm-10">
                <?php foreach ($languages as $language) {
                    if ($language['status'] == 1) {
                ?>
                <div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
                <input size="50" type="text" name="<?php echo $name; ?>_name[<?php echo $language['language_id']; ?>]" value="<?php echo isset($pochtaros_name[$language['language_id']]) ? $pochtaros_name[$language['language_id']] : ''; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" /></div>
                <?php }
                } ?>
            </div>
        </div>

        <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-store"><?php echo $entry_store; ?></label>

            <div class="col-sm-10">
              <div class="well well-sm" style="height: 100px; overflow: auto;">
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="<?php echo $name; ?>_store[]" value="<?php echo $store['store_id']; ?>" <?php if (isset($pochtaros_store) and in_array($store['store_id'], $pochtaros_store)) { ?>checked="checked"<?php } ?> />
                        <?php echo $store['name']; ?>
                    </label>
                </div>
                <?php } ?>
              </div>
              <?php if (isset($error_store) and !empty($error_store)) { ?>
                <div class="text-danger"><?php echo $error_store; ?></div>
              <?php } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-city"><span data-toggle="tooltip" title="<?php echo $help_city; ?>"><?php echo $entry_city; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="<?php echo $name; ?>_city" value="<?php if (isset($pochtaros_city)) echo $pochtaros_city; ?>" id="input-city" class="form-control" />
                <?php if (isset($error_city) and !empty($error_city)) { ?>
                <div class="text-danger"><?php echo $error_city; ?></div>
                <?php } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-10">
                <select name="<?php echo $name; ?>_zone_id" id="input-zone" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php
                        foreach ($zones as $zone) {
                            if ($zone['status'] == 1) {
                                if ($zone['zone_id'] == $pochtaros_zone_id) { ?>
                    <option value="<?php echo $zone['zone_id']; ?>" selected="selected"><?php echo $zone['name']; ?></option>
                    <?php
                                }
                                else {
                                ?>
                    <option value="<?php echo $zone['zone_id']; ?>"><?php echo $zone['name']; ?></option>
                    <?php
                                }
                                ?>
                    <?php
                            }
                        }
                        ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
            <div class="col-sm-10">
                <select name="<?php echo $name; ?>_weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                        <?php if ($weight_class['weight_class_id'] == $pochtaros_weight_class_id) { ?>
                            <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                        <?php } else { ?>
                            <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                        <?php } ?>
                    <?php } ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-min-weight"><span data-toggle="tooltip" title="<?php echo $help_min_weight; ?>"><?php echo $entry_min_weight; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="<?php echo $name; ?>_min_weight" value="<?php if (isset($pochtaros_min_weight)) echo $pochtaros_min_weight; ?>" id="input-min-weight" class="form-control" />
                <?php if (isset($error_min_weight) and !empty($error_min_weight)) { ?>
                <div class="text-danger"><?php echo $error_min_weight; ?></div>
                <?php } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-max-weight"><span data-toggle="tooltip" title="<?php echo $help_max_weight; ?>"><?php echo $entry_max_weight; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="<?php echo $name; ?>_max_weight" value="<?php if (isset($pochtaros_max_weight)) echo $pochtaros_max_weight; ?>" id="input-max-weight" class="form-control" />
                <?php if (isset($error_max_weight) and !empty($error_max_weight)) { ?>
                <div class="text-danger"><?php echo $error_max_weight; ?></div>
                <?php } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-cost"><span data-toggle="tooltip" title="<?php echo $help_cost; ?>"><?php echo $entry_cost; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="<?php echo $name; ?>_cost" value="<?php if (isset($pochtaros_cost)) echo $pochtaros_cost; ?>" id="input-cost" class="form-control" />
                <?php if (isset($error_cost) and !empty($error_cost)) { ?>
                <div class="text-danger"><?php echo $error_cost; ?></div>
                <?php } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="<?php echo $name; ?>_total" value="<?php if (isset($pochtaros_total)) echo $pochtaros_total; ?>" id="input-total" class="form-control" />
                <?php if (isset($error_total) and !empty($error_total)) { ?>
                <div class="text-danger"><?php echo $error_total; ?></div>
                <?php } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-max-total"><span data-toggle="tooltip" title="<?php echo $help_max_total; ?>"><?php echo $entry_max_total; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="<?php echo $name; ?>_max_total" value="<?php if (isset($pochtaros_max_total)) echo $pochtaros_max_total; ?>" id="input-max-total" class="form-control" />
                <?php if (isset($error_max_total) and !empty($error_max_total)) { ?>
                <div class="text-danger"><?php echo $error_max_total; ?></div>
                <?php } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-upakovka"><span data-toggle="tooltip" title="<?php echo $help_upakovka; ?>"><?php echo $entry_upakovka; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="<?php echo $name; ?>_upakovka" value="<?php if (isset($pochtaros_upakovka)) echo $pochtaros_upakovka; ?>" id="input-upakovka" class="form-control" />
                <?php if (isset($error_upakovka) and !empty($error_upakovka)) { ?>
                <div class="text-danger"><?php echo $error_upakovka; ?></div>
                <?php } ?>
            </div>
        </div>

        <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>

            <div class="col-sm-10">
                <div class="well well-sm" style="height: 100px; overflow: auto;">
                    <?php foreach ($geo_zones as $geo_zone) { ?>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="<?php echo $name; ?>_geo_zone[]" value="<?php echo $geo_zone['geo_zone_id']; ?>" <?php if (isset($pochtaros_geo_zone) and in_array($geo_zone['geo_zone_id'], $pochtaros_geo_zone)) { ?>checked="checked"<?php } ?> />
                            <?php echo $geo_zone['name']; ?>
                        </label>
                    </div>
                    <?php } ?>
                </div>
                <?php if (isset($error_geo_zone) and !empty($error_geo_zone)) { ?>
                <div class="text-danger"><?php echo $error_geo_zone; ?></div>
                <?php } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
            <div class="col-sm-10">
                <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                <input type="hidden" name="<?php echo $name; ?>_image" value="<?php echo $image; ?>" id="input-image" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_time; ?></label>
            <div class="col-sm-10">
                <label class="checkbox-inline">
                    <input type="checkbox" name="<?php echo $name; ?>_time" value="1" <?php if (isset($pochtaros_time) and $pochtaros_time) { ?>checked="checked"<?php } ?> />
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_fragmentation; ?>"><?php echo $entry_fragmentation; ?></span></label>
            <div class="col-sm-10">
                <label class="checkbox-inline">
                    <input type="checkbox" name="<?php echo $name; ?>_fragmentation" value="1" <?php if (isset($pochtaros_fragmentation) and $pochtaros_fragmentation) { ?>checked="checked"<?php } ?> />
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_zaglushka; ?>"><?php echo $entry_zaglushka; ?></span></label>
            <div class="col-sm-10">
                <label class="checkbox-inline">
                    <input type="checkbox" name="<?php echo $name; ?>_zaglushka" value="1" <?php if (isset($pochtaros_zaglushka) and $pochtaros_zaglushka) { ?>checked="checked"<?php } ?> />
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_zaglushka_text; ?></label>
            <div class="col-sm-10">
                <?php foreach ($languages as $language) {
                    if ($language['status'] == 1) {
                ?>
                <div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
                    <input size="50" type="text" name="<?php echo $name; ?>_bibbtext[<?php echo $language['language_id']; ?>]" value="<?php echo isset($pochtaros_bibbtext[$language['language_id']]) ? $pochtaros_bibbtext[$language['language_id']] : ''; ?>" id="input-bibbtext<?php echo $language['language_id']; ?>" class="form-control" placeholder="<? if ($language['language_id'] == $config_language_id) echo $text_bibb; ?>" /></div>
                <?php }
                } ?>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total-value"><?php echo $entry_value_for_total; ?></label>
            <div class="col-sm-10">
                <select name="<?php echo $name; ?>_total_value" id="input-total-value" class="form-control">
                    <?php
                    $total_value = (isset($pochtaros_total_value)) ? $pochtaros_total_value : 'sub_total';
                    foreach ($totals as $key => $val) {
                    ?>
                    <option value="<?php echo $key;?>" <?php if ($total_value == $key) echo 'selected="selected"'; ?> ><?php echo $val; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-round"><?php echo $entry_round; ?></label>
            <div class="col-sm-10">
                <select name="<?php echo $name; ?>_round" id="input-round" class="form-control">
                    <option value=""><?php echo $text_noround; ?></option>
                    <option value="digit1" <?php if ($pochtaros_round == 'digit1') echo 'selected="selected"'; ?> ><?php echo $text_digit1; ?></option>
                    <option value="digit1_plus" <?php if ($pochtaros_round == 'digit1_plus') echo 'selected="selected"'; ?>><?php echo $text_digit1_plus; ?></option>
                    <option value="digit9" <?php if ($pochtaros_round == 'digit9') echo 'selected="selected"'; ?>><?php echo $text_digit9; ?></option>
                    <option value="digit10" <?php if ($pochtaros_round == 'digit10') echo 'selected="selected"'; ?>><?php echo $text_digit10; ?></option>
                    <option value="digit50" <?php if ($pochtaros_round == 'digit50') echo 'selected="selected"'; ?>><?php echo $text_digit50; ?></option>
                    <option value="digit100" <?php if ($pochtaros_round == 'digit100') echo 'selected="selected"'; ?>><?php echo $text_digit100; ?></option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-procent-price"><?php echo $entry_procent_price; ?></label>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-4">
                        <input type="text" name="<?php echo $name; ?>_procent_price" value="<?php echo $pochtaros_procent_price; ?>" placeholder="100" id="input-procent-price" class="form-control" />
                    </div>%
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_nalozhka; ?></label>
            <div class="col-sm-10">
                <label class="checkbox-inline">
                    <input type="checkbox" name="<?php echo $name; ?>_nalozhka" value="1" <?php if (isset($pochtaros_nalozhka) and $pochtaros_nalozhka) { ?>checked="checked"<?php } ?> />
                </label>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total-value"><?php echo $entry_payment; ?></label>
            <div class="col-sm-10">
                <select name="<?php echo $name; ?>_payment" id="input-payment" class="form-control">
                    <option value=""><?php echo $text_none; ?></option>
                    <?php
                    $payment = (isset($pochtaros_payment)) ? $pochtaros_payment : 'sub_total';
                    foreach ($payments as $key => $val) {
                    ?>
                    <option value="<?php echo $val['payment_code'];?>" <?php if ($payment == $val['payment_code']) echo 'selected="selected"'; ?> ><?php echo $val['name']; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-tax"><?php echo $entry_tax_class; ?></label>
            <div class="col-sm-10">
                <select name="<?php echo $name; ?>_tax_class_id" id="input-tax" class="form-control">
                    <option value="0"><?php echo $text_none; ?></option>
                    <?php foreach ($tax_classes as $tax_class) { ?>
                    <?php if ($tax_class['tax_class_id'] == ${$name.'_tax_class_id'}) { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-4">
                        <input type="text" name="<?php echo $name; ?>_sort_order" value="<?php echo $pochtaros_sort_order; ?>" placeholder="1" id="input-sort-order" class="form-control" />
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
                <select name="<?php echo $name; ?>_status" id="input-status" class="form-control">
                    <?php if ($pochtaros_status) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
    </div>

    <div class="tab-pane" id="tab-data">
        <div class="row">
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked" id="methods">
                    <?php foreach ($methods as $method) { ?>
                    <li><a href="#tab-method-<?php echo $method['key']; ?>" data-toggle="tab"><i class="fa" onclick="$('a[href=\'#tab-method-<?php echo $method['key']; ?>\']').parent().remove(); $('#method a:first').tab('show');"></i> <?php echo $method['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <div class="col-sm-10">
                <div class="tab-content">
                    <?php foreach ($methods as $method) { ?>
                    <div class="tab-pane" id="tab-method-<?php echo $method['key']; ?>">

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="<?php echo $name; ?>_price[<?php echo $method['key'];?>]" value="<?php if (isset($pochtaros_price[$method['key']])) echo $pochtaros_price[$method['key']]; ?>" id="input-price" class="form-control" />
                                <?php if (isset($error_price[$method['key']]) and !empty($error_price[$method['key']])) { ?>
                                <div class="text-danger"><?php echo error_number; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-max-products"><?php echo $entry_max_products; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="<?php echo $name; ?>_max_products[<?php echo $method['key'];?>]" value="<?php if (isset($pochtaros_max_products[$method['key']])) echo $pochtaros_max_products[$method['key']]; ?>" id="input-max-products" class="form-control" />
                                <?php if (isset($error_max_products[$method['key']]) and !empty($error_max_products[$method['key']])) { ?>
                                <div class="text-danger"><?php echo $error_max_products[$method['key']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-min-order"><?php echo $entry_min_order; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="<?php echo $name; ?>_min_order[<?php echo $method['key'];?>]" value="<?php if (isset($pochtaros_min_order[$method['key']])) echo $pochtaros_min_order[$method['key']]; ?>" id="input-min-order" class="form-control" />
                                <?php if (isset($error_min_order[$method['key']]) and !empty($error_min_order[$method['key']])) { ?>
                                <div class="text-danger"><?php echo $error_min_order[$method['key']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-max-order"><?php echo $entry_max_order; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="<?php echo $name; ?>_max_order[<?php echo $method['key'];?>]" value="<?php if (isset($pochtaros_max_order[$method['key']])) echo $pochtaros_max_order[$method['key']]; ?>" id="input-max-order" class="form-control" />
                                <?php if (isset($error_max_order[$method['key']]) and !empty($error_max_order[$method['key']])) { ?>
                                <div class="text-danger"><?php echo $error_max_order[$method['key']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-min-weight2"><?php echo $entry_min_weight2; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="<?php echo $name; ?>_min_weight2[<?php echo $method['key'];?>]" value="<?php if (isset($pochtaros_min_weight2[$method['key']])) echo $pochtaros_min_weight2[$method['key']]; ?>" id="input-min-weight2" class="form-control" />
                                <?php if (isset($error_min_weight2[$method['key']]) and !empty($error_min_weight2[$method['key']])) { ?>
                                <div class="text-danger"><?php echo $error_min_weight2[$method['key']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-max-weight2"><?php echo $entry_max_weight2; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="<?php echo $name; ?>_max_weight2[<?php echo $method['key'];?>]" value="<?php if (isset($pochtaros_max_weight2[$method['key']])) echo $pochtaros_max_weight2[$method['key']]; ?>" id="input-max-weight2" class="form-control" />
                                <?php if (isset($error_max_weight2[$method['key']]) and !empty($error_max_weight2[$method['key']])) { ?>
                                <div class="text-danger"><?php echo $error_max_weight2[$method['key']]; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-incity"><span data-toggle="tooltip" title="<?php echo $help_incity; ?>"><?php echo $entry_incity; ?></span></label>
                            <div class="col-sm-10">
                                <textarea name="<?php echo $name; ?>_incity[<?php echo $method['key'];?>]" rows="5" id="input-incity" class="form-control"><?php if (isset($pochtaros_incity[$method['key']])) echo $pochtaros_incity[$method['key']]; ?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-outcity"><span data-toggle="tooltip" title="<?php echo $help_outcity; ?>"><?php echo $entry_outcity; ?></span></label>
                            <div class="col-sm-10">
                                <textarea name="<?php echo $name; ?>_outcity[<?php echo $method['key'];?>]" rows="5" id="input-outcity" class="form-control"><?php if (isset($pochtaros_outcity[$method['key']])) echo $pochtaros_outcity[$method['key']]; ?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
                            <div class="col-sm-10">
                                <textarea name="<?php echo $name; ?>_description[<?php echo $method['key'];?>]" rows="5" id="input-description" class="form-control"><?php if (isset($pochtaros_description[$method['key']])) echo $pochtaros_description[$method['key']]; ?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <?php
                                foreach ($languages as $language) {
                                    if ($language['status'] == 1) {
                                    ?>
                                    <div class="input-group pull-left"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
                                    <select name="<?php echo $name; ?>_mstatus[<?php echo $method['key'];?>][<?php echo $language['language_id']; ?>]" class="form-control">
                                    <?php if ($pochtaros_mstatus[$method['key']][$language['language_id']]) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php }
                                            else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select></div>
                                    <?php
                                        }
                                    }
                                ?>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="hidden" name="<?php echo $name; ?>_license" size="50" value="<?php if (isset($pochtaros_license)) echo $pochtaros_license; ?>" >

</form>
</div>
</div>
</div>

<script type="text/javascript"><!--
    <?php foreach ($languages as $language) { ?>
        $('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
    <?php } ?>

    $('#language a:first').tab('show');
    $('#methods a:first').tab('show');
//--></script></div>

<?php echo $footer; ?>