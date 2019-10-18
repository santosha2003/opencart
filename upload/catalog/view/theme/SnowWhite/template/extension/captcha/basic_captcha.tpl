<fieldset>
  <div class="form-group required">
    <?php if (substr($route, 0, 9) == 'checkout/') { ?>
    <label class="control-label" for="input-payment-captcha"><?php echo $entry_captcha; ?></label>
    <input type="text" name="captcha" id="input-payment-captcha" class="form-control" autocomplete="off" />
    <img src="index.php?route=extension/captcha/basic_captcha/captcha" alt="" />
    <?php } else { ?>
    <label class="col-sm-12 control-label np-l" for="input-captcha">Введите код, указанный на картинке:</label>
    <div class="col-sm-10 np-l captcha-inputs">
	  <img src="index.php?route=extension/captcha/basic_captcha/captcha" alt="" />
      <input type="text" name="captcha" id="input-captcha" class="form-control" />
      <?php if ($error_captcha) { ?>
      <div class="text-danger"><?php echo $error_captcha; ?></div>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
</fieldset>
