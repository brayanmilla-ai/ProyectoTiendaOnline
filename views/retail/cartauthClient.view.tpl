<div class="my-5 py-3 z-depth-1 rounded">


  <!--Section: Content-->
  <section class="dark-grey-text">

    <!-- Shopping Cart table -->
    <div class="table-responsive">

      <table class="table product-table mb-0">

        <!-- Table head -->
        <thead class="mdb-color lighten-5">
          <tr>
            <th></th>
            <th class="font-weight-bold">
              <strong>Producto</strong>
            </th>
            <th class="font-weight-bold">
              <strong>Color</strong>
            </th>
            <th></th>
            <th class="font-weight-bold">
              <strong>Precio</strong>
            </th>
            <th class="font-weight-bold">
              <strong>Cantidad</strong>
            </th>
            <th class="font-weight-bold">
              <strong>Total</strong>
            </th>
            <th></th>
          </tr>
        </thead>
        <!-- /.Table head -->

        <!-- Table body -->
        <tbody>

          <!-- First row -->
          {{if cartEntries}}
          {{foreach products}}
          <tr>
            <th scope="row">
              <img src="{{urlprd}}" alt="" class="img-fluid z-depth-0">
            </th>
            <td>
              <h4 class="mt-3">
                <strong>{{dscprd}}</strong>
              </h4>
              <p class="text-muted">{{sdscprd}}</p>
            </td>
            <td>{{productoscol}}</td>
            <td></td>
            <td>L {{crrprc}}</td>
            <td>

              <a class="mdftocart" href="index.php?page=rmvtocart&codprd={{codprd}}&ct=1"><span class="iconify"
                  data-icon="ion:remove" data-inline="false"></span></a>
              <span style="padding-left: 15px; padding-right:15px">{{crrctd}}</span>
              <a class="mdftocart" href="index.php?page=addtocart&codprd={{codprd}}"><span class="iconify"
                  data-icon="ion:add" data-inline="false"></span></a>

            </td>
            <td class="font-weight-bold">
              <strong>$ {{subtotal}}</strong>
            </td>
            <td>
              <a href onclick="postUrl('index.php?page=rmvtocart&codprd={{codprd}}')">
                <button type="button" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top"
                  title="Quitar del carrito">X
                </button>
              </a>
            </td>
          </tr>
          {{endfor products}}
          {{endif cartEntries}}

          {{ifnot cartEntries}}
          <tr>
            <td>
              <h1>No hay datos</h1>
            </td>
          </tr>
          {{endifnot cartEntries}}
          <!-- /.First row -->

          <!-- Fourth row -->
          <tr>
            <td colspan="3"></td>
            <td>
              <h4 class="mt-2">
                <strong>Items: </strong> {{totctd}}
              </h4>
            </td>
            <td class="text-right">
              <h4 class="mt-2">
                <strong>Total: </strong>{{total}}
              </h4>
            </td>
            <td colspan="3" class="text-right">
              {{if cartEntries}}
              <a href="index.php?page={{pag}}">
                <button type="button" class="btn btn-primary btn-rounded">Completar Compra
                </button>
              </a>
              {{endif cartEntries}}
            </td>
          </tr>
          <!-- Fourth row -->

        </tbody>
        <!-- /.Table body -->

      </table>

    </div>
    <!-- /.Shopping Cart table -->

  </section>
  <!--Section: Content-->


</div>

<script>

  function postUrl(url) {
    var form_data = $(this).serialize();
    $.ajax({
      url: url,
      type: "POST",
      dataType: "json",
      data: form_data,
    }).done(function (data, success, xqXML) {
      window.location.reload();
    });
  }

</script>

<script>

  $(".mdftocart, .rmvcart").click(function (e) {
    e.preventDefault();
    e.stopPropagation();
    $.post(
      $(this).attr("href"),
      function (data, success, xqXML) {

        window.location.reload();

      }
    );
  });

</script>