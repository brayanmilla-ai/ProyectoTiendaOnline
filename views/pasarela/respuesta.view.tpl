<div class="my-5 py-3 z-depth-1 rounded">


    <!--Section: Content-->
    <section class="dark-grey-text">
        {{ifnot error}}
        <!-- Shopping Cart table -->
        <div class="table-responsive">
            <h2>{{checkoutTitle}}</h2>
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
                    {{foreach products}}
                    <tr>
                        <th scope="row">
                            <img src="{{urlprd}}" alt="" class="img-fluid z-depth-0">
                        </th>
                        <td>
                            <h4 class="mt-3">
                                <strong>{{dscprd}}</strong>
                            </h4>
                        </td>
                        <td>{{productoscol}}</td>
                        <td></td>
                        <td>L {{fctPrc}}</td>
                        <td>
                            <span style="padding-left: 15px; padding-right:15px">{{fctCtd}}</span>
                        </td>
                        <td class="font-weight-bold">
                            <strong>L {{subTotal}}</strong>
                        </td>
                        <td>

                        </td>
                    </tr>
                    {{endfor products}}
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

                        </td>
                    </tr>
                    <!-- Fourth row -->

                </tbody>
                <!-- /.Table body -->

            </table>

        </div>
        <!-- /.Shopping Cart table -->
        <div class="alert alert-success" role="alert">
            <strong>Gracias por tu compra!!. Orden registrada y verificada. Tu ID de pedido es: {{idfac}}
            </strong>
        </div>

        <div>
            <a href="index.php?page=home"><button class="btn btn-success">Continuar Comprando</button></a>
        </div>

        {{endifnot error}}

        {{if error}}
        <h1>{{error}}</h1>
        {{endif error}}

    </section>
    <!--Section: Content-->


</div>