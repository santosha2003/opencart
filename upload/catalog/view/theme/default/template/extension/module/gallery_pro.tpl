<style>

#links<?php echo $module; ?> .prog_title {
  font-size: <?php echo $setting['thumb_title_font_size']; ?>;
  color: <?php echo $setting['thumb_title_font_color']; ?>;
  background-color: <?php echo $setting['thumb_title_background_color']; ?>;
  padding: <?php echo (int)$setting['thumb_title_padding']; ?>px;
  <?php if ($setting['thumb_title_position']) { ?>position:absolute;<?php } ?>
  <?php if ($setting['thumb_title_position'] && $setting['thumb_title_display']) { ?>display:none;<?php } ?>
}

<?php if ($setting['hover_animation']) { ?>
#links<?php echo $module; ?> img {
  -webkit-transition: all <?php echo $setting['hover_animation_speed']; ?>s ease-in-out;
  -moz-transition: all <?php echo $setting['hover_animation_speed']; ?>s ease-in-out;
  -ms-transition: all <?php echo $setting['hover_animation_speed']; ?>s ease-in-out;
  -o-transform: all <?php echo $setting['hover_animation_speed']; ?>s ease-in-out;
  transition: all <?php echo $setting['hover_animation_speed']; ?>s ease-in-out;
}
#links<?php echo $module; ?> img:hover {
  -webkit-transform: scale(<?php echo $setting['hover_animation_zoom']; ?>) rotate(<?php echo (int)$setting['hover_animation_rotate']; ?>deg);
  -moz-transform: scale(<?php echo $setting['hover_animation_zoom']; ?>) rotate(<?php echo (int)$setting['hover_animation_rotate']; ?>deg);
  -ms-transform: scale(<?php echo $setting['hover_animation_zoom']; ?>) rotate(<?php echo (int)$setting['hover_animation_rotate']; ?>deg);
  -o-transform: scale(<?php echo $setting['hover_animation_zoom']; ?>) rotate(<?php echo (int)$setting['hover_animation_rotate']; ?>deg);
  transform: scale(<?php echo $setting['hover_animation_zoom']; ?>) rotate(<?php echo (int)$setting['hover_animation_rotate']; ?>deg);
}
<?php } ?>

<?php if ($setting['border']) { ?>
#links<?php echo $module; ?> .prog_container {
  border-radius: <?php echo (int)$setting['border_radius_top_left']; ?>px <?php echo (int)$setting['border_radius_top_right']; ?>px <?php echo (int)$setting['border_radius_bottom_right']; ?>px <?php echo (int)$setting['border_radius_bottom_left']; ?>px;
  -moz-border-radius: <?php echo (int)$setting['border_radius_top_left']; ?>px <?php echo (int)$setting['border_radius_top_right']; ?>px <?php echo (int)$setting['border_radius_bottom_right']; ?>px <?php echo (int)$setting['border_radius_bottom_left']; ?>px;
  -webkit-border-radius: <?php echo (int)$setting['border_radius_top_left']; ?>px <?php echo (int)$setting['border_radius_top_right']; ?>px <?php echo (int)$setting['border_radius_bottom_right']; ?>px <?php echo (int)$setting['border_radius_bottom_left']; ?>px;
  <?php if ($setting['thumb_style'] != 1) { ?>border: <?php echo (int)$setting['border_width']; ?>px solid <?php echo $setting['border_color']; ?>;<?php } ?>
  z-index:1;
   
}
<?php } ?>

<?php if ($setting['box_shadow']) { ?>
#links<?php echo $module; ?> .prog_container {
  -webkit-box-shadow: <?php echo (int)$setting['box_shadow_horizontal_length']; ?>px <?php echo (int)$setting['box_shadow_vertical_length']; ?>px <?php echo (int)$setting['box_shadow_blur_radius']; ?>px <?php echo (int)$setting['box_shadow_spread_radius']; ?>px <?php echo $setting['box_shadow_color']; ?>;
  -moz-box-shadow: <?php echo (int)$setting['box_shadow_horizontal_length']; ?>px <?php echo (int)$setting['box_shadow_vertical_length']; ?>px <?php echo (int)$setting['box_shadow_blur_radius']; ?>px <?php echo (int)$setting['box_shadow_spread_radius']; ?>px <?php echo $setting['box_shadow_color']; ?>;
  box-shadow: <?php echo (int)$setting['box_shadow_horizontal_length']; ?>px <?php echo (int)$setting['box_shadow_vertical_length']; ?>px <?php echo (int)$setting['box_shadow_blur_radius']; ?>px <?php echo (int)$setting['box_shadow_spread_radius']; ?>px <?php echo $setting['box_shadow_color']; ?>;
}
<?php } ?>

</style>
<?php if (!empty($heading_title)) { ?>
  <h3><?php echo $heading_title; ?></h3>
<?php } ?>
<div class="row">
  <div id="prog_loader<?php echo $module; ?>" class="fs_loader">
    <span class="loading" style="color: <?php echo $setting['loading_text_color']; ?>;"><?php echo $loading_text; ?></span>
    <div class="loader">
      <div class="inner one" style="border-color: <?php echo $setting['loading_text_color']; ?>;"></div>
      <div class="inner two" style="border-color: <?php echo $setting['loading_text_color']; ?>;"></div>
      <div class="inner three" style="border-color: <?php echo $setting['loading_text_color']; ?>;"></div>
    </div>
  </div>
  <div id="links<?php echo $module; ?>">
    <?php if ($setting['thumb_style'] == 0) { ?>
     <div id="0links<?php echo $module; ?>" style="display: none;">
      <?php foreach ($images as $gimage) { ?>
        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-6">
          <div class="prog_container" style="margin-bottom: <?php echo (int)$setting['bmargin_bottom']; ?>px;">
          <div class="image" style="overflow: hidden;"><a href="<?php if ($setting['click_function'] == 0) { ?><?php echo $gimage['image']; ?><?php } ?><?php if ($setting['click_function'] == 1) { ?><?php echo $gimage['link']; ?><?php } ?>" <?php if ($setting['gallery_title']) { ?>title="<?php echo $gimage['title']; ?>" <?php } ?><?php if ($setting['click_function'] == 0) { ?>data-gallery="#blueimp-gallery-links<?php echo $module; ?>"<?php } ?>><img src="<?php echo $gimage['thumb']; ?>" class="img-responsive" /></a></div>
          <?php if ($setting['thumb_title']) { ?>
            <div class="prog_title"><?php echo $gimage['title']; ?></div>
          <?php } ?>
          </div>
        </div>
      <?php } ?>
     </div>
    <?php } ?>
    <?php if ($setting['thumb_style'] == 1) { ?>
    <div class="col-xs-12">
      <div id="Collage<?php echo $module; ?>" style="padding: <?php echo (int)$setting['justify_margin']; ?>px; margin: -<?php echo (int)$setting['justify_margin']; ?>px;">
        <?php foreach ($images as $gimage) { ?>
        <div class="prog_container" style="opacity: 0;">
          <a href="<?php if ($setting['click_function'] == 0) { ?><?php echo $gimage['image']; ?><?php } ?><?php if ($setting['click_function'] == 1) { ?><?php echo $gimage['link']; ?><?php } ?>" <?php if ($setting['gallery_title']) { ?>title="<?php echo $gimage['title']; ?>" <?php } ?><?php if ($setting['click_function'] == 0) { ?>data-gallery="#blueimp-gallery-links<?php echo $module; ?>"<?php } ?>><img src="<?php echo $gimage['thumb']; ?>" style="vertical-align:bottom; opacity:1;"></a>
          <?php if ($setting['thumb_title'] && $setting['thumb_title_position']) { ?>
            <div class="prog_title"><?php echo $gimage['title']; ?></div>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
     </div>  
    <?php } ?>
    <?php if ($setting['thumb_style'] == 2) { ?>
    <div class="col-xs-12">
      <div id="pinto<?php echo $module; ?>" style="opacity: 0; margin-bottom: 10px;">
        <?php foreach ($images as $gimage) { ?>
        <div class="prog_container">
          <a href="<?php if ($setting['click_function'] == 0) { ?><?php echo $gimage['image']; ?><?php } ?><?php if ($setting['click_function'] == 1) { ?><?php echo $gimage['link']; ?><?php } ?>" <?php if ($setting['gallery_title']) { ?>title="<?php echo $gimage['title']; ?>" <?php } ?><?php if ($setting['click_function'] == 0) { ?>data-gallery="#blueimp-gallery-links<?php echo $module; ?>"<?php } ?>><img src="<?php echo $gimage['thumb']; ?>" style="padding: 0px; display: block; width: 100%;"></a>
          <?php if ($setting['thumb_title']) { ?>
            <div class="prog_title"><?php echo $gimage['title']; ?></div>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
     </div>  
    <?php } ?>
  </div>                     
</div>
<?php if ($module === 0) { ?>
<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
      <div id="blueimp-gallery" class="blueimp-gallery">
        <!-- The container for the modal slides -->
        <div class="slides"></div>
        <!-- Controls for the borderless lightbox -->
        <h3 class="title"></h3>
        <a class="prev">‹</a>
        <a class="next">›</a>
        <a class="close" style="-webkit-transform: scale(2); -moz-transform: scale(2); -ms-transform: scale(2); -o-transform: scale(2); transform: scale(2);">×</a>
        <a class="play-pause" style="-webkit-transform: scale(2); -moz-transform: scale(2); -ms-transform: scale(2); -o-transform: scale(2); transform: scale(2);"></a>
        <ol class="indicator"></ol>
      </div>
<script type="text/javascript"><!--
$('#blueimp-gallery').data('useBootstrapModal', 0);
$('#blueimp-gallery').toggleClass('blueimp-gallery-controls', 0);
var resizeTimer<?php echo $module; ?> = null;
--></script>
<?php } ?>                                
<?php if ($setting['thumb_title'] && $setting['thumb_title_position'] && $setting['thumb_title_display']) { ?>
<script type="text/javascript"><!--

$( "#links<?php echo $module; ?> .prog_container" )
  .mouseenter(function() {
    $(this).find(".prog_title").css({'margin-bottom': 0});
  })
  .mouseleave(function() {
    height = parseInt($(this).find(".prog_title").height()) + parseInt($(this).find(".prog_title").css("padding-top")) + parseInt($(this).find(".prog_title").css("padding-bottom"));
    $(this).find(".prog_title").css({'margin-bottom': -height});
  });

 
--></script>
<?php } ?>
<script type="text/javascript"><!--

<?php if ($setting['thumb_style'] == 1) { ?>

function collage<?php echo $module; ?>() {
    $('#Collage<?php echo $module; ?>').removeWhitespace().collagePlus(
        {
            'targetHeight'    : <?php echo $setting['justify_row_height']; ?>,
            'fadeSpeed'       : "slow",
            'effect'          : '<?php echo $setting['justify_effect']; ?>',
            'direction'       : '<?php echo $setting['justify_direction']; ?>',
            'allowPartialLastRow' : <?php if ($setting['justify_allow_parital']) echo "true"; else echo "false"; ?>
        }
    );
}

$(window).bind('resize', function() {
  // hide all the images until we resize them
  $('#Collage<?php echo $module; ?> .prog_container').css("opacity", 0);
  // set a timer to re-apply the plugin
  if (resizeTimer<?php echo $module; ?>) clearTimeout(resizeTimer<?php echo $module; ?>);
    resizeTimer<?php echo $module; ?> = setTimeout(collage<?php echo $module; ?>, 200);
  });

<?php } ?>

$( window ).load( function() {

// remove spinner
  
  if ($('#prog_loader<?php echo $module; ?>').length > 0) {
	  $('#prog_loader<?php echo $module; ?>').remove();
	}
  
  <?php if ($setting['thumb_style'] == 0) { ?>
  
  $('#0links<?php echo $module; ?>').fadeIn('slow', function() { //no height with display none parent
    
    <?php if ($setting['thumb_title'] && $setting['thumb_title_position'] && $setting['thumb_title_display']) { ?>
    
    $("#links<?php echo $module; ?> .prog_title").each(function( i ) {
      height = parseInt($(this).height()) + parseInt($(this).css("padding-top")) + parseInt($(this).css("padding-bottom"));
      $(this).css({'margin-bottom': -height, display:'inline'});
    });
    <?php } ?>
    
  });
  
  <?php } ?>
  
  <?php if ($setting['thumb_style'] == 1) { ?>
  
     collage<?php echo $module; ?>();
    
    <?php if ($setting['thumb_title'] && $setting['thumb_title_position'] && $setting['thumb_title_display']) { ?>
     $("#links<?php echo $module; ?> .prog_title").each(function( i ) {
      height = parseInt($(this).height()) + parseInt($(this).css("padding-top")) + parseInt($(this).css("padding-bottom"));
      $(this).css({'margin-bottom': -height, display:'inline'});
     });
    <?php } ?>
      
  <?php } ?>
  
  <?php if ($setting['thumb_style'] == 2) { ?>
  

  
    $('#pinto<?php echo $module; ?>').pinto({
      itemSelector: "> div", 
      itemWidth: <?php echo (int)$setting['pinto_width']; ?>, 
      gapX: <?php echo (int)$setting['pinto_gap_x']; ?>, 
      gapY: <?php echo (int)$setting['pinto_gap_y']; ?>, 
      align: "<?php echo $setting['pinto_align']; ?>", 
      fitWidth: true, 
      autoResize: true, 
      resizeDelay: 50, 
      onItemLayout: function($item, column, position) {$('#pinto<?php echo $module; ?>').animate({opacity: '1'},{duration: 700});},
    });
    
  <?php if ($setting['thumb_title'] && $setting['thumb_title_position'] && $setting['thumb_title_display']) { ?>
     $("#links<?php echo $module; ?> .prog_title").each(function( i ) {
        height = parseInt($(this).height()) + parseInt($(this).css("padding-top")) + parseInt($(this).css("padding-bottom"));
        $(this).css({'margin-bottom': -height, display:'inline'});
     });
  <?php } ?>
  
  <?php } ?>
  
});
--></script>