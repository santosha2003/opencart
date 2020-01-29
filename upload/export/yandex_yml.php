<?php
// Version
define('VERSION', '2.3.0.2');

// Configuration
require_once(dirname(__FILE__).'/../config.php');

// Error Reporting
error_reporting(E_ALL);

// Check Version
if (version_compare(phpversion(), '5.4.0', '<') == true) {
	exit('PHP5.4+ Required');
}

if (!ini_get('date.timezone')) {
	date_default_timezone_set('UTC');
}

// Windows IIS Compatibility
if (!isset($_SERVER['DOCUMENT_ROOT'])) {
	if (isset($_SERVER['SCRIPT_FILENAME'])) {
		$_SERVER['DOCUMENT_ROOT'] = str_replace('\\', '/', substr($_SERVER['SCRIPT_FILENAME'], 0, 0 - strlen($_SERVER['PHP_SELF'])));
	}
}

if (!isset($_SERVER['DOCUMENT_ROOT'])) {
	if (isset($_SERVER['PATH_TRANSLATED'])) {
		$_SERVER['DOCUMENT_ROOT'] = str_replace('\\', '/', substr(str_replace('\\\\', '\\', $_SERVER['PATH_TRANSLATED']), 0, 0 - strlen($_SERVER['PHP_SELF'])));
	}
}

if (!isset($_SERVER['REQUEST_URI'])) {
	$_SERVER['REQUEST_URI'] = substr($_SERVER['PHP_SELF'], 1);

	if (isset($_SERVER['QUERY_STRING'])) {
		$_SERVER['REQUEST_URI'] .= '?' . $_SERVER['QUERY_STRING'];
	}
}

if (!isset($_SERVER['HTTP_HOST'])) {
	$_SERVER['HTTP_HOST'] = getenv('HTTP_HOST');
}

// Check if SSL
if (substr(HTTPS_SERVER, 5) == 'https') {
	$_SERVER['HTTPS'] = true;
} else {
	$_SERVER['HTTPS'] = false;
}

// Modification Override
function modification($filename) {
	if (defined('DIR_CATALOG')) {
		$file = DIR_MODIFICATION . 'admin/' .  substr($filename, strlen(DIR_APPLICATION));
	} elseif (defined('DIR_OPENCART')) {
		$file = DIR_MODIFICATION . 'install/' .  substr($filename, strlen(DIR_APPLICATION));
	} else {
		$file = DIR_MODIFICATION . 'catalog/' . substr($filename, strlen(DIR_APPLICATION));
	}

	if (substr($filename, 0, strlen(DIR_SYSTEM)) == DIR_SYSTEM) {
		$file = DIR_MODIFICATION . 'system/' . substr($filename, strlen(DIR_SYSTEM));
	}

	if (is_file($file)) {
		return $file;
	}

	return $filename;
}

// Autoloader
if (is_file(DIR_SYSTEM . '../../vendor/autoload.php')) {
	require_once(DIR_SYSTEM . '../../vendor/autoload.php');
}

function library($class) {
	$file = DIR_SYSTEM . 'library/' . str_replace('\\', '/', strtolower($class)) . '.php';

	if (is_file($file)) {
		include_once(modification($file));

		return true;
	} else {
		return false;
	}
}

spl_autoload_register('library');
spl_autoload_extensions('.php');

// Engine
require_once(modification(DIR_SYSTEM . 'engine/action.php'));
require_once(modification(DIR_SYSTEM . 'engine/controller.php'));
require_once(modification(DIR_SYSTEM . 'engine/event.php'));
require_once(modification(DIR_SYSTEM . 'engine/front.php'));
require_once(modification(DIR_SYSTEM . 'engine/loader.php'));
require_once(modification(DIR_SYSTEM . 'engine/model.php'));
require_once(modification(DIR_SYSTEM . 'engine/registry.php'));
require_once(modification(DIR_SYSTEM . 'engine/proxy.php'));

// Helper
require_once(DIR_SYSTEM . 'helper/general.php');
require_once(DIR_SYSTEM . 'helper/utf8.php');
require_once(DIR_SYSTEM . 'helper/json.php');

function start($application_config) {
	// Registry
	$registry = new Registry();

	// Config
	$config = new Config();
	$config->load('default');
	$config->load($application_config);
	$registry->set('config', $config);

	// Event
	$event = new Event($registry);
	$registry->set('event', $event);

	// Event Register
	if ($config->has('action_event')) {
		foreach ($config->get('action_event') as $key => $value) {
			$event->register($key, new Action($value));
		}
	}

	// Loader
	$loader = new Loader($registry);
	$registry->set('load', $loader);

	// Request
	$registry->set('request', new Request());

	// Response
	$response = new Response();
	//$response->addHeader('Content-Type: text/html; charset=utf-8');
	$registry->set('response', $response);

	// Database
	if ($config->get('db_autostart')) {
		$registry->set('db', new DB($config->get('db_type'), $config->get('db_hostname'), $config->get('db_username'), $config->get('db_password'), $config->get('db_database'), $config->get('db_port')));
	}

	// Session
	$session = new Session();

	if ($config->get('session_autostart')) {
		$session->start();
	}

	$registry->set('session', $session);

	// Cache 
	$registry->set('cache', new Cache($config->get('cache_type'), $config->get('cache_expire')));

	// Url
	if ($config->get('url_autostart')) {
		$registry->set('url', new Url($config->get('site_base'), $config->get('site_ssl')));
	}

	// Language
	$language = new Language($config->get('language_default'));
	$language->load($config->get('language_default'));
	$registry->set('language', $language);

	// Document
	$registry->set('document', new Document());

	// Config Autoload
	if ($config->has('config_autoload')) {
		foreach ($config->get('config_autoload') as $value) {
			$loader->config($value);
		}
	}

	// Language Autoload
	if ($config->has('language_autoload')) {
		foreach ($config->get('language_autoload') as $value) {
			$loader->language($value);
		}
	}

	// Library Autoload
	if ($config->has('library_autoload')) {
		foreach ($config->get('library_autoload') as $value) {
			$loader->library($value);
		}
	}

	// Model Autoload
	if ($config->has('model_autoload')) {
		foreach ($config->get('model_autoload') as $value) {
			$loader->model($value);
		}
	}

	// Front Controller
	$controller = new Front($registry);

	// Pre Actions
	if ($config->has('action_pre_action')) {
		foreach ($config->get('action_pre_action') as $value) {
			$controller->addPreAction(new Action($value));
		}
	}

	// Dispatch
	$action = new Action('extension/feed/yandex_yml/savetofile', array(dirname(__FILE__)));
	$controller->dispatch($action, new Action($config->get('action_error')));

	// Output
	//$response->setCompression($config->get('config_compression'));
	//$response->output();
}
start('catalog');
