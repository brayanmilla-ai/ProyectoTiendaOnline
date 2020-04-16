<?php
/**
 * PHP Version 7
 * Controlador de Paypal
 *
 * @category Controllers_Paypal
 * @package  Controllers\Paypal
 * @author   Orlando J Betancourth <orlando.betancourth@gmail.com>
 * @license  Comercial http://
 *
 * @version CVS:1.0.0
 *
 * @link http://url.com
 */
 // Sección de requires
require_once 'vendor/autoload.php';


/**
 * Retorna el Api Context de Paypal
 *
 * @return void
 */
function getApiContext()
{
    $apiContext = new \PayPal\Rest\ApiContext(
        new \PayPal\Auth\OAuthTokenCredential(
            "ARlcjkS_cqX4YZ3pBUN3SpsXgkNlG81b_3rpcUCQrusABdSqdLjVgv8PiXeFVZacTd98MP3VDOCxJD1V",
            "ECw6qTmRKI9i9egCYpIri9gteik5A5F9DI56_f0KvASl08vH5PIGo0RoCIIgrR1bEuT5sfq3pi_-pFC3"
        )
    );
    return $apiContext;
}
