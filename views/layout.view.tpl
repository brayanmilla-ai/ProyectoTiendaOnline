<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>{{page_title}}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="public/css/menu.css">
    <link rel="stylesheet" href="public/css/footer.css">
    <link rel="stylesheet" href="public/css/productos.css">
    <script src="public/js/menu.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <script src="public/js/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="https://code.iconify.design/1/1.0.5/iconify.min.js"></script>
    <script src="http://code.jquery.com/jquery.js"></script>
    {{foreach css_ref}}
    <link rel="stylesheet" href="{{uri}}" />
    {{endfor css_ref}}

</head>

<body>

    <div id="flipkart-navbar">
        <div class="container-fluid">
            <div class="row row1">
                <div class="col-sm-9"></div>
                <div class="col-sm-2">
                    <ul class="largenav pull-right">
                        {{ifnot userLogged}}
                        <li class="upper-links"><a class="links" href="index.php?page=login">Iniciar Sesión </a></li>
                        <li class="upper-links"><a class="links" href="index.php?page=register">Crear Cuenta</a></li>
                        <li class="upper-links"><a class="links"
                                        href="index.php?page=historialAnon">Historial</a></li>
                        {{endifnot userLogged}}
                        {{if userLogged}}
                        <li class="upper-links dropdown"><a class="links" href>
                                <span class="iconify iconify2" data-icon="ion:list-circle-outline"
                                    data-inline="false"></span>
                            </a>
                            <ul class="dropdown-menu">
                                {{foreach appmenu}}
                                <li class="profile-li"><a class="profile-links"
                                        href="index.php?page={{mdlprg}}">{{mdldsc}}</a>
                                </li>
                                {{endfor appmenu}}
                                <li class="profile-li"><a class="profile-links" href="index.php?page=logout">Cerrar
                                        Sesión</a></li>
                            </ul>
                        </li>
                        {{endif userLogged}}
                    </ul>
                </div>
                <div class="col-sm-1"></div>
            </div>
            <div class="row row2">
                <div class="col-sm-2">
                    <h2 style="margin:0px;"><span class="smallnav menu" onclick="openNav()">☰ {{page_title}}</span></h2>
                    <h1 style="margin:0px; margin-top: 0px;">
                        <span class="largenav">
                            <a class="links" href="index.php?page=home">{{page_title}}</a>
                        </span>
                    </h1>
                </div>
                <div class="flipkart-navbar-search smallsearch col-sm-8 col-xs-11">
                    <div class="row" style="display: flex;">
                        <input class="flipkart-navbar-input col-xs-11" type=""
                            placeholder="Search for Products, Brands and more" name="">
                        <button class="flipkart-navbar-button col-xs-1 m">
                            <span class="iconify" data-icon="ion:search" data-inline="true"></span>
                        </button>
                    </div>
                </div>
                {{ifnot cartEntries}}
                <div class="cart largenav col-sm-2">
                    <a class="cart-button" href="index.php?page=cartanon">
                        <span class="iconify" data-icon="ion:cart-outline" data-inline="true"></span>
                        <span class="item-number">{{cartEntries}}</span>

                    </a>
                </div>
                {{endifnot cartEntries}}

                {{if cartEntries}}
                <div class="cart largenav col-sm-2 collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href class="fondo cart-button dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-expanded="false" style="padding-top: 10px;">
                                <span class="iconify" data-icon="ion:cart-outline" data-inline="true"></span>
                                <span class="item-number">{{cartEntries}} Items</span>
                            </a>

                            <ul class="dropdown-menu dropdown-cart" role="menu">
                                {{foreach cartDetalles}}
                                <li>
                                    <span class="item">
                                        <span class="item-left">
                                            {{if urlthbprd}}
                                            <img src="{{urlthbprd}}" alt="{{skuprd}} {{dscprd}}" width="35" />
                                            {{endif urlthbprd}}
                                            <span class="item-info">
                                                <span>{{dscprd}}</span>
                                                <span>L {{prcprd}}</span>
                                                <span>Cantidad: {{crrctd}}</span>
                                            </span>
                                        </span>
                                        <span class="item-right">
                                            <a class="rmv btn btn-xs btn-danger pull-right"
                                                style="color: white!important; text-decoration:none;"
                                                href="index.php?page=rmvtocart&codprd={{codprd}}">x</a>
                                        </span>
                                    </span>
                                </li>
                                {{endfor cartDetalles}}
                                <li class="divider"></li>
                                <li>
                                    {{if userLogged}}
                                    {{if admCarrito}}
                                    <a class="text-center" href="index.php?page=cartauth">Ver Carrito</a>
                                    {{endif admCarrito}}

                                    {{if CliCarrito}}
                                    <a class="text-center" href="index.php?page=cartauthClient">Ver Carrito</a>
                                    {{endif CliCarrito}}
                                    {{endif userLogged}}

                                    {{ifnot userLogged}}
                                    <a class="text-center" href="index.php?page=cartanon">Ver Carrito</a>
                                    {{endifnot userLogged}}
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                {{endif cartEntries}}

            </div>
        </div>
    </div>
    <div id="mySidenav" class="sidenav">
        <div class="container" style="background-color: #333; padding-top: 10px;">
            <span class="sidenav-heading">Home</span>
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
        </div>
        {{ifnot userLogged}}
        <a href="index.php?page=login">Iniciar Sesión </a></li>
        <a href="index.php?page=register">Crear Cuenta</a></li>
        {{endifnot userLogged}}
        {{if userLogged}}
        {{foreach appmenu}}
        <a href="index.php?page={{mdlprg}}">{{mdldsc}}</a>
        {{endfor appmenu}}
        <a class="profile-links" href="index.php?page=logout">
            Cerrar Sesión</a>
        {{endif userLogged}}
    </div>


    <div class="container">
        <div class="contenido">
            {{{page_content}}}
        </div>
    </div>

    <!-- Footer -->
    <footer class="page-footer font-small special-color-dark pt-4">

        <!-- Footer Elements -->
        <div class="container">
            <ul class="list-unstyled list-inline text-center">
                <li class="list-inline-item">
                    <a class="btn-floating btn-fb mx-1 waves-effect waves-light">
                        <span class="iconify btn-floating btn-fb mx-1 waves-effect waves-light"
                            data-icon="ion:logo-facebook" data-inline="false"></span>
                    </a>
                </li>

            </ul>
        </div>
        <!-- Footer Elements -->

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">© 2020 Copyright:
            <a href> Tienda Online</a>
        </div>
        <!-- Copyright -->

    </footer>
    <!-- Footer -->

    <script>

        $(".rmv").click(function (e) {
            var form_data = $(this).serialize();
            $.ajax({
                url: $(this).attr("href"),
                type: "POST",
                dataType: "json",
                data: form_data,
            }).done(function (data, success, xqXML) {
                window.location.reload();
            });
        });
    </script>

    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    {{foreach js_ref}}
    <script src="{{uri}}"></script>
    {{endfor js_ref}}


</body>

</html>