<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-rbs" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_settings; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-rbs" class="form-horizontal">

                    <!-- Статус: Включен/Выключен -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_status; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_status" class="form-control">
                                <option value="1" <?php echo $rbs_status == 1 ? 'selected="selected"' : ''; ?>><?php echo $status_enabled; ?></option>
                                <option value="0" <?php echo $rbs_status == 0 ? 'selected="selected"' : ''; ?>><?php echo $status_disabled; ?></option>
                            </select>
                        </div>
                    </div>

                    <!-- Логин продавца -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="">
                            <?php echo $entry_merchantLogin; ?>
                        </label>
                        <div class="col-sm-9">
                            <input type="text" name="rbs_merchantLogin" value="<?php echo $rbs_merchantLogin; ?>" class="form-control" />
                        </div>
                    </div>

                    <!-- Пароль продавца -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="">
                            <?php echo $entry_merchantPassword; ?>
                        </label>
                        <div class="col-sm-9">
                            <input type="password" name="rbs_merchantPassword" value="<?php echo $rbs_merchantPassword; ?>" class="form-control" />
                        </div>
                    </div>

                    <!-- Режим работы модуля: Тестовый/БоевойРежим работы модуля: Тестовый/Боевой -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_mode; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_mode" class="form-control">
                                <option value="test" <?php echo $rbs_mode == 'test' ? 'selected="selected"' : ''; ?>><?php echo $mode_test; ?></option>
                                <option value="prod" <?php echo $rbs_mode == 'prod' ? 'selected="selected"' : ''; ?>><?php echo $mode_prod; ?></option>
                            </select>
                        </div>
                    </div>

                    <!-- Стадийность платежа: одностадийный/двустадийный -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_stage; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_stage" class="form-control">
                                <option value="one" <?php echo $rbs_stage == 'one' ? 'selected="selected"' : ''; ?>><?php echo $stage_one; ?></option>
                                <option value="two" <?php echo $rbs_stage == 'two' ? 'selected="selected"' : ''; ?>><?php echo $stage_two; ?></option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                        <div class="col-sm-9">
                            <select name="rbs_order_status_id" id="input-order-status" class="form-control">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <?php if ($order_status['order_status_id'] == $rbs_order_status_id) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>


                    <!-- Логирование: Включено/Выключено -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_logging; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_logging" class="form-control">
                                <option value="1" <?php echo $rbs_logging == 1 ? 'selected="selected"' : ''; ?>><?php echo $logging_enabled; ?></option>
                                <option value="0" <?php echo $rbs_logging == 0 ? 'selected="selected"' : ''; ?>><?php echo $logging_disabled; ?></option>
                            </select>
                        </div>
                    </div>

                    <!-- Выбор валюты -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_currency; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_currency" class="form-control">
                                <?php foreach ($currency_list as $currency) { ?>
                                    <option value="<?php echo $currency['numeric']; ?>" <?php echo $currency['numeric'] == $rbs_currency ? 'selected="selected"' : '';?>>
                                        <?php echo $currency['numeric'] == 0 ? $currency['alphabetic'] : $currency['alphabetic'] . ' (' . $currency['numeric'] . ')'; ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <!-- Фискализация: Включено/Выключено -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_ofdStatus; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_ofd_status" class="form-control">
                                <option value="1" <?php echo $rbs_ofd_status == 1 ? 'selected="selected"' : ''; ?>><?php echo $ofd_enabled; ?></option>
                                <option value="0" <?php echo $rbs_ofd_status == 0 ? 'selected="selected"' : ''; ?>><?php echo $ofd_disabled; ?></option>
                            </select>
                        </div>
                    </div>

                    <!-- Система налогообложения -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_taxSystem; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_taxSystem" class="form-control">
                                <?php foreach ($taxSystem_list as $taxSystem) { ?>
                                <option value="<?php echo $taxSystem['numeric']; ?>" <?php echo $taxSystem['numeric'] == $rbs_taxSystem ? 'selected="selected"' : '';?>>
                                <?php echo $taxSystem['numeric'] == 0 ? $taxSystem['alphabetic'] : $taxSystem['alphabetic']; ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <!-- Ставка НДС -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_taxType; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_taxType" class="form-control">
                                <?php foreach ($taxType_list as $taxType) { ?>
                                <option value="<?php echo $taxType['numeric']; ?>" <?php echo $taxType['numeric'] == $rbs_taxType ? 'selected="selected"' : '';?>>
                                <?php echo $taxType['numeric'] == 0 ? $taxType['alphabetic'] : $taxType['alphabetic']; ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>


                    <!--
                     Формат версии фискальных документов
                     Формат версии требуется указать в личном кабинете банка и в кабинете сервиса фискализации.
                     -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_ffdVersionFormat; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_ffdVersion" class="form-control">
                                <?php foreach ($ffd_versionList as $ffd_version) { ?>
                                <option value="<?php echo $ffd_version['value']; ?>" <?php echo $ffd_version['value'] == $rbs_ffdVersion ? 'selected="selected"' : '';?>>
                                <?php echo $ffd_version['value'] == 0 ? $ffd_version['title'] : $ffd_version['title']; ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>


                    <!-- method -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_paymentMethod; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_paymentMethodType" class="form-control">
                                <?php foreach ($ffd_paymentMethodTypeList as $ffd_paymentMethodType) { ?>
                                <option value="<?php echo $ffd_paymentMethodType['numeric']; ?>" <?php echo $ffd_paymentMethodType['numeric'] == $rbs_paymentMethodType ? 'selected="selected"' : '';?>>
                                <?php echo $ffd_paymentMethodType['numeric'] == 0 ? $ffd_paymentMethodType['alphabetic'] : $ffd_paymentMethodType['alphabetic']; ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <!-- object -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">
                            <?php echo $entry_paymentObject; ?>
                        </label>
                        <div class="col-sm-9">
                            <select name="rbs_paymentObjectType" class="form-control">
                                <?php foreach ($ffd_paymentObjectTypeList as $ffd_paymentObjectType) { ?>
                                <option value="<?php echo $ffd_paymentObjectType['numeric']; ?>" <?php echo $ffd_paymentObjectType['numeric'] == $rbs_paymentObjectType ? 'selected="selected"' : '';?>>
                                <?php echo $ffd_paymentObjectType['numeric'] == 0 ? $ffd_paymentObjectType['alphabetic'] : $ffd_paymentObjectType['alphabetic']; ?>
                                </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>


                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>