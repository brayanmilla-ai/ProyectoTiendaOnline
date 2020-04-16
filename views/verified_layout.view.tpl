<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <title>{{page_title}}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="public/css/papier.css" />
  <link rel="stylesheet" href="public/css/estilo.css" />
  <link rel="stylesheet" href="public/css/productos.css">
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
  <div class="menu">
    <div class="brand"><a href="index.php?page=home">{{page_title}}</a></div>
    <ul>
      {{if notifnum}}
      <li><a href="index.php?page=notificacion">
          <span class="ion-android-notifications">&nbsp;{{notifnum}}</span></a>
      </li>
      {{endif notifnum}}

      {{foreach appmenu}}
      <li><a href="index.php?page={{mdlprg}}">{{mdldsc}}</a></li>
      {{endfor appmenu}}

      {{if cartEntries}}
      <li>
        <a href="index.php?page=cartauth"><span class="ion-ios-cart"></span> <span
            id="cartcounter">{{cartEntries}}</span>
        </a>
      </li>
      {{endif cartEntries}}
      <li><a href="index.php?page=logout">Cerrar Sesión</a></li>
    </ul>
    <div class="hbtn">
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
    </div>
  </div>

  <div class="container">
    <div class="contenido">
      {{{page_content}}}
    </div>
  </div>


  <div class="footer">
    Derechos Reservados 2020
  </div>
  {{foreach js_ref}}
  <script src="{{uri}}"></script>
  {{endfor js_ref}}
  <script>
    $().ready(function (e) {

      $(".hbtn").click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        $(".menu").toggleClass('open');
      });
    });
  </script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</body>

</html>