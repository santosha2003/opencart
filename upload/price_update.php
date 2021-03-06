<?php

header('Content-Type: text/plain; charset=UTF-8');

if (!isset($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW'])
    || $_SERVER['PHP_AUTH_USER'] !== 'update'
    || $_SERVER['PHP_AUTH_PW']   !== 'lalala')
{
    header('WWW-Authenticate: Basic realm="Who are you?"');
    header('HTTP/1.0 401 Unauthorized');
    die('Access denied');
}

require_once('config.php');

// Путь с которого дергаем прайс
define( 'PRICE_URL', 'http://www.newgame.org.ru/price_full.zip' );
// Путь куда сохраняем прайс
define( 'PRICE_TMP_PATH', '/var/www/belosnezhka/tmp_price/price.zip' );
// Путь для распаковки архива с прайсом
define( 'ZIP_TMP_PATH', '/var/www/belosnezhka/tmp_price/' );

if (file_exists(ZIP_TMP_PATH)) {
    foreach (glob(ZIP_TMP_PATH . '*') as $file) {
        unlink($file);
    }
}

// Скачаем архив
if( file_put_contents(PRICE_TMP_PATH, file_get_contents(PRICE_URL)) ){
    echo "Прайс успешно загружен!\n";
} else{
    die('Произошла ошибка записи');
}

// Распакуем архив
$zip = new ZipArchive;
$res = $zip->open(PRICE_TMP_PATH);

if ($res === true) {
    $zip->extractTo(ZIP_TMP_PATH);
    $zip->close();
    unlink(PRICE_TMP_PATH);
    echo "Архив успешно распакован!\n";
} else {
    die('Произошла ошибка при распаковке!');
}

// Проверяем есть ли в папке csv файл
$csv_price = glob( ZIP_TMP_PATH . "*.csv" );

if( count( $csv_price ) != 1 ) {
    die('Файл для выгрузки не 1 (либо он не существует либо файлов несколько). Обновление не стартовало!');
} else {
    echo "Файл найден!\n";
}


$link = mysqli_connect( DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE ) or die("Ошибка " . mysqli_error($link));

$handle = fopen($csv_price[0], "r");

while (($data = fgetcsv($handle, 0, ";")) !== FALSE) {

    $data = array_map('conv', $data);
    $num = count($data);

    $sku = trim($data[2]);

    if( strlen($sku <= 1) ){
        continue;
    }

    $stock = intval( trim($data[3]) );
    $price = intval( trim($data[4]) );

    if($price <= 0){
        continue;
    }

    //  Установим статус. 7 - Есть в наличии, 5 - нет
    $stock_status = $stock ? 7 : 5;

    $query ="UPDATE `oc_product` SET `quantity`=$stock, `price`=$price, `stock_status_id`=$stock_status WHERE `sku`='$sku';";
    $result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link));
    if($result && $result != NULL)
    {
        echo "Продукт $sku успешно обновлен!";
    }

}

fclose($handle);


mysqli_close($link);


function conv($n) {
    return mb_convert_encoding( $n, 'UTF-8', 'windows-1251' );
}