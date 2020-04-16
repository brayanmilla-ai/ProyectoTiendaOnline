<?php
//middleware de configuración de todo el sitio
require_once "libs/parameters.php";
function site_init(){
    $currency           = '$'; //currency symbol
    $shipping_cost      = 1.50; //shipping cost
    $taxes              = array( //List your Taxes percent here.
                            'VAT' => 12, 
                            'Service Tax' => 5,
                            'Other Tax' => 10
                            );
    global $host_server;
    addToContext("page_title","Tienda Online");
    addToContext("max_file_size",20); // In Megas
    addToContext("host_server",$host_server); 
    addToContext("moneda",$currency);
    date_default_timezone_set ( "America/Tegucigalpa" );
}
site_init();

?>
