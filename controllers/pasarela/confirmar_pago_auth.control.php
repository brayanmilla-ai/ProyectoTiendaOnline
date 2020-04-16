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
require_once 'libs/paypal.php';
/**
 * Corre el Controlador de CartAnon
 *
 * @return void
 */
function run()
{
    /* 
    
    se verifica si esta o no esta logeado el usuario para obtener el carrito de compras adecuado
    
    */
    $usuario = "";
    $arrDataView = array();
    if($_SERVER["REQUEST_METHOD"] === "GET"){
        $usuario = $_SESSION["userCode"];
        $arrDataView = getAuthCartDetail($usuario); 
    }
    

    if($_SERVER['REQUEST_METHOD'] === 'POST'){
        $viewData = array();
        //Esto lo saca de la carretilla de compras
        if(isset($_SESSION["userCode"])){

            $usuario = $_SESSION["userCode"];
        $viewData = getAuthCartDetail($usuario);
        if (isset($_POST["btnSubmit"])) {
            //$viewData  = $_POST;
            $payPalReturn = createPaypalTransacction(0, $viewData["products"]);
            if ($payPalReturn) {
                redirectToUrl($payPalReturn);
            }
            $viewData["returndata"] = $payPalReturn;

        }
        resetCartTime($usuario);
        }

    }

    //Token
    $xrsToken = md5(time() . random_int(0, 10000) . "pg");
    $arrDataView["totalprod"] = $arrDataView["totctd"];
    $arrDataView['pag'] = "confir_pago_cli";
    $_SESSION['tokenRes'] = $xrsToken;
    renderizar("pasarela/confirmar_pago", $arrDataView);
}
// Correr el controlador
run();

function createPaypalTransacction( $_amount , $_items )
{
    $apiContext = getApiContext();
    $payer = new \PayPal\Api\Payer();
    $payer->setPaymentMethod('paypal');

    $items = new \PayPal\Api\ItemList();
    $_amount = 0 ;
    foreach ($_items as $_item) {
        $item = new \PayPal\Api\Item();
        $item->setSku($_item["skuprd"]);
        $item->setName($_item["dscprd"]);
        $item->setQuantity($_item["crrctd"]);
        $item->setPrice($_item["crrprc"]);
        $_amount += floatval($_item["total"]);
        $item->setCurrency('USD');
        $items->addItem($item);
    }

    $amount = new \PayPal\Api\Amount();
    $amount->setTotal(strval($_amount));
    $amount->setCurrency('USD');

    $transaction = new \PayPal\Api\Transaction();
    $transaction->setAmount($amount);
    $transaction->setNoteToPayee("Orden de Compra");
    $transaction->setItemList($items);

    $redirectUrls = new \PayPal\Api\RedirectUrls();
    $token = $_SESSION['tokenRes'];
    //TODO: Change This with host on production
    $redirectUrls
        ->setReturnUrl("http://127.0.0.1/tiendaOnline/index.php?page=respuesta&tocken=".$token)
        ->setCancelUrl("http://127.0.0.1/tiendaOnline/index.php?page=checkoutcnl");

    $payment = new \PayPal\Api\Payment();
    $payment->setIntent('sale')
        ->setPayer($payer)
        ->setTransactions(array($transaction))
        ->setRedirectUrls($redirectUrls);

    try {
        $payment->create($apiContext);
        //Importante para saber que trasacción y guardarlo en la db
        $_SESSION["paypalTrans"] = $payment;
        return $payment->getApprovalLink();
    } catch (\PayPal\Exception\PayPalConnectionException $ex) {
        // This will print the detailed information on the exception.
        //REALLY HELPFUL FOR DEBUGGING
        error_log($ex->getData());
        return false;
    }
}

?>
