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
                            <span style="padding-left: 15px; padding-right:15px">{{crrctd}}</span>
                        </td>
                        <td class="font-weight-bold">
                            <strong>L {{subtotal}}</strong>
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
                        <td colspan="2"></td>
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
                        <td colspan="2" class="text-right">
                            <form action="index.php?page={{pag}}" method="post">
                                <button type="submit" name="btnSubmit" class="btn btn-primary m-padding">
                                    Pagar con Paypal
                                </button>
                            </form>
                        </td>
                    </tr>
                    <!-- Fourth row -->

                </tbody>
                <!-- /.Table body -->

            </table>

        </div>

    </section>
    <!--Section: Content-->


</div>