<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-gallery" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-gallery" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_title; ?>"><?php echo $entry_title; ?></span></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="module_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($module_description[$language['language_id']]) ? $module_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_loading_text; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="module_description[<?php echo $language['language_id']; ?>][loading_text]" value="<?php echo isset($module_description[$language['language_id']]) ? $module_description[$language['language_id']]['loading_text'] : $text_loading_text; ?>" placeholder="<?php echo $entry_loading_text; ?>" class="form-control" />
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
              <label class="col-sm-2 control-label" for="input-loading_text_color"><span data-toggle="tooltip" title="<?php echo $help_color; ?>"><?php echo $entry_loading_text_color; ?></span></label>
              <div class="input-group col-sm-10 sec-group color-picker">
                <span class="input-group-addon"><i></i></span>
                <input type="text" name="loading_text_color" value="<?php echo $loading_text_color; ?>" placeholder="<?php echo $entry_loading_text_color; ?>" id="input-loading_text_color" class="form-control" />
                <?php if ($error_loading_text_color) { ?>
                <div class="text-danger"><?php echo $error_loading_text_color; ?></div>
                <?php } ?>
              </div>
            </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner"><?php echo $entry_banner; ?></label>
            <div class="col-sm-10">
              <select name="filter_banner_id" id="input-banner" class="form-control">
                <?php foreach ($banners as $banner) { ?>
                <?php if ($banner['banner_id'] == $filter_banner_id) { ?>
                <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <?php if ($error_banner) { ?>
              <div class="text-danger"><?php echo $error_banner; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-resize"><span data-toggle="tooltip" title="<?php echo $help_resize; ?>"><?php echo $entry_resize; ?></span></label>
            <div class="col-sm-10">
              <select name="resize" id="input-resize" class="form-control" onchange="$('.resizevars').collapse('hide'); $('#resizevariables' + this.value).collapse('show');">
                <?php if ($resize) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="collapse resizevars" id="resizevariables1">
            <hr style="border-top: 1px solid #1e91cf;">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><?php echo $text_resize_options; ?></div>
            <br>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-gwidth"><?php echo $entry_gwidth; ?></label>
              <div class="col-sm-10">
                <input type="text" name="gwidth" value="<?php echo $gwidth; ?>" placeholder="<?php echo $entry_gwidth; ?>" id="input-gwidth" class="form-control" />
                <?php if ($error_gwidth) { ?>
                <div class="text-danger"><?php echo $error_gwidth; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-gheight"><?php echo $entry_gheight; ?></label>
              <div class="col-sm-10">
                <input type="text" name="gheight" value="<?php echo $gheight; ?>" placeholder="<?php echo $entry_gheight; ?>" id="input-gheight" class="form-control" />
                <?php if ($error_gheight) { ?>
                <div class="text-danger"><?php echo $error_gheight; ?></div>
                <?php } ?>
              </div>
            </div>
            <hr style="border-top: 1px solid #1e91cf;">
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-thumb_title"><span data-toggle="tooltip" title="<?php echo $help_thumb_title; ?>"><?php echo $entry_thumb_title; ?></span></label>
            <div class="col-sm-10">
              <select name="thumb_title" id="input-thumb_title" class="form-control" onchange="$('.titlevars').collapse('hide'); $('#titlevariables' + this.value).collapse('show');">
                <?php if ($thumb_title) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="collapse titlevars" id="titlevariables1">
            <hr style="border-top: 1px solid #1e91cf;">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><?php echo $text_thumb_title_options; ?></div><br>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-thumb_title_position"><span data-toggle="tooltip" title="<?php echo $help_thumb_title_position; ?>"><?php echo $entry_thumb_title_position; ?></span></label>
              <div class="col-sm-10">
                <select name="thumb_title_position" id="input-thumb_title_position" class="form-control">
                  <?php foreach ($text_thumb_title_positions as $key => $text_thumb_title_position) { ?>
                  <option value="<?php echo $key; ?>"<?php if ($thumb_title_position == $key) echo ' selected="selected"'; ?>><?php echo $text_thumb_title_position; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-thumb_title_display"><?php echo $entry_thumb_title_display; ?></label>
              <div class="col-sm-10">
                <select name="thumb_title_display" id="input-thumb_title_display" class="form-control">
                  <?php foreach ($text_thumb_title_displays as $key => $text_thumb_title_display) { ?>
                  <option value="<?php echo $key; ?>"<?php if ($thumb_title_display == $key) echo ' selected="selected"'; ?>><?php echo $text_thumb_title_display; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-thumb_title_font_size"><?php echo $entry_thumb_title_font_size; ?></label>
              <div class="col-sm-10">
                <input type="text" name="thumb_title_font_size" value="<?php echo $thumb_title_font_size; ?>" placeholder="<?php echo $entry_thumb_title_font_size; ?>" id="input-thumb_title_font_size" class="form-control" />
                <?php if ($error_thumb_title_font_size) { ?>
                <div class="text-danger"><?php echo $error_thumb_title_font_size; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-thumb_title_font_color"><span data-toggle="tooltip" title="<?php echo $help_color; ?>"><?php echo $entry_thumb_title_font_color; ?></span></label>
              <div class="input-group col-sm-10 sec-group color-picker">
                <span class="input-group-addon"><i></i></span>
                <input type="text" name="thumb_title_font_color" value="<?php echo $thumb_title_font_color; ?>" placeholder="<?php echo $entry_thumb_title_font_color; ?>" id="input-thumb_title_font_color" class="form-control" />
                <?php if ($error_thumb_title_font_color) { ?>
                <div class="text-danger"><?php echo $error_thumb_title_font_color; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-thumb_title_background_color"><span data-toggle="tooltip" title="<?php echo $help_color; ?>"><?php echo $entry_thumb_title_background_color; ?></span></label>
              <div class="input-group col-sm-10 sec-group color-picker">
                <span class="input-group-addon"><i></i></span>
                <input type="text" name="thumb_title_background_color" value="<?php echo $thumb_title_background_color; ?>" placeholder="<?php echo $entry_thumb_title_background_color; ?>" id="input-thumb_title_background_color" class="form-control" />
                <?php if ($error_thumb_title_background_color) { ?>
                <div class="text-danger"><?php echo $error_thumb_title_background_color; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-thumb_title_padding"><?php echo $entry_thumb_title_padding; ?></label>
              <div class="col-sm-10">
                <input type="text" name="thumb_title_padding" value="<?php echo $thumb_title_padding; ?>" placeholder="<?php echo $entry_thumb_title_padding; ?>" id="input-thumb_title_padding" class="form-control" />
              </div>
            </div>
            <hr style="border-top: 1px solid #1e91cf;">
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-gallery_title"><span data-toggle="tooltip" title="<?php echo $help_gallery_title; ?>"><?php echo $entry_gallery_title; ?></span></label>
            <div class="col-sm-10">
              <select name="gallery_title" id="input-gallery_title" class="form-control">
                <?php if ($gallery_title) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-click_function"><span data-toggle="tooltip" title="<?php echo $help_click_function; ?>"><?php echo $entry_click_function; ?></span></label>
            <div class="col-sm-10">
              <select name="click_function" id="input-click_function" class="form-control">
                <?php foreach ($text_click_functions as $key => $text_click_function) { ?>
                <option value="<?php echo $key; ?>"<?php if ($click_function == $key) echo ' selected="selected"'; ?>><?php echo $text_click_function; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-thumb_style"><?php echo $entry_thumb_style; ?></label>
            <div class="col-sm-10">
              <select name="thumb_style" id="input-thumb_style" class="form-control" onchange="$('.stylevars').hide('fast'); $('#stylevariables' + this.value).show('fast');">
                <?php foreach ($text_thumb_styles as $key => $text_thumb_style) { ?>
                <option value="<?php echo $key; ?>"<?php if ($thumb_style == $key) echo ' selected="selected"'; ?>><?php echo $text_thumb_style; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="stylevars" id="stylevariables0">
            <hr style="border-top: 1px solid #1e91cf;">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><?php echo $help_thumb_styles[0]; ?></div>
            <br>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-bwidth"><?php echo $entry_bwidth; ?></label>
              <div class="col-sm-10">
                <input type="text" name="bwidth" value="<?php echo $bwidth; ?>" placeholder="<?php echo $entry_bwidth; ?>" id="input-bwidth" class="form-control" />
                <?php if ($error_bwidth) { ?>
                <div class="text-danger"><?php echo $error_bwidth; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-bheight"><?php echo $entry_bheight; ?></label>
              <div class="col-sm-10">
                <input type="text" name="bheight" value="<?php echo $bheight; ?>" placeholder="<?php echo $entry_bheight; ?>" id="input-bheight" class="form-control" />
                <?php if ($error_bheight) { ?>
                <div class="text-danger"><?php echo $error_bheight; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-bmargin_bottom"><?php echo $entry_bmargin_bottom; ?></label>
              <div class="col-sm-10">
                <input type="text" name="bmargin_bottom" value="<?php echo $bmargin_bottom; ?>" placeholder="<?php echo $entry_bmargin_bottom; ?>" id="input-bmargin_bottom" class="form-control" />
              </div>
            </div>
            <hr style="border-top: 1px solid #1e91cf;">
          </div>
          <div class="stylevars" id="stylevariables1">
            <hr style="border-top: 1px solid #1e91cf;">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><?php echo $help_thumb_styles[1]; ?></div>
            <br><br>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-justify_row_height"><?php echo $entry_justify_row_height; ?></label>
              <div class="col-sm-10">
                <input type="text" name="justify_row_height" value="<?php echo $justify_row_height; ?>" placeholder="<?php echo $entry_justify_row_height; ?>" id="input-justify_row_height" class="form-control" />
                <?php if ($error_justify_row_height) { ?>
                <div class="text-danger"><?php echo $error_justify_row_height; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-justify_effect"><?php echo $entry_justify_effect; ?></label>
              <div class="col-sm-10">
                <select name="justify_effect" id="input-justify_effect" class="form-control">
                  <?php foreach ($text_collage_effects as $effect) { ?>
                  <option value="<?php echo $effect; ?>"<?php if ($justify_effect == $effect) echo ' selected="selected"'; ?>><?php echo $effect; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-justify_direction"><?php echo $entry_justify_direction; ?></label>
              <div class="col-sm-10">
                <select name="justify_direction" id="input-justify_direction" class="form-control">
                  <?php foreach ($text_collage_directions as $key => $direction) { ?>
                <option value="<?php echo $key; ?>"<?php if ($justify_direction == $key) echo ' selected="selected"'; ?>><?php echo $direction; ?></option>
                <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-justify_allow_parital"><?php echo $entry_justify_allow_parital; ?></label>
              <div class="col-sm-10">
                <select name="justify_allow_parital" id="input-justify_allow_parital" class="form-control">
                  <?php if ($justify_allow_parital) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-justify_margin"><?php echo $entry_justify_margin; ?></label>
              <div class="col-sm-10">
                <input type="text" name="justify_margin" value="<?php echo $justify_margin; ?>" placeholder="<?php echo $entry_justify_margin; ?>" id="input-justify_margin" class="form-control" />
              </div>
            </div>
            <hr style="border-top: 1px solid #1e91cf;">
          </div>
          <div class="stylevars" id="stylevariables2">
            <hr style="border-top: 1px solid #1e91cf;">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><?php echo $text_pinterest_options; ?></div><br>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-pinto_width"><?php echo $entry_pinto_width; ?></label>
              <div class="col-sm-10">
                <input type="text" name="pinto_width" value="<?php echo $pinto_width; ?>" placeholder="<?php echo $entry_pinto_width; ?>" id="input-pinto_width" class="form-control" />
                <?php if ($error_pinto_width) { ?>
                <div class="text-danger"><?php echo $error_pinto_width; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-pinto_gap_x"><?php echo $entry_pinto_gap_x; ?></label>
              <div class="col-sm-10">
                <input type="text" name="pinto_gap_x" value="<?php echo $pinto_gap_x; ?>" placeholder="<?php echo $entry_pinto_gap_x; ?>" id="input-pinto_gap_x" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-gap_y"><?php echo $entry_pinto_gap_y; ?></label>
              <div class="col-sm-10">
                <input type="text" name="pinto_gap_y" value="<?php echo $pinto_gap_y; ?>" placeholder="<?php echo $entry_pinto_gap_y; ?>" id="input-pinto_gap_y" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-pinto_align"><?php echo $entry_pinto_align; ?></label>
              <div class="col-sm-10">
                <select name="pinto_align" id="input-pinto_align" class="form-control">
                  <?php foreach ($text_pinto_aligns as $align) { ?>
                  <option value="<?php echo $align; ?>"<?php if ($pinto_align == $align) echo ' selected="selected"'; ?>><?php echo $align; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <hr style="border-top: 1px solid #1e91cf;">
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-hover_animation"><?php echo $entry_hover_animation; ?></label>
            <div class="col-sm-10">
              <select name="hover_animation" id="input-hover_animation" class="form-control" onchange="$('.hovervars').collapse('hide'); $('#hovervariables' + this.value).collapse('show');">
                <?php if ($hover_animation) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="collapse hovervars" id="hovervariables1">
            <hr style="border-top: 1px solid #1e91cf;">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><?php echo $text_hover_animation_options .", ". $help_css_transform; ?></div><br>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-hover_animation_speed"><span data-toggle="tooltip" title="<?php echo $help_speed; ?>"><?php echo $entry_hover_animation_speed; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="hover_animation_speed" value="<?php echo $hover_animation_speed; ?>" placeholder="<?php echo $entry_hover_animation_speed; ?>" id="input-hover_animation_speed" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-hover_animation_zoom"><span data-toggle="tooltip" title="<?php echo $help_zoom; ?>"><?php echo $entry_hover_animation_zoom; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="hover_animation_zoom" value="<?php echo $hover_animation_zoom; ?>" placeholder="<?php echo $entry_hover_animation_zoom; ?>" id="input-hover_animation_zoom" class="form-control" />
                <?php if ($error_hover_animation_zoom) { ?>
                <div class="text-danger"><?php echo $error_hover_animation_zoom; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-hover_animation_rotate"><span data-toggle="tooltip" title="<?php echo $help_css_transform_rotation; ?>"><?php echo $entry_hover_animation_rotate; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="hover_animation_rotate" value="<?php echo $hover_animation_rotate; ?>" placeholder="<?php echo $entry_hover_animation_rotate; ?>" id="input-hover_animation_rotate" class="form-control" />
              </div>
            </div>
            <hr style="border-top: 1px solid #1e91cf;">
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-border"><?php echo $entry_border; ?></label>
            <div class="col-sm-10">
              <select name="border" id="input-border" class="form-control" onchange="$('.bordervars').collapse('hide'); $('#bordervariables' + this.value).collapse('show');">
                <?php if ($border) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="collapse bordervars" id="bordervariables1">
            <hr style="border-top: 1px solid #1e91cf;">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><?php echo $text_border_options .", ". $help_border; ?></div><br>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-border_radius_top_left"><?php echo $entry_border_radius_top_left; ?></label>
              <div class="col-sm-10">
                <input type="text" name="border_radius_top_left" value="<?php echo $border_radius_top_left; ?>" placeholder="<?php echo $entry_border_radius_top_left; ?>" id="input-border_radius_top_left" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-border_radius_top_right"><?php echo $entry_border_radius_top_right; ?></label>
              <div class="col-sm-10">
                <input type="text" name="border_radius_top_right" value="<?php echo $border_radius_top_right; ?>" placeholder="<?php echo $entry_border_radius_top_right; ?>" id="input-border_radius_top_right" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-border_radius_bottom_left"><?php echo $entry_border_radius_bottom_left; ?></label>
              <div class="col-sm-10">
                <input type="text" name="border_radius_bottom_left" value="<?php echo $border_radius_bottom_left; ?>" placeholder="<?php echo $entry_border_radius_bottom_left; ?>" id="input-border_radius_bottom_left" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-border_radius_bottom_right"><?php echo $entry_border_radius_bottom_right; ?></label>
              <div class="col-sm-10">
                <input type="text" name="border_radius_bottom_right" value="<?php echo $border_radius_bottom_right; ?>" placeholder="<?php echo $entry_border_radius_bottom_right; ?>" id="input-border_radius_bottom_right" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-border_width"><span data-toggle="tooltip" title="<?php echo $help_border_width; ?>"><?php echo $entry_border_width; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="border_width" value="<?php echo $border_width; ?>" placeholder="<?php echo $entry_border_width; ?>" id="input-border_width" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-border_color"><span data-toggle="tooltip" title="<?php echo $help_border_width; ?>"><?php echo $entry_border_color; ?></span></label>
              <div class="input-group col-sm-10 sec-group color-picker">
                <span class="input-group-addon"><i></i></span>
                <input type="text" name="border_color" value="<?php echo $border_color; ?>" placeholder="<?php echo $entry_border_color; ?>" id="input-border_color" class="form-control" />
                 <?php if ($error_border_color) { ?>
                 <div class="text-danger"><?php echo $error_border_color; ?></div>
                 <?php } ?>
              </div>
            </div>
            <hr style="border-top: 1px solid #1e91cf;">
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-box_shadow"><?php echo $entry_box_shadow; ?></label>
            <div class="col-sm-10">
              <select name="box_shadow" id="input-box_shadow" class="form-control" onchange="$('.shadowvars').collapse('hide'); $('#shadowvariables' + this.value).collapse('show');">
                <?php if ($box_shadow) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="collapse shadowvars" id="shadowvariables1">
            <hr style="border-top: 1px solid #1e91cf;">
            <div class="col-sm-2"></div>
            <div class="col-sm-10"><?php echo $text_shadow_options .", ". $help_box_shadow; ?></div><br>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-box_shadow_horizontal_length"><span data-toggle="tooltip" title="<?php echo $help_css_transform_rotation; ?>"><?php echo $entry_box_shadow_horizontal_length; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="box_shadow_horizontal_length" value="<?php echo $box_shadow_horizontal_length; ?>" placeholder="<?php echo $entry_box_shadow_horizontal_length; ?>" id="input-box_shadow_horizontal_length" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-box_shadow_vertical_lengths_top_right"><span data-toggle="tooltip" title="<?php echo $help_css_transform_rotation; ?>"><?php echo $entry_box_shadow_vertical_length; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="box_shadow_vertical_length" value="<?php echo $box_shadow_vertical_length; ?>" placeholder="<?php echo $entry_box_shadow_vertical_length; ?>" id="input-box_shadow_vertical_length" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-box_shadow_blur_radius"><?php echo $entry_box_shadow_blur_radius; ?></label>
              <div class="col-sm-10">
                <input type="text" name="box_shadow_blur_radius" value="<?php echo $box_shadow_blur_radius; ?>" placeholder="<?php echo $entry_box_shadow_blur_radius; ?>" id="input-box_shadow_blur_radius" class="form-control" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-box_shadow_color"><span data-toggle="tooltip" title="<?php echo $help_color; ?>"><?php echo $entry_box_shadow_color; ?></span></label>
              <div class="input-group col-sm-10 sec-group color-picker">
                <span class="input-group-addon"><i></i></span>
                <input type="text" name="box_shadow_color" value="<?php echo $box_shadow_color; ?>" placeholder="<?php echo $entry_box_shadow_color; ?>" id="input-box_shadow_color" class="form-control" />
                <?php if ($error_box_shadow_color) { ?>
                <div class="text-danger"><?php echo $error_box_shadow_color; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-box_shadow_spread_radius"><span data-toggle="tooltip" title="<?php echo $help_css_transform_rotation; ?>"><?php echo $entry_box_shadow_spread_radius; ?></span></label>
              <div class="col-sm-10">
                <input type="text" name="box_shadow_spread_radius" value="<?php echo $box_shadow_spread_radius; ?>" placeholder="<?php echo $entry_box_shadow_spread_radius; ?>" id="box_shadow_spread_radius" class="form-control" />
              </div>
            </div>
            <hr style="border-top: 1px solid #1e91cf;">
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<style>
.sec-group {
  padding-left: 15px !important;
  padding-right: 15px !important;
}
</style>
<script>
$(".color-picker").colorpicker();
$("#resizevariables" + <?php echo $resize; ?>).collapse("show");
$('.stylevars').hide();
$("#stylevariables" + <?php echo $thumb_style; ?>).show();
$("#titlevariables" + <?php echo $thumb_title; ?>).collapse("show");
$("#hovervariables" + <?php echo $hover_animation; ?>).collapse("show");
$("#bordervariables" + <?php echo $border; ?>).collapse("show");
$("#shadowvariables" + <?php echo $box_shadow; ?>).collapse("show");
</script>
<?php echo $footer; ?>