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
require_once 'libs/paypal.php';
require_once "models/mantenimientos/productos.model.php";
use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;
/**
 * Corre el Controlador de CartAnon
 *
 * @return void
 */
function run()
{
    /* 
    
    se verifica si el usuario a inicado sesion para poder obtener el id del usuario
    se llama al modelo de productos para crear la factura
    
    */

    $payment = executePaypal();
    $viewData = array();
    $sesion = false;
    $usuario = "";
    $idFactura = "";
    if(mw_estaLogueado()){
        $usuario = $_SESSION["userCode"];
        $sesion = true;
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
    if ($payment) {
        if($_SESSION['tokenRes'] == $_GET['tocken']){
            $idFactura = crearFactura($usuario, $payment->toJSON(), $sesion);
        if ($idFactura) {
            //Aqui se puede obtener la factura generada
            $viewData = getDataFact($idFactura);
            addToContext("cartEntries", 0);
            $viewData["payment"] = $payment->toJSON();
            $viewData["checkoutTitle"]
                = $payment->getPayer()
                ->getPayerInfo()
                ->getFirstName().
                " ".
                $payment->getPayer()
                ->getPayerInfo()
                ->getLastName();
            $viewData["checkoutDescription"] = "";
            $viewData["error"] =  "";
            $viewData["amount"]
                = $payment->getTransactions()[0]
                ->getAmount()
                ->getTotal();
                $_SESSION['tokenRes'] = "0";
            }else{
                $viewData['erroor'] = crearFactura($usuario, $payment->toJSON(), $sesion);
            }
            
        }else{
            header('location:index.php?page=home');
        }


    } else {
        $viewData["error"] = "Error al procesar pagos";
    }
    $viewData['tok'] = $_SESSION['tokenRes'];
    $viewData['Log'] = $usuario;
    $viewData['se'] = $sesion;
    $viewData['idfac'] = $idFactura;
    renderizar("pasarela/respuesta", $viewData);
}
// Correr el controlador
run();

function executePaypal()
{
    if (isset($_GET['PayerID'])) {
        $apiContext = getApiContext();
        
        $paymentId = $_GET['paymentId'];
        
        $payment = Payment::get($paymentId, $apiContext);
        $execution = new PaymentExecution();
        $execution->setPayerId($_GET['PayerID']);

        try {
            // error_log($payment->toJSON());
            $result = $payment->execute($execution, $apiContext);
            
            //error_log($result);
            try {
                $payment = Payment::get($paymentId, $apiContext);
            } catch (Exception $ex) {
                error_log($ex);
                return false;
            }
        } catch (Exception $ex) {
            error_log($ex);
        }
        return $payment;
    } else {
        error_log("Usuario cancelo transacción o no es un a peticio adecuada");
        return false;
    }
}

?>
