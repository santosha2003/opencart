<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-account" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
                    <fieldset>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="easy_blog_home_page_name" value="<?php echo $easy_blog_home_page_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                                <?php if ($error_name) { ?>
                                <div class="text-danger"><?php echo $error_name; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-blog-limit"><span data-toggle="tooltip" title="<?php echo $help_article_limit; ?>"><?php echo $entry_article_limit; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="easy_blog_global_article_limit" value="<?php echo $easy_blog_global_article_limit; ?>" placeholder="<?php echo $entry_article_limit; ?>" id="input-blog-limit" class="form-control" />
                                <?php if ($error_article_limit) { ?>
                                <div class="text-danger"><?php echo $error_article_limit; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-blog-meta-title"><span><?php echo $entry_meta_title; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="easy_blog_home_page_meta_title" value="<?php echo $easy_blog_home_page_meta_title; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-blog-meta-title" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-blog-meta-description"><span><?php echo $entry_meta_description; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="easy_blog_home_page_meta_description" value="<?php echo $easy_blog_home_page_meta_description; ?>" placeholder="<?php echo $entry_meta_description; ?>" id="input-blog-meta-description" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-blog-meta-keyword"><span><?php echo $entry_meta_keyword; ?></span></label>
                            <div class="col-sm-10">
                                <input type="text" name="easy_blog_home_page_meta_keyword" value="<?php echo $easy_blog_home_page_meta_keyword; ?>" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-blog-meta-keyword" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="easy_blog_global_status" id="input-status" class="form-control">
                                    <?php if ($easy_blog_global_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>