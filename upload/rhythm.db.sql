DELETE FROM `oc_event` WHERE `code` LIKE 'rhythm%' AND `action` LIKE 'event/rhythm/%';

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES (0, 'rhythm_block_position_content', 'catalog/view/common/content*/before', 'event/rhythm/block_position_extra', 1, NOW());
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES (0, 'rhythm_block_position_header', 'catalog/rhythm/common/header', 'event/rhythm/block_position_header', 1, NOW());
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES (0, 'rhythm_block_position_footer', 'catalog/view/common/footer/before', 'event/rhythm/block_position_extra', 1, NOW());
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES (0, 'rhythm_block_position_column', 'catalog/view/common/column*/before', 'event/rhythm/block_position_extra', 1, NOW());
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES (0, 'rhythm_common_header', 'catalog/view/common/header/before', 'event/rhythm/common_header', 1, NOW());
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES (0, 'rhythm_block_position_main', 'catalog/rhythm/controller-hmvc/before', 'event/rhythm/block_position_main', 1, NOW());
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES (0, 'rhythm_global_event', 'catalog/view/*/before', 'event/rhythm/global_event', 1, NOW());
INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `date_added`) VALUES (0, 'rhythm_add_position_layout', 'admin/view/design/layout_form/before', 'event/rhythm/addPositionToLayout', 1, NOW());