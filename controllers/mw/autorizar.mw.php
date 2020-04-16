<?php
require 'models/security/security.model.php';
require 'models/security/programas.model.php';

function generarMenu($usercod)
{
    $menu = array();

    if (isAuthorized('dashboard', $usercod)) {
        $menu[] = array("mdlprg"=>"dashboard","mdldsc"=>"Escritorio");
    }
    //Agregar Nuevos o Partes del Menu (Recuerde no Sobre Cargaer)
    // Perfil Administrativo
    if (isAuthorized('security', $usercod) ) {
        $menu[] = array("mdlprg"=>"security","mdldsc"=>"Seguridad");
    }
    if (isAuthorized('parametros', $usercod) ) {
        $menu[] = array("mdlprg"=>"parametros","mdldsc"=>"Mantenimientos");
    }
    if (isAuthorized('historialUser', $usercod) ) {
        $menu[] = array("mdlprg"=>"historialUser","mdldsc"=>"Historial Compras");
    }
    if (isAuthorized('historialAnon', $usercod) ) {
        $menu[] = array("mdlprg"=>"historialAnon","mdldsc"=>"Historial Compras");
    }
    

    addToContext('appmenu', $menu);
}

function isAuthorized($assetCode, $usercod)
{
    $programa = obtenerFuncionPorCodigo($assetCode);
    /* if($programa){
        if (count($programa) == 0) {
        insertFuncion($assetCode, $assetCode, 'ACT', 'PRG');
    }
    }*/
    if ($_SESSION["userType"] == 'ADM') {
        return estaAutorizado($usercod, $assetCode);
    }
    if ($_SESSION["userType"] == 'CLT') {
       return estaAutorizado($usercod, $assetCode); 
    }
    return false;
}

function hasAccess($functionCode, $usercod)
{
    $programa = obtenerFuncionPorCodigo($assetCode);
    /* if (count($programa) == 0) {
        insertPrograma($assetCode, $assetCode, 'ACT', 'FNC');
    } */
    if ($_SESSION["userType"] == 'ADM') {
        return estaAutorizado($usercod, $assetCode);
    }
    if ($_SESSION["userType"] == 'CLT') {
        return estaAutorizado($usercod, $assetCode);
    }
    return false;

}
?>
