<fieldset class="filters"><legend><div class="pull-right" style="font-size:13px; color:#666"><?php echo $_language->get('total_export_items'); ?> <span class="export_number badge clearblue"></span></div><?php echo $_language->get('export_filters'); ?></legend>

  <div class="row">
    <div class="col-sm-6">
      <div class="form-group">
        <label class="control-label"><?php echo $_language->get('filter_store'); ?></label>
        <div class="input-group">
        <span class="input-group-addon"><i class="fa fa-home"></i></span>
        <select class="form-control" name="filter_store">
          <?php foreach ($stores as $store) { ?>
            <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
          <?php } ?>
        </select>
        </div>
      </div>
    </div>
    
    
    
    <div class="col-sm-6">
      <div class="form-group">
        <label class="control-label"><span data-toggle="tooltip" title="<?php echo $_language->get('filter_limit_i'); ?>"><?php echo $_language->get('filter_limit'); ?></span></label>
        <div class="input-group">
        <input type="text" class="form-control" name="filter-start" placeholder="<?php echo $_language->get('filter_limit_start'); ?>" />
        <span class="input-group-addon">-</span>
        <input type="text" class="form-control" name="filter-limit" placeholder="<?php echo $_language->get('filter_limit_limit'); ?>"/>
        </div>
      </div>
    </div>
  </div>
  
  <hr />

</fieldset>

<div class="spacer"></div>

<script type="text/javascript">
getTotalExportCount();
</script>