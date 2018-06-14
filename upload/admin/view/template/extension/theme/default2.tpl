<?php
/**
 * @package     default2 Theme
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2016, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

echo $header;
echo $column_left; ?>

<div id="content">
<ul class="uk-breadcrumb uk-margin-medium-bottom">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php if ($breadcrumb['href']) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>" class="uk-link"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } else { ?>
            <li class="<?php echo ($breadcrumb['class'] == 'active') ? 'uk-active' : ''; ?>"><span><?php echo $breadcrumb['text']; ?></span></li>
        <?php } ?>
    <?php } ?>
</ul>

<div class="uk-container uk-container-center">
<form id="js-app-form" action="<?php echo $form_action; ?>" method="post" class="uk-form">

<div class="uk-grid app-header">
    <div class="uk-width-1-3">
        <h2 class="app-title">
            <?php echo $theme_name; ?>
            <span class="uk-text-medium">v<?php echo $theme_version; ?></span>
        </h2>
    </div>
    <div class="uk-width-2-3">
        <div class="app-action uk-float-right">
            <div id="js-theme-status" class="uk-display-inline <?php echo $preset_id != $active_preset_id ? 'uk-hidden' : ''; ?>">
                <?php echo $text_status; ?>
                <select name="config[<?php echo $theme_folder; ?>_status]" class="uk-form-small uk-margin-right">
                    <option value="1" <?php echo $form['config'][$theme_folder.'_status'] ? 'selected' : ''; ?>><?php echo $text_enabled; ?></option>
                    <option value="0" <?php echo !$form['config'][$theme_folder.'_status'] ? 'selected' : ''; ?>><?php echo $text_disabled; ?></option>
                </select>
            </div>
            <div class="uk-display-inline">
                <?php echo $text_preset; ?>
                <select name="preset_id" class="uk-form-small uk-margin-right preset-select">
                    <?php foreach ($all_presets as $group => $presets) { ?>
                        <optgroup label="<?php echo $group; ?>">
                            <?php foreach ($presets as $preset) { ?>
                                <option value="<?php echo $preset['preset_id']; ?>" class="<?php echo !$preset['is_protected'] ? 'preset-select-item' : ''; ?>" <?php echo ($preset['preset_id'] == $preset_id) ? 'selected' : ''; ?>><?php echo ($preset['preset_id'] == $active_preset_id) ? '[v]' : ''; ?> <?php echo $preset['preset_name']; ?></option>
                            <?php } ?>
                        </optgroup>
                    <?php } ?>
                </select>
            </div>
        </div>
    </div>
</div>

<?php foreach ($alerts as $alert) { ?>
    <?php if (isset(${'alert_' . $alert})) { ?>
        <div class="uk-alert uk-alert-<?php echo $alert; ?>" data-uk-alert>
            <a class="uk-alert-close uk-close"></a>
            <p><?php echo ${'alert_' . $alert}; ?></p>
        </div>
    <?php } ?>
<?php } ?>

<div class="et-content-border">
    <div id="et-content">

    <div class="uk-grid">
        <div class="uk-width-1-1">
            <div class="uk-panel preset-panel">
                <h3 class="preset-title uk-margin-remove uk-float-left">
                    <i class="uk-icon-qrcode uk-icon-nano"></i>
                    <input type="text" name="preset_name" value="<?php echo $form['preset_name'] ?>" class="uk-form-blank" data-uk-tooltip="{pos:'right'}" title="<?php echo $text_preset_name; ?>">
                </h3>

                <div class="uk-float-right save-action">
                    <?php if ($form['is_protected']) { ?>
                        <a id="js-actionNew" class="uk-button uk-button-primary"><i class="uk-icon-file-o uk-icon-nano"></i> <?php echo $text_new; ?></a>
                        <a id="js-actionCopy" class="uk-button"><i class="uk-icon-copy uk-icon-nano"></i> <?php echo $text_save_as_copy; ?></a>
                        <a href="<?php echo $url_close; ?>" class="uk-button uk-margin-small-left"><i class="uk-icon-times uk-icon-nano"></i> <?php echo $text_close; ?></a>
                    <?php } else { ?>
                        <a id="js-actionSave" class="uk-button uk-button-success"><i class="uk-icon-save uk-icon-nano"></i> <?php echo $text_save; ?></a>
                        <div class="uk-button-dropdown" data-uk-dropdown="">
                            <a class="uk-button"><i class="uk-icon-qrcode uk-icon-nano"></i> <?php echo $text_preset; ?></a>
                            <div class="uk-dropdown uk-dropdown-small uk-dropdown-flip">
                                <ul class="uk-nav uk-nav-dropdown">
                                    <li><a id="js-actionNew"><i class="uk-icon-file-o"></i> <?php echo $text_new; ?></a></li>
                                    <li><a id="js-actionCopy"><i class="uk-icon-copy"></i> <?php echo $text_save_as_copy; ?></a></li>
                                    <li class="uk-nav-divider"></li>
                                    <li><a id="js-actionDelete"><i class="uk-icon-trash-o"></i> <?php echo $text_delete; ?></a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="uk-margin-small-left uk-display-inline-block">
                            <?php if ($preset_id != $active_preset_id) { ?>
                                <a id="js-actionActivate" class="uk-button uk-button-primary" data-uk-tooltip="{pos:'bottom-right'}" title="<?php echo $text_activate_preset; ?>"><i class="uk-icon-check-circle uk-icon-nano"></i> <?php echo $text_activate; ?></a>
                            <?php } ?>
                            <a href="<?php echo $url_close; ?>" class="uk-button"><i class="uk-icon-times uk-icon-nano"></i> <?php echo $text_close; ?></a>
                        </div>
                    <?php } ?>
                </div>

                <div class="uk-hidden">
                    <input type="hidden" id="is-activate" name="is_activate" value="<?php echo ($preset_id == $active_preset_id) ? 1 : 0; ?>">
                    <input type="hidden" id="active-preset-id" name="active_preset_id" value="<?php echo $active_preset_id; ?>">
                    <input type="hidden" name="is_protected" value="<?php echo $form['is_protected']; ?>">
                </div>
            </div>

            <div class="uk-divider uk-margin-medium-bottom"></div>

            <div class="uk-grid content-setting">
                <div class="uk-width-7-40 et-sidebar-tab">
                    <ul id="tab-nav" class="uk-tab uk-tab-left" data-uk-tab="{connect:'#content-main'}">
                        <li><a><?php echo $text_styling; ?></a></li>
                        <li><a><?php echo $text_page_option; ?></a></li>
                        <li><a><?php echo $text_block_position; ?></a></li>
                        <li><a><?php echo $text_custom_style; ?></a></li>
                        <li><a><?php echo $text_about; ?></a></li>
                    </ul>
                </div>
                <div class="uk-width-33-40 uk-form-horizontal et-label-narrow">
                    <div id="content-main" class="uk-switcher">
                        <!-- Styling -->
                        <div class="uk-animation-fade tab-styling et-form-striped-row">
                            <h2 class="uk-section"><?php echo $text_typography; ?></h2>

                            <div class="uk-form-row">
                                <label class="uk-form-label" for="heading-font"><?php echo $text_heading_font; ?></label>
                                <div class="uk-form-controls">
                                    <select name="font_header" id="heading-font" class="uk-width-9-20">
                                        <?php foreach ($fonts as $key => $font) { ?>
                                            <optgroup label="<?php echo $key; ?>">
                                                <?php foreach ($font as $key => $value) { ?>
                                                    <option value="<?php echo $key; ?>" <?php echo ($key == $form['font_header']) ? 'selected' : ''; ?>><?php echo $value; ?></option>
                                                <?php } ?>
                                            </optgroup>
                                        <?php } ?>
                                    </select>
                                    <div class="et-form-help et-form-help-right"><?php echo $text_heading_font_help; ?></div>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="base-font"><?php echo $text_body_font; ?></label>
                                <div class="uk-form-controls">
                                    <select name="font_base" id="base-font" class="uk-width-9-20">
                                        <?php foreach ($fonts as $key => $font) { ?>
                                            <optgroup label="<?php echo $key; ?>">
                                                <?php foreach ($font as $key => $value) { ?>
                                                    <option value="<?php echo $key; ?>" <?php echo ($key == $form['font_base']) ? 'selected' : ''; ?>><?php echo $value; ?></option>
                                                <?php } ?>
                                            </optgroup>
                                        <?php } ?>
                                    </select>
                                    <div class="et-form-help et-form-help-right"><?php echo $text_body_font_help; ?></div>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="font-size"><?php echo $text_font_size; ?></label>
                                <div class="uk-form-controls">
                                    <input type="text" id="font-size" name="font_size" value="<?php echo $form['font_size'] ?>" placeholder="14px" class="uk-width-1-10">
                                    <div class="et-form-help et-form-help-right"><?php echo $text_font_size_help; ?></div>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="font-color"><?php echo $text_font_color; ?></label>
                                <div class="uk-form-controls">
                                    <input type="text" id="font-color" name="font_color" value="<?php echo $form['font_color'] ?>" placeholder="#383838" class="js-minicolors">
                                    <div class="et-form-help et-form-help-right"><?php echo $text_font_color_help; ?></div>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="link-color"><?php echo $text_link_color; ?></label>
                                <div class="uk-form-controls">
                                    <input type="text" id="link-color" name="link_color" value="<?php echo $form['link_color'] ?>" placeholder="#4365e0" class="js-minicolors">
                                    <div class="et-form-help et-form-help-right"><?php echo $text_link_color_help; ?></div>
                                </div>
                            </div>

                            <h2 class="uk-section"><?php echo $text_btn; ?></h2>
                            <div class="uk-form-row">
                                <div class="uk-form-controls">
                                    <div class="uk-width-1-6 uk-text-center uk-text-bold uk-float-left"><?php echo $text_btn_text; ?></div>
                                    <div class="uk-width-2-6 uk-text-center uk-text-bold uk-float-left"><?php echo $text_btn_background; ?></div>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="btn-primary-color"><?php echo $text_btn_primary; ?></label>
                                <div class="uk-form-controls">
                                    <div class="uk-width-1-4 uk-float-left">
                                        <input type="text" id="btn-primary-color" name="btn_primary_color" value="<?php echo $form['btn_primary_color'] ?>" placeholder="#fff" class="js-minicolors">
                                    </div>
                                    <div class="uk-width-1-4 uk-float-left">
                                        <input type="text" id="btn-primary-bg" name="btn_primary_bg" value="<?php echo $form['btn_primary_bg'] ?>" placeholder="#4365e0" class="js-minicolors">
                                    </div>
                                    <div class="et-form-help et-form-help-right"><?php echo $text_btn_primary_help; ?></div>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="btn-cart-color"><?php echo $text_btn_cart; ?></label>
                                <div class="uk-form-controls">
                                    <div class="uk-width-1-4 uk-float-left">
                                        <input type="text" id="btn-cart-color" name="btn_cart_color" value="<?php echo $form['btn_cart_color'] ?>" placeholder="#fff" class="js-minicolors">
                                    </div>
                                    <div class="uk-width-1-4 uk-float-left">
                                        <input type="text" id="btn-cart-bg" name="btn_cart_bg" value="<?php echo $form['btn_cart_bg'] ?>" placeholder="#4365e0" class="js-minicolors">
                                    </div>
                                    <div class="et-form-help et-form-help-right"><?php echo $text_btn_cart_help; ?></div>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="btn-wishlist-color"><?php echo $text_btn_wishlist; ?></label>
                                <div class="uk-form-controls">
                                    <div class="uk-width-1-4 uk-float-left">
                                        <input type="text" id="btn-wishlist-color" name="btn_wishlist_color" value="<?php echo $form['btn_wishlist_color'] ?>" placeholder="#383838" class="js-minicolors">
                                    </div>
                                    <div class="uk-width-1-4 uk-float-left">
                                        <input type="text" id="btn-wishlist-bg" name="btn_wishlist_bg" value="<?php echo $form['btn_wishlist_bg'] ?>" placeholder="#fff" class="js-minicolors">
                                    </div>
                                    <div class="et-form-help et-form-help-right"><?php echo $text_btn_wishlist_help; ?></div>
                                </div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label" for="btn-compare-color"><?php echo $text_btn_compare; ?></label>
                                <div class="uk-form-controls">
                                    <div class="uk-width-1-4 uk-float-left">
                                        <input type="text" id="btn-compare-color" name="btn_compare_color" value="<?php echo $form['btn_compare_color'] ?>" placeholder="#383838" class="js-minicolors">
                                    </div>
                                    <div class="uk-width-1-4 uk-float-left">
                                        <input type="text" id="btn-compare-bg" name="btn_compare_bg" value="<?php echo $form['btn_compare_bg'] ?>" placeholder="#fff" class="js-minicolors">
                                    </div>
                                    <div class="et-form-help et-form-help-right"><?php echo $text_btn_compare_help; ?></div>
                                </div>
                            </div>
                        </div>

                        <!-- Layout Option -->
                        <div class="uk-animation-fade tab-template">
                            <ul class="uk-tab" data-uk-tab="{connect:'#content-templates'}">
                                <li><a><?php echo $text_site_layout; ?></a></li>
                                <li><a><?php echo $text_category; ?></a></li>
                                <li><a><?php echo $text_product; ?></a></li>
                                <li><a><?php echo $text_contact; ?></a></li>
                                <li><a><?php echo $text_404_notfound; ?></a></li>
                                <li><a><?php echo $text_other; ?></a></li>
                            </ul>

                            <div id="content-templates" class="uk-switcher uk-margin-medium-top">
                                <!-- Site Layout -->
                                <div class="uk-animation-fade">
                                    <h2 class="uk-section"><?php echo $text_template; ?></h2>
                                    <p class="et-form-help"><?php echo $text_site_template_help; ?></p>

                                    <div class="uk-button-group uk-button-layout-chooser" data-uk-button-radio>
                                        <label for="template-site-1" class="uk-button <?php echo ($form['template_site'] == 'full') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-site-full.png" alt=""></label>
                                        <label for="template-site-2" class="uk-button <?php echo ($form['template_site'] == 'wide') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-site-wide.png" alt=""></label>
                                        <label for="template-site-3" class="uk-button <?php echo ($form['template_site'] == 'boxed') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-site-boxed.png" alt=""></label>
                                        <label for="template-site-4" class="uk-button <?php echo ($form['template_site'] == 'framed') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-site-framed.png" alt=""></label>
                                    </div>
                                    <div class="uk-hidden">
                                        <input type="radio" id="template-site-1" name="template_site" value="full" <?php echo ($form['template_site'] == 'full') ? 'checked' : ''; ?>>
                                        <input type="radio" id="template-site-2" name="template_site" value="wide" <?php echo ($form['template_site'] == 'wide') ? 'checked' : ''; ?>>
                                        <input type="radio" id="template-site-3" name="template_site" value="boxed" <?php echo ($form['template_site'] == 'boxed') ? 'checked' : ''; ?>>
                                        <input type="radio" id="template-site-4" name="template_site" value="framed" <?php echo ($form['template_site'] == 'framed') ? 'checked' : ''; ?>>
                                    </div>
                                    <div class="uk-grid uk-text-center">
                                        <div class="uk-width-1-4"><?php echo $text_fullwidth; ?></div>
                                        <div class="uk-width-1-4"><?php echo $text_wide; ?></div>
                                        <div class="uk-width-1-4"><?php echo $text_boxed; ?></div>
                                        <div class="uk-width-1-4"><?php echo $text_framed; ?></div>
                                    </div>

                                    <h2 class="uk-section"><?php echo $text_viewport; ?></h2>
                                    <p class="et-form-help"><?php echo $text_viewport_help; ?></p>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="container-tablet"><?php echo $text_tablet; ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" name="container_tablet" value="<?php echo $form['container_tablet'] ?>" placeholder="750px" id="container-tablet" class="uk-width-3-20">
                                            <div class="et-form-help et-form-help-right"><?php echo $text_tablet_screen; ?></div>
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="container-desktop"><?php echo $text_desktop; ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" name="container_desktop" value="<?php echo $form['container_desktop'] ?>" placeholder="970px" id="container-desktop" class="uk-width-3-20">
                                            <div class="et-form-help et-form-help-right"><?php echo $text_desktop_screen; ?></div>
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="container-xdesktop"><?php echo $text_xdesktop; ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" name="container_xdesktop" value="<?php echo $form['container_xdesktop'] ?>" placeholder="1100px" id="container-xdesktop" class="uk-width-3-20">
                                            <div class="et-form-help et-form-help-right"><?php echo $text_xdesktop_screen; ?></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Category -->
                                <div class="uk-animation-fade">
                                    <h2 class="uk-section"><?php echo $text_template; ?></h2>
                                    <p class="et-form-help"><?php echo $text_cat_template_help; ?></p>

                                    <div class="uk-button-group uk-button-layout-chooser" data-uk-button-radio>
                                        <label for="template-category-1" class="uk-button <?php echo ($form['template_category'] == '1') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-category-1.png" alt=""></label>
                                        <label for="template-category-2" class="uk-button <?php echo ($form['template_category'] == '2') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-category-2.png" alt=""></label>
                                    </div>
                                    <div class="uk-hidden">
                                        <input type="radio" id="template-category-1" name="template_category" value="1" <?php echo ($form['template_category'] == '1') ? 'checked' : ''; ?>>
                                        <input type="radio" id="template-category-2" name="template_category" value="2" <?php echo ($form['template_category'] == '2') ? 'checked' : ''; ?>>
                                    </div>
                                    <div class="uk-grid uk-text-center">
                                        <div class="uk-width-1-4"><?php echo $text_hash1; ?></div>
                                        <div class="uk-width-1-4"><?php echo $text_hash2; ?></div>
                                    </div>

                                    <h4><?php echo $text_specific_template; ?></h4>
                                    <p class="et-form-help"><?php echo $text_specific_cat_template_help; ?></p>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="template-category-specific-1"><?php echo $text_template_1; ?></label>
                                        <div class="uk-form-controls autocomplete-category" data-autocomplete="1">
                                            <input type="text" id="template-category-specific-1" autocomplete="off" placeholder="<?php echo $text_search; ?>" class="uk-width-1-2 autocomplete-search">
                                            <div class="uk-scrollable-box uk-width-9-10 uk-margin-top">
                                                <ul class="uk-list uk-list-striped autocomplete-placeholder">
                                                    <?php foreach ($form['template_category_specific_1'] as $category) { ?>
                                                        <li id="autocomplete-item-<?php echo $category['id']; ?>"><i class="uk-icon-minus-square"></i> <label><input type="hidden" name="template_category_specific_1[]" value="<?php echo $category['id']; ?>"> <?php echo $category['name']; ?></label></li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="template-category-specific-1"><?php echo $text_template_2; ?></label>
                                        <div class="uk-form-controls autocomplete-category" data-autocomplete="2">
                                            <input type="text" id="template-category-specific-2" autocomplete="off" placeholder="<?php echo $text_search; ?>" class="uk-width-1-2 autocomplete-search">
                                            <div class="uk-scrollable-box uk-width-9-10 uk-margin-top">
                                                <ul class="uk-list uk-list-striped autocomplete-placeholder">
                                                    <?php foreach ($form['template_category_specific_2'] as $category) { ?>
                                                        <li id="autocomplete-item-<?php echo $category['id']; ?>"><i class="uk-icon-minus-square"></i> <label><input type="hidden" name="template_category_specific_2[]" value="<?php echo $category['id']; ?>"> <?php echo $category['name']; ?></label></li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <h2 class="uk-section"><?php echo $text_option; ?></h2>
                                    <p class="et-form-help"><?php echo $text_option_cat_template_help; ?></p>
                                    <div class="et-label-reset">
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $theme_folder; ?>_product_limit"><?php echo $text_product_perpage; ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="<?php echo $theme_folder; ?>_product_limit" name="config[<?php echo $theme_folder; ?>_product_limit]" value="<?php echo $form['config'][$theme_folder . '_product_limit']; ?>" class="uk-width-1-10">
                                            </div>
                                        </div>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $theme_folder; ?>_product_description_length"><?php echo $text_product_teaser; ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="<?php echo $theme_folder; ?>_product_description_length" name="config[<?php echo $theme_folder; ?>_product_description_length]" value="<?php echo $form['config'][$theme_folder . '_product_description_length']; ?>" class="uk-width-1-10">
                                            </div>
                                        </div>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_category_width"><?php echo $text_image_category_size ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="<?php echo $theme_folder; ?>_image_category_width" name="config[<?php echo $theme_folder; ?>_image_category_width]" value="<?php echo $form['config'][$theme_folder . '_image_category_width']; ?>" class="uk-width-1-10"> x
                                                <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_category_height]" value="<?php echo $form['config'][$theme_folder . '_image_category_height']; ?>" class="uk-width-1-10">
                                            </div>
                                        </div>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_product_width"><?php echo $text_image_product_size ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="<?php echo $theme_folder; ?>_image_product_width" name="config[<?php echo $theme_folder; ?>_image_product_width]" value="<?php echo $form['config'][$theme_folder . '_image_product_width']; ?>" class="uk-width-1-10"> x
                                                <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_product_height]" value="<?php echo $form['config'][$theme_folder . '_image_product_height']; ?>" class="uk-width-1-10">
                                            </div>
                                        </div>

                                        <h5 class="uk-text-bold"><?php echo $text_template_1; ?></h5>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label"><?php echo $text_child_category_thumb; ?></label>
                                            <div class="uk-form-controls">
                                                <div class="uk-button-group" data-uk-button-radio>
                                                    <label for="child-category-thumb-1" class="uk-button uk-button-primary-active <?php echo ($form['child_category_thumb']) ? 'uk-active' : ''; ?>"><?php echo $text_show; ?></label>
                                                    <label for="child-category-thumb-0" class="uk-button uk-button-danger-active  <?php echo (!$form['child_category_thumb']) ? 'uk-active' : ''; ?>"><?php echo $text_hide; ?></label>
                                                </div>
                                                <div class="uk-hidden">
                                                    <input type="radio" id="child-category-thumb-1" name="child_category_thumb" value="1" <?php echo ($form['child_category_thumb']) ? 'checked' : ''; ?>>
                                                    <input type="radio" id="child-category-thumb-0" name="child_category_thumb" value="0" <?php echo (!$form['child_category_thumb']) ? 'checked' : ''; ?>>
                                                </div>
                                                <div class="et-form-help et-form-help-right"><?php echo $text_child_category_thumb_help; ?></div>
                                            </div>
                                        </div>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label"><?php echo $text_grid_product_desc; ?></label>
                                            <div class="uk-form-controls">
                                                <div class="uk-button-group" data-uk-button-radio>
                                                    <label for="grid-product-desc-1" class="uk-button uk-button-primary-active <?php echo ($form['grid_product_desc']) ? 'uk-active' : ''; ?>"><?php echo $text_show; ?></label>
                                                    <label for="grid-product-desc-0" class="uk-button uk-button-danger-active  <?php echo (!$form['grid_product_desc']) ? 'uk-active' : ''; ?>"><?php echo $text_hide; ?></label>
                                                </div>
                                                <div class="uk-hidden">
                                                    <input type="radio" id="grid-product-desc-1" name="grid_product_desc" value="1" <?php echo ($form['grid_product_desc']) ? 'checked' : ''; ?>>
                                                    <input type="radio" id="grid-product-desc-0" name="grid_product_desc" value="0" <?php echo (!$form['grid_product_desc']) ? 'checked' : ''; ?>>
                                                </div>
                                                <div class="et-form-help et-form-help-right"><?php echo $text_grid_product_desc_help; ?></div>
                                            </div>
                                        </div>

                                        <h5 class="uk-text-bold"><?php echo $text_template_2; ?></h5>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="child-thumb-size-width"><?php echo $text_child_thumb_size; ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="child-thumb-size-width" name="child_thumb_size_width" value="<?php echo $form['child_thumb_size_width']; ?>" class="uk-width-1-10"> x 
                                                <input type="text" id="" name="child_thumb_size_height" value="<?php echo $form['child_thumb_size_height']; ?>" id="bm-cat-article-feat-image2" class="uk-width-1-10">
                                                <div class="et-form-help et-form-help-right"><?php echo $text_child_thumb_size_help; ?></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Product -->
                                <div class="uk-animation-fade">
                                    <h2 class="uk-section"><?php echo $text_template; ?></h2>
                                    <p class="et-form-help"><?php echo $text_prd_template_help; ?></p>

                                    <div class="uk-button-group uk-button-layout-chooser" data-uk-button-radio>
                                        <label for="template-product-1" class="uk-button <?php echo ($form['template_product'] == '1') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-product-1.png" alt=""></label>
                                        <label for="template-product-2" class="uk-button <?php echo ($form['template_product'] == '2') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-product-2.png" alt=""></label>
                                    </div>
                                    <div class="uk-hidden">
                                        <input type="radio" id="template-product-1" name="template_product" value="1" <?php echo ($form['template_product'] == '1') ? 'checked' : ''; ?>>
                                        <input type="radio" id="template-product-2" name="template_product" value="2" <?php echo ($form['template_product'] == '2') ? 'checked' : ''; ?>>
                                    </div>
                                    <div class="uk-grid uk-text-center">
                                        <div class="uk-width-1-4"><?php echo $text_hash1; ?></div>
                                        <div class="uk-width-1-4"><?php echo $text_hash2; ?></div>
                                    </div>

                                    <h4><?php echo $text_specific_template; ?></h4>
                                    <p class="et-form-help"><?php echo $text_specific_prd_template_help; ?></p>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="template-product-specific-1"><?php echo $text_template_1; ?></label>
                                        <div class="uk-form-controls autocomplete-product" data-autocomplete="1">
                                            <input type="text" id="template-product-specific-1" autocomplete="off" placeholder="<?php echo $text_search; ?>" class="uk-width-1-2 autocomplete-search">
                                            <div class="uk-scrollable-box uk-width-9-10 uk-margin-top">
                                                <ul class="uk-list uk-list-striped autocomplete-placeholder">
                                                    <?php foreach ($form['template_product_specific_1'] as $product) { ?>
                                                        <li id="autocomplete-item-<?php echo $product['id']; ?>"><i class="uk-icon-minus-square"></i> <label><input type="hidden" name="template_product_specific_1[]" value="<?php echo $product['id']; ?>"> <?php echo $product['name']; ?></label></li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="template-product-specific-1"><?php echo $text_template_2; ?></label>
                                        <div class="uk-form-controls autocomplete-product" data-autocomplete="2">
                                            <input type="text" id="template-product-specific-1" autocomplete="off" placeholder="<?php echo $text_search; ?>" class="uk-width-1-2 autocomplete-search">
                                            <div class="uk-scrollable-box uk-width-9-10 uk-margin-top">
                                                <ul class="uk-list uk-list-striped autocomplete-placeholder">
                                                    <?php foreach ($form['template_product_specific_2'] as $product) { ?>
                                                        <li id="autocomplete-item-<?php echo $product['id']; ?>"><i class="uk-icon-minus-square"></i> <label><input type="hidden" name="template_product_specific_2[]" value="<?php echo $product['id']; ?>"> <?php echo $product['name']; ?></label></li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <h2 class="uk-section"><?php echo $text_option; ?></h2>
                                    <div class="et-label-reset">
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_thumb_width"><?php echo $text_image_thumb_size ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="<?php echo $theme_folder; ?>_image_thumb_width" name="config[<?php echo $theme_folder; ?>_image_thumb_width]" value="<?php echo $form['config'][$theme_folder . '_image_thumb_width']; ?>" class="uk-width-1-10"> x
                                                <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_thumb_height]" value="<?php echo $form['config'][$theme_folder . '_image_thumb_height']; ?>" class="uk-width-1-10">
                                            </div>
                                        </div>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_additional_width"><?php echo $text_image_additional_size ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="<?php echo $theme_folder; ?>_image_additional_width" name="config[<?php echo $theme_folder; ?>_image_additional_width]" value="<?php echo $form['config'][$theme_folder . '_image_additional_width']; ?>" class="uk-width-1-10"> x
                                                <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_additional_height]" value="<?php echo $form['config'][$theme_folder . '_image_additional_height']; ?>" class="uk-width-1-10">
                                            </div>
                                        </div>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_popup_width"><?php echo $text_image_popup_size ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="<?php echo $theme_folder; ?>_image_popup_width" name="config[<?php echo $theme_folder; ?>_image_popup_width]" value="<?php echo $form['config'][$theme_folder . '_image_popup_width']; ?>" class="uk-width-1-10"> x
                                                <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_popup_height]" value="<?php echo $form['config'][$theme_folder . '_image_popup_height']; ?>" class="uk-width-1-10">
                                            </div>
                                        </div>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_related_width"><?php echo $text_image_related_size ?></label>
                                            <div class="uk-form-controls">
                                                <input type="text" id="<?php echo $theme_folder; ?>_image_related_width" name="config[<?php echo $theme_folder; ?>_image_related_width]" value="<?php echo $form['config'][$theme_folder . '_image_related_width']; ?>" class="uk-width-1-10"> x
                                                <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_related_height]" value="<?php echo $form['config'][$theme_folder . '_image_related_height']; ?>" class="uk-width-1-10">
                                            </div>
                                        </div>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label"><?php echo $text_rel_prd_desc; ?></label>
                                            <div class="uk-form-controls">
                                                <div class="uk-button-group" data-uk-button-radio>
                                                    <label for="related-product-desc-1" class="uk-button uk-button-primary-active <?php echo ($form['related_product_desc']) ? 'uk-active' : ''; ?>"><?php echo $text_show; ?></label>
                                                    <label for="related-product-desc-0" class="uk-button uk-button-danger-active  <?php echo (!$form['related_product_desc']) ? 'uk-active' : ''; ?>"><?php echo $text_hide; ?></label>
                                                </div>
                                                <div class="uk-hidden">
                                                    <input type="radio" id="related-product-desc-1" name="related_product_desc" value="1" <?php echo ($form['related_product_desc']) ? 'checked' : ''; ?>>
                                                    <input type="radio" id="related-product-desc-0" name="related_product_desc" value="0" <?php echo (!$form['related_product_desc']) ? 'checked' : ''; ?>>
                                                </div>
                                                <div class="et-form-help et-form-help-right"><?php echo $text_rel_prd_desc_help; ?></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Contact -->
                                <div class="uk-animation-fade">
                                    <h2 class="uk-section"><?php echo $text_template; ?></h2>
                                    <p class="et-form-help"><?php echo $text_ctc_template_help; ?></p>

                                    <div class="uk-button-group uk-button-layout-chooser" data-uk-button-radio>
                                        <label for="template-contact-1" class="uk-button <?php echo ($form['template_contact'] == '1') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-contact-1.png" alt=""></label>
                                        <label for="template-contact-2" class="uk-button <?php echo ($form['template_contact'] == '2') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-contact-2.png" alt=""></label>
                                        <label for="template-contact-3" class="uk-button <?php echo ($form['template_contact'] == '3') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-contact-3.png" alt=""></label>
                                    </div>
                                    <div class="uk-hidden">
                                        <input type="radio" id="template-contact-1" name="template_contact" value="1" <?php echo ($form['template_contact'] == '1') ? 'checked' : ''; ?>>
                                        <input type="radio" id="template-contact-2" name="template_contact" value="2" <?php echo ($form['template_contact'] == '2') ? 'checked' : ''; ?>>
                                        <input type="radio" id="template-contact-3" name="template_contact" value="3" <?php echo ($form['template_contact'] == '3') ? 'checked' : ''; ?>>
                                    </div>
                                    <div class="uk-grid uk-text-center">
                                        <div class="uk-width-1-4"><?php echo $text_hash1; ?></div>
                                        <div class="uk-width-1-4"><?php echo $text_hash2; ?></div>
                                        <div class="uk-width-1-4"><?php echo $text_hash3; ?></div>
                                    </div>

                                    <h2 class="uk-section"><?php echo $text_option; ?></h2>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label"><?php echo $text_maps; ?></label>
                                        <div class="uk-form-controls">
                                            <div class="uk-button-group" data-uk-button-radio>
                                                <label for="contact-map-1" class="uk-button uk-button-primary-active <?php echo ($form['contact_map']) ? 'uk-active' : ''; ?>"><?php echo $text_show; ?></label>
                                                <label for="contact-map-0" class="uk-button uk-button-danger-active  <?php echo (!$form['contact_map']) ? 'uk-active' : ''; ?>"><?php echo $text_hide; ?></label>
                                            </div>
                                            <div class="uk-hidden">
                                                <input type="radio" id="contact-map-1" name="contact_map" value="1" <?php echo ($form['contact_map']) ? 'checked' : ''; ?>>
                                                <input type="radio" id="contact-map-0" name="contact_map" value="0" <?php echo (!$form['contact_map']) ? 'checked' : ''; ?>>
                                            </div>
                                            <div class="et-form-help et-form-help-right"><?php echo $text_ctc_map_help; ?></div>
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="mapapi"><?php echo $text_maps_api; ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" id="mapapi" name="mapapi" value="<?php echo $form['mapapi'] ?>" class="uk-width-4-10">
                                            <div class="et-form-help et-form-help-right"><?php echo $text_ctc_map_api_help; ?></div>
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="geocode"><?php echo $text_geocode; ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" id="geocode" name="geocode" value="<?php echo $form['geocode'] ?>" class="uk-width-4-10">
                                            <div class="et-form-help et-form-help-right"><?php echo $text_ctc_geocode_help; ?></div>
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_location_width"><?php echo $text_image_location_size ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" id="<?php echo $theme_folder; ?>_image_location_width" name="config[<?php echo $theme_folder; ?>_image_location_width]" value="<?php echo $form['config'][$theme_folder . '_image_location_width']; ?>" class="uk-width-1-10"> x
                                            <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_location_height]" value="<?php echo $form['config'][$theme_folder . '_image_location_height']; ?>" class="uk-width-1-10">
                                        </div>
                                    </div>
                                </div>

                                <!-- 404 -->
                                <div class="uk-animation-fade">
                                    <h2 class="uk-section"><?php echo $text_template; ?></h2>
                                    <p class="et-form-help"><?php echo $text_404_template_help; ?></p>

                                    <div class="uk-button-group uk-button-layout-chooser" data-uk-button-radio>
                                        <label for="template-404-1" class="uk-button <?php echo ($form['template_404'] == '1') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-404-1.png" alt=""></label>
                                        <label for="template-404-2" class="uk-button <?php echo ($form['template_404'] == '2') ? 'uk-active' : ''; ?>"><img src="view/stylesheet/<?php echo $theme_folder; ?>/image/layout-404-2.png" alt=""></label>
                                    </div>
                                    <div class="uk-hidden">
                                        <input type="radio" id="template-404-1" name="template_404" value="1" <?php echo ($form['template_404'] == '1') ? 'checked' : ''; ?>>
                                        <input type="radio" id="template-404-2" name="template_404" value="2" <?php echo ($form['template_404'] == '2') ? 'checked' : ''; ?>>
                                    </div>
                                    <div class="uk-grid uk-text-center">
                                        <div class="uk-width-1-4"><?php echo $text_hash1; ?></div>
                                        <div class="uk-width-1-4"><?php echo $text_hash2; ?></div>
                                    </div>
                                </div>

                                <!-- Others -->
                                <div class="uk-animation-fade et-label-reset">
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_cart_width"><?php echo $text_image_cart_size ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" id="<?php echo $theme_folder; ?>_image_cart_width" name="config[<?php echo $theme_folder; ?>_image_cart_width]" value="<?php echo $form['config'][$theme_folder . '_image_cart_width']; ?>" class="uk-width-1-10"> x
                                            <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_cart_height]" value="<?php echo $form['config'][$theme_folder . '_image_cart_height']; ?>" class="uk-width-1-10">
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_wishlist_width"><?php echo $text_image_wishlist_size ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" id="<?php echo $theme_folder; ?>_image_wishlist_width" name="config[<?php echo $theme_folder; ?>_image_wishlist_width]" value="<?php echo $form['config'][$theme_folder . '_image_wishlist_width']; ?>" class="uk-width-1-10"> x
                                            <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_wishlist_height]" value="<?php echo $form['config'][$theme_folder . '_image_wishlist_height']; ?>" class="uk-width-1-10">
                                        </div>
                                    </div>
                                    <div class="uk-form-row">
                                        <label class="uk-form-label" for="<?php echo $theme_folder; ?>_image_compare_width"><?php echo $text_image_compare_size ?></label>
                                        <div class="uk-form-controls">
                                            <input type="text" id="<?php echo $theme_folder; ?>_image_compare_width" name="config[<?php echo $theme_folder; ?>_image_compare_width]" value="<?php echo $form['config'][$theme_folder . '_image_compare_width']; ?>" class="uk-width-1-10"> x
                                            <input type="text" id="" name="config[<?php echo $theme_folder; ?>_image_compare_height]" value="<?php echo $form['config'][$theme_folder . '_image_compare_height']; ?>" class="uk-width-1-10">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!-- Block Position -->
                        <div class="uk-animation-fade tab-block-layouts">
                            <div class="uk-grid">
                                <div class="uk-width-4-10">
                                    <h2 class="uk-section"><?php echo $text_block_visual; ?></h2>

                                    <div class="block-visual">
                                        <div class="uk-grid">
                                            <div class="uk-width-1-1">
                                                <div class="uk-panel uk-panel-box" style="padding:1px 5px; border-style:dashed;">
                                                    <?php echo $text_alpha; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uk-grid">
                                            <div class="uk-width-1-2">
                                                <div class="uk-panel uk-panel-box uk-panel-box-primary" style="padding:1px 5px;">
                                                    <?php echo $text_toolbar_top_left; ?>
                                                </div>
                                            </div>
                                            <div class="uk-width-1-2">
                                                <div class="uk-panel uk-panel-box uk-panel-box-primary" style="padding:1px 5px;">
                                                    <?php echo $text_toolbar_top_right; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uk-grid" style="margin-bottom:10px;">
                                            <div class="uk-width-1-1">
                                                <div class="uk-panel uk-panel-box">
                                                    <?php echo $text_block_header; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-primary" style="padding:3px 5px;">
                                                    <?php echo $text_block_main_menu; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uk-grid" style="margin-bottom:10px;">
                                            <div class="uk-width-1-1">
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_top_a; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_top_b; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_top_c; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uk-grid" style="margin-bottom:10px;">
                                            <div class="uk-width-1-4">
                                                <div class="uk-panel uk-panel-box uk-panel-box-primary" style="padding:101px 5px;">
                                                    <?php echo $text_sidebar; ?>
                                                </div>
                                            </div>
                                            <div class="uk-width-2-4">
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_content_top_a; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_content_top_b; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-success" style="margin-bottom:8px;">
                                                    <?php echo $text_content_top; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box" style="margin-bottom:8px;">
                                                    <?php echo $text_output_content; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-success">
                                                    <?php echo $text_content_bottom; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_content_bottom_a; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_content_bottom_b; ?>
                                                </div>
                                            </div>
                                            <div class="uk-width-1-4">
                                                <div class="uk-panel uk-panel-box uk-panel-box-primary" style="padding:101px 5px;">
                                                    <?php echo $text_sidebar; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uk-grid" style="margin-bottom:10px;">
                                            <div class="uk-width-1-1">
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_bottom_a; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_bottom_b; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_bottom_c; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uk-grid">
                                            <div class="uk-width-1-1">
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger" style="padding:3px 5px;">
                                                    <?php echo $text_footer_ribbon; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_footer_a; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_footer_b; ?>
                                                </div>
                                                <div class="uk-panel uk-panel-box uk-panel-box-danger">
                                                    <?php echo $text_footer_c; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uk-grid">
                                            <div class="uk-width-1-2">
                                                <div class="uk-panel uk-panel-box uk-panel-box-primary" style="padding:1px 5px;">
                                                    <?php echo $text_toolbar_btm_left; ?>
                                                </div>
                                            </div>
                                            <div class="uk-width-1-2">
                                                <div class="uk-panel uk-panel-box uk-panel-box-primary" style="padding:1px 5px;">
                                                    <?php echo $text_toolbar_btm_right; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uk-grid">
                                            <div class="uk-width-1-1">
                                                <div class="uk-panel uk-panel-box" style="padding:1px 5px; border-style:dashed;">
                                                    <?php echo $text_omega; ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="uk-width-6-10">
                                    <h2 class="uk-section">
                                        <?php echo $text_block_options; ?>
                                        <a href="http://www.echothemes.com/docs-rhythm-block-position.html" target="_blank" class="uk-float-right"><i class="uk-icon-question-circle"></i></a>
                                    </h2>

                                    <?php foreach ($positions as $name => $title) { ?>
                                        <div class="uk-form-row">
                                            <label class="uk-form-label" for="<?php echo $name; ?>"><?php echo $title; ?></label>
                                            <div class="uk-form-controls">
                                                <select name="position_<?php echo $name; ?>" id="<?php echo $name; ?>" class="uk-width-8-10">
                                                    <?php foreach ($block_widths as $type => $blocks) { ?>
                                                        <optgroup label="<?php echo $type; ?>">
                                                            <?php foreach ($blocks as $width => $format) { ?>
                                                                <option value="<?php echo $width; ?>" <?php echo (isset($form['position_'.$name]) && $width == $form['position_'.$name]) ? 'selected' : ''; ?>><?php echo $format; ?></option>
                                                            <?php } ?>
                                                        </optgroup>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>

                        <!-- Custom Style -->
                        <div class="uk-animation-fade tab-custom-style">
                            <textarea id="custom-style" name="custom_css" rows="25"><?php echo $custom_css; ?></textarea>
                        </div>

                        <!-- About -->
                        <div class="uk-animation-fade tab-about">
                            <div class="uk-form-row">
                                <label class="uk-form-label"><?php echo $text_name; ?></label>
                                <div class="uk-form-controls"><?php echo $theme_name; ?></div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label"><?php echo $text_version; ?></label>
                                <div class="uk-form-controls"><?php echo $theme_version; ?></div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label"><?php echo $text_author; ?></label>
                                <div class="uk-form-controls"><a href="<?php echo $theme_info['author_url']; ?>" target="_blank" title="<?php echo $theme_name; ?>"><?php echo $theme_info['author']; ?></a></div>
                            </div>

                            <!-- <hr class="uk-grid-divider uk-margin-small"> -->

                            <div class="uk-form-row">
                                <label class="uk-form-label"><?php echo $text_doc; ?></label>
                                <div class="uk-form-controls"><a href="<?php echo $theme_info['docs_url']; ?>" target="_blank"><?php echo $text_doc; ?></a></div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label"><?php echo $text_support; ?></label>
                                <div class="uk-form-controls"><a href="<?php echo $theme_info['support_url']; ?>" target="_blank" title="<?php echo $text_ticket_support; ?>"><?php echo $text_ticket_support; ?></a></div>
                            </div>
                            <div class="uk-form-row">
                                <label class="uk-form-label"><?php echo $text_changelog; ?></label>
                                <div class="uk-form-controls"><a href="<?php echo $theme_info['changelog_url']; ?>" target="_blank"><?php echo $text_changelog; ?></a></div>
                            </div>

                            <hr class="uk-grid-divider uk-margin-small">

                            <p class="uk-text-small uk-text-center">Other Products by EchoThemes</p>
                            <div class="uk-grid">
                                <div class="uk-width-1-3">
                                    <a href="http://www.echothemes.com/extensions/blog-manager-2.html" target="_blank">
                                        <img src="view/stylesheet/<?php echo $theme_folder; ?>/image/opencart-blog-manager-2.png" alt="">
                                    </a>
                                </div>
                                <div class="uk-width-1-3">
                                    <a href="http://www.echothemes.com/extensions/customer-summary.html" target="_blank">
                                        <img src="view/stylesheet/<?php echo $theme_folder; ?>/image/opencart-customer-summary.png" alt="">
                                    </a>
                                </div>
                                <div class="uk-width-1-3">
                                    <a href="http://www.echothemes.com/extensions/shortcodes.html" target="_blank">
                                        <img src="view/stylesheet/<?php echo $theme_folder; ?>/image/opencart-shortcodes.png" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div> <!-- #content-main -->
                </div>
            </div> <!-- #.content-setting -->
        </div>
    </div>

    </div> <!-- /#et-content -->
</div>

<div id="et-footer">
    <a href="http://www.echothemes.com">EchoThemes</a> &copy; <?php echo date('Y'); ?>. All Rights Reserved.
    <br>Powered by <a href="http://www.echothemes.com/rhythm-framework.html" target="_blank">Rhythm Framework</a> v<?php echo RHYTHM; ?>
</div>

</form>
</div><!-- .uk-container -->

<script>
$(document).ready(function()
{
    swal.setDefaults({ confirmButtonColor: '#4365e0' });
    $('.js-minicolors').minicolors({
        control: 'hue',
        keywords: 'inherit, transparent, initial',
    });

    $('.autocomplete-category .autocomplete-search').autocomplete({
        source: function(request, response) {
            $.ajax({
                url         : 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request) + '&limit=' + 8,
                dataType    : 'json',
                success     : function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item.name,
                            value: item.category_id
                        };
                    }));
                }
            });
        },
        select: function(item) {
            var container = $(this).parent(),
                data = container.data();

            container.find('.autocomplete-search').val('');
            container.find('#autocomplete-item-' + item.value).remove();
            container.find('.autocomplete-placeholder').append('<li id="autocomplete-item-' + item.value + '"><i class="uk-icon-minus-square"></i> <label><input type="hidden" name="template_category_specific_' + data.autocomplete + '[]" value="' + item.value + '"> ' + item.label + '</label></li>');
        }
    });
    $('.autocomplete-placeholder').on('click', '.uk-icon-minus-square', function() {
        $(this).parent().remove();
    });

    $('.autocomplete-product .autocomplete-search').autocomplete({
        source: function(request, response) {
            $.ajax({
                url         : 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request) + '&limit=' + 8,
                dataType    : 'json',
                success     : function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item.name,
                            value: item.product_id
                        };
                    }));
                }
            });
        },
        select: function(item) {
            var container = $(this).parent(),
                data = container.data();

            container.find('.autocomplete-search').val('');
            container.find('#autocomplete-item-' + item.value).remove();
            container.find('.autocomplete-placeholder').append('<li id="autocomplete-item-' + item.value + '"><i class="uk-icon-minus-square"></i> <label><input type="hidden" name="template_product_specific_' + data.autocomplete + '[]" value="' + item.value + '"> ' + item.label + '</label></li>');
        }
    });

    var customStyle = CodeMirror.fromTextArea(document.getElementById('custom-style'), {
        mode: 'text/x-less',
        tabSize: 2,
        indentUnit: 2,
        lineNumbers: true,
        styleActiveLine: true,
    });
    $('#tab-nav').on('change.uk.tab', function(){
        customStyle.refresh();
    });
    customStyle.on('change', function() {
        customStyle.save();
    });

    var initialSelect = getInitPreset();
    $('.preset-select').on('change', function() {
        var data = getCurrentPreset(),
            url  = $('base').attr('href') + 'index.php?route=extension/theme/<?php echo $theme_folder; ?>&store_id=<?php echo $store_id; ?>&preset_id=' + data.preset_id + '&token=<?php echo $token; ?>';

        swal({
            title: '<?php echo $js_attention; ?>',
            text: '<?php echo $js_load_preset; ?>'.replace('{{preset_name}}', data.preset_name),
            html: true,
            showCancelButton: true,
            confirmButtonText: '<?php echo $text_continue; ?>',
            cancelButtonText: '<?php echo $text_cancel; ?>',
            closeOnConfirm: false,
        }, function(isConfirm) {
            if (isConfirm) {
                location.href = url;
            } else {
                $('.preset-select').val(initialSelect.preset_id);
            }
        });
    });

    //=====================

    $('#js-actionActivate').on('click', function() {
        var data = getCurrentPreset();

        swal({
            title: '<?php echo $js_attention; ?>',
            text: '<?php echo $js_activate_preset; ?>'.replace('{{preset_name}}', data.preset_name),
            html: true,
            showCancelButton: true,
            confirmButtonText: "<?php echo $js_confirm_yes; ?>",
            cancelButtonText: '<?php echo $text_cancel; ?>',
            closeOnConfirm: true,
        }, function(isConfirm) {
            if (isConfirm) {
                $('#js-app-form').ajaxSubmit({
                    dataType    : 'json',
                    data        : { activate: '1' },
                    beforeSend  : function (data) {
                        $.etNotify({
                            message : '<?php echo $js_general_activate; ?>',
                            icon    : 'refresh uk-icon-spin',
                            timeout : 120000,
                            clear   : true,
                        });
                    },
                    success     : function (data) {
                        if (!data.error) {
                            $('.preset-select option:contains("[v]")').each(function(){
                               $(this).text($(this).text().replace('[v] ',''));    
                            });
                            $('.preset-select option:selected').text('[v] ' + data.preset_name);

                            $('#is-activate').val(1);
                            $('#active-preset-id').val(data.preset_id);
                            $('#js-actionActivate').hide();
                            $('#js-theme-status').removeClass('uk-hidden');
                            $('.uk-alert-close').trigger('click');

                            var isThemeEnabled = $('#js-theme-status select').val();
                            if (isThemeEnabled == false) {
                                $('.app-header').after('<div class="uk-alert uk-alert-danger" data-uk-alert=""><a class="uk-alert-close uk-close"></a><p><?php echo $text_theme_not_enabled; ?></p></div>');
                            }

                            $.etNotify({
                                message : '<?php echo $js_success_activate; ?>',
                                icon    : 'check',
                                status  : 'success',
                                clear   : true,
                            });
                        } else {
                            $.etNotify({
                                message : data.errorMsg ? data.errorMsg : '<?php echo $js_general_error; ?>',
                                icon    : 'exclamation',
                                status  : data.errorStatus ? data.errorStatus : 'danger',
                                clear   : true
                            });
                        }
                    }
                });
            }
        });
    });

    $('#js-actionSave').on('click', function() {
        $('#js-app-form').ajaxSubmit({
            dataType    : 'json',
            data        : { save: '1' },
            beforeSubmit: validateBeforeSubmit,
            beforeSend  : function (data) {
                $.etNotify({
                    message : '<?php echo $js_general_saving; ?>',
                    icon    : 'refresh uk-icon-spin',
                    timeout : 120000,
                    clear   : true,
                });
            },
            success     : function (data) {
                if (!data.error) {
                    var active_preset_id = $('#active-preset-id').val(),
                        preset_name      = (data.preset_id == active_preset_id) ? '[v] ' + data.preset_name : data.preset_name;

                    $('.preset-select option:selected').text(preset_name);
                    $('.uk-alert-close').trigger('click');

                    var isThemeEnabled = $('#js-theme-status select').val();
                    if (isThemeEnabled == false) {
                        $('.app-header').after('<div class="uk-alert uk-alert-danger" data-uk-alert=""><a class="uk-alert-close uk-close"></a><p><?php echo $text_theme_not_enabled; ?></p></div>');
                    }

                    $.etNotify({
                        message : '<?php echo $js_success_save; ?>',
                        icon    : 'check',
                        status  : 'success',
                        clear   : true,
                    });
                } else {
                    $.etNotify({
                        message : data.errorMsg ? data.errorMsg : '<?php echo $js_general_error; ?>',
                        icon    : 'exclamation',
                        status  : data.errorStatus ? data.errorStatus : 'danger',
                        clear   : true
                    });
                }
            }
        });
    });

    $('#js-actionNew').on('click', function() {
        $('#js-app-form').ajaxSubmit({
            dataType    : 'json',
            data        : { newPresetId: findMaxValue('.preset-select') },
            beforeSend  : function (data) {
                $.etNotify({
                    message : '<?php echo $js_general_creating; ?>',
                    icon    : 'refresh uk-icon-spin',
                    timeout : 120000,
                    clear   : true,
                });
            },
            success     : function (data) {
                if (!data.error) {
                    $.etNotify({
                        message : '<?php echo $js_success_create; ?>',
                        icon    : 'check',
                        status  : 'success',
                        clear   : true,
                    });
                } else {
                    $.etNotify({
                        message : data.errorMsg ? data.errorMsg : '<?php echo $js_general_error; ?>',
                        icon    : 'exclamation',
                        status  : data.errorStatus ? data.errorStatus : 'danger',
                        clear   : true
                    });
                }

                if (data.redirect) {
                    $.etNotify({
                        message : '<?php echo $js_redirect; ?>',
                        icon    : 'location-arrow',
                        status  : 'primary',
                        clear   : true,
                    });
                    setTimeout(function() {
                        window.location.replace(data.redirect);
                    }, 1000);
                }
            }
        });
    });

    $('#js-actionCopy').on('click', function() {
        $('#js-app-form').ajaxSubmit({
            dataType    : 'json',
            data        : { copyPresetId: findMaxValue('.preset-select') },
            beforeSubmit: validateBeforeSubmit,
            beforeSend  : function (data) {
                $.etNotify({
                    message : '<?php echo $js_general_copying; ?>',
                    icon    : 'refresh uk-icon-spin',
                    timeout : 120000,
                    clear   : true,
                });
            },
            success     : function (data) {
                if (!data.error) {
                    $.etNotify({
                        message : '<?php echo $js_success_copy; ?>',
                        icon    : 'check',
                        status  : 'success',
                        clear   : true,
                    });
                } else {
                    $.etNotify({
                        message : data.errorMsg ? data.errorMsg : '<?php echo $js_general_error; ?>',
                        icon    : 'exclamation',
                        status  : data.errorStatus ? data.errorStatus : 'danger',
                        clear   : true
                    });
                }

                if (data.redirect) {
                    $.etNotify({
                        message : '<?php echo $js_redirect; ?>',
                        icon    : 'location-arrow',
                        status  : 'primary',
                        clear   : true,
                    });
                    setTimeout(function() {
                        window.location.replace(data.redirect);
                    }, 1000);
                }
            }
        });
    });

    $('#js-actionDelete').on('click', function() {
        var data = getCurrentPreset();

        swal({
            title: '<?php echo $js_attention; ?>',
            text: '<?php echo $js_delete_preset; ?>'.replace('{{preset_name}}', data.preset_name),
            html: true,
            showCancelButton: true,
            confirmButtonText: '<?php echo $js_confirm_yes; ?>',
            cancelButtonText: '<?php echo $text_cancel; ?>',
            closeOnConfirm: true,
        }, function(isConfirm) {
            if (isConfirm) {
                $('#js-app-form').ajaxSubmit({
                    dataType    : 'json',
                    data        : { delPresetId: 1},
                    beforeSend  : function () {
                        var isActivate  = $('#is-activate').val();

                        if (isActivate != false) {
                            $.etNotify({
                                message : '<?php echo $js_error_delete_active; ?>',
                                icon    : 'exclamation',
                                status  : 'warning',
                                timeout : 2000,
                                clear   : true
                            });
                            return false;
                        } else {
                            $.etNotify({
                                message : '<?php echo $js_general_delete; ?>',
                                icon    : 'refresh uk-icon-spin',
                                timeout : 120000,
                                clear   : true,
                            });
                        }
                    },
                    success     : function (data) {
                        if (!data.error) {
                            $.etNotify({
                                message : '<?php echo $js_success_delete; ?>',
                                icon    : 'check',
                                status  : 'success',
                                clear   : true,
                            });
                        } else {
                            $.etNotify({
                                message : data.errorMsg ? data.errorMsg : '<?php echo $js_general_error; ?>',
                                icon    : 'exclamation',
                                status  : data.errorStatus ? data.errorStatus : 'danger',
                                clear   : true
                            });
                        }

                        if (data.redirect) {
                            $.etNotify({
                                message : '<?php echo $js_redirect; ?>',
                                icon    : 'location-arrow',
                                status  : 'primary',
                                clear   : true,
                            });
                            setTimeout(function() {
                                window.location.replace(data.redirect);
                            }, 1000);
                        }
                    }
                });
            }
        });
    });
});

function validateBeforeSubmit(formData, jqForm, options) { 
    var valid = true;
}

function getInitPreset() {
    var data = {};

    data.preset_id   = $('.preset-select').val();

    return data;
}
function getCurrentPreset() {
    var data = {};

    data.preset_id   = $('.preset-select').val();
    data.preset_name = $('.preset-select option:selected').text().replace('[v] ','');

    return data;
}
function findMaxValue(element) {
    var maxValue;

    $(element+'-item', $(element)).each(function() {
        var val = $(this).val();

        val = parseInt(val, 10);
        if (maxValue === undefined || maxValue < val) {
            maxValue = val;
        }
    });

    return maxValue;
}
</script>

</div> <!-- #content -->

<?php echo $footer; ?>