<?php

/**
 * PHP Version 7
 * Controlador de CartAnon
 *
 * @category Controllers_CartAnon
 * @package  Controllers\CartAnon
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  Comercial http://
 *
 * @version CVS:1.0.0
 *
 * @link http://url.com
 */
 // Sección de requires
require_once "models/mantenimientos/productos.model.php";
/**
 * Corre el Controlador de CartAnon
 *
 * @return void
 */
function run()
{
    $arrDataView = array();
    $usuario = "";
    
    if(mw_estaLogueado()){
        $usuario = $_SESSION["userCode"];
    }else{
        $usuario = '';
        if (isset($_SESSION["cart_anon_uid"])) {
            $usuario = $_SESSION["cart_anon_uid"];
        }
        if ($usuario === '') {
            $usuario = time() . random_int(1000, 9999);
        }
        $_SESSION["cart_anon_uid"] = $usuario;
    }

    $viewData = getDataFactUser($usuario);
    $viewData['user'] = $usuario;
    renderizar("retail/historial", $viewData);
}
// Correr el controlador
run();

?>
