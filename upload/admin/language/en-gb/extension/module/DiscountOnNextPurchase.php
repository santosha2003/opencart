<?php
$_['heading_title']       		= 'DiscountOnNextPurchase';
$_['text_module']				='Modules';
$_['text_module_settings']		='Module Settings';
$_['text_success']        		= 'Success: You have modified the module!';
$_['select_coupon_text']		= 'Select an existing coupon:';
$_['select_coupon_text_help']		= 'Select among existing OpenCart coupons';

$_['select_coupon']			= 'Select coupon';
$_['select_order_status_text'] 	= 'Select order status:';
$_['select_order_status_text_help'] 	= 'Select order status that will generate a unique code for every customer';

$_['select_order_status'] 	= 'Select order status';
$_['text_yes']					= 'Yes';
$_['text_no']					= 'No';
$_['text_enabled']				= 'Enabled';
$_['text_disabled']				= 'Disabled';
$_['text_default']				= 'Default';

$_['user_mail']					= 'Message to user:';
$_['user_mail_help']			= 'Message with discount code that will be sent to user when order status is changed to selected. 
<p>Use the following codes:<br />
{firstname} - fist name<br />
{lastname} - last name<br />
{coupon_code} - the code of coupon<br />
{start_date} - Start date of the coupon<br />
{end_date} - End date of the coupon</p>
';

$_['default_message']	 = '<p>Congratulations {firstname} {lastname},</p>
										<p>With your purchase you have got a discount coupon for all products&nbsp;worth 10%.You can use it&nbsp;on your next purchase in our store between {start_date} and {end_date}.</p>							
										<p>The coupon code is: {coupon_code}</p>	
										<p>Regards,</p>';

$_['default_subject']	 = 'DiscountOnNextPurchase Subject';

$_['tab_control_panel']			= 'Control panel';
$_['tab_template']				= 'Email template';
$_['tab_coupon']					= 'Coupon';
$_['tab_support']					= 'Support';
$_['tab_given_coupons']			= 'Sent coupons';
$_['tab_used_coupons']			= 'Used coupons'; 
$_['subject_text']				= 'Subject';
$_['admin_notification']		= 'Send BCC to store owner:';   
$_['admin_notification_help']	= 'Enabling this option will add {email} as BCC recipient';   

$_['total_amount']            = 'Total Amount:';
$_['total_amount_help']       = 'The total amount that must reached before the coupon is valid.';

$_['customer_login']          = 'Customer Login';
$_['customer_login_help']     = 'Customer must be logged in to use the coupon';

$_['discount_order_total']   = 'Generate coupon code if the order total is more than:';
$_['text_discount']          = 'Discount:';
$_['text_discount_type']     = 'Discount Type:';
$_['text_percentage']        = 'Percentage';
$_['text_fixed_amount']      = 'Fixed Amount';

$_['text_products']     	 = 'The following products';
$_['text_all_products']  	 = 'All Products';
$_['text_categories']     	 = 'The following categories';
$_['text_all_categories']    = 'All Categories';

// Entry	
$_['module_status_text']      	= 'DiscountOnNextPurchase status:';
$_['module_status_text_help']  	= 'Enable or disable the module';

$_['error_rule_name']			= 'Rule name must be between 3 and 128 characters!';
$_['error_template_not_selected']= 'Template not selected!';
$_['error_event_not_selected']	= 'Order event not selected!';
$_['error_order_status']		= 'Order status not selected!';
$_['error_warning']			= 'Please check the Email template again!';

$_['column_name']         = 'Coupon Name';
$_['column_code']         = 'Code';
$_['column_discount']     = 'Discount';
$_['column_date_start']   = 'Date Start';
$_['column_date_end']     = 'Date End';
$_['column_status']       = 'Status';
$_['column_order_id']     = 'Order ID';
$_['column_customer']     = 'Customer';
$_['column_amount']       = 'Amount';
$_['column_date_added']   = 'Date Added';
$_['column_action']       = 'Action';
$_['column_email']		= 'Customer Email';
$_['coupon_validity']   = ' Coupon validity:';
$_['coupon_validity_help']   = 'Select how many days the coupon to be valid after recieved';

$_['button_save'] = 'Save Changes';
$_['tab_discount'] = 'Discounts';
$_['tab_coupons'] = 'Coupons';
$_['text_add_discount']  	= 'Add New Discount';

$_['entry_category']      = ' Make the coupon available for specific categories:';
$_['entry_product']       = ' Make the coupon available for specific products:';

// Error		
$_['error_permission']    		= 'Warning: You do not have permission to modify module DiscountOnNextPurchase!';
$_['error_discount'] 		= 'Discount must be a number!';
$_['error_total_amount'] 		= 'Total amount must be a number!';
$_['error_coupon_validity'] = 'Coupon validity must be a number!';
$_['error_subject'] = 'Subject must be between 3 and 128 characters!';
?>