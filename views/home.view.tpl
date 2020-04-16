<!-- <section class="cards row">
  {{foreach productos}}
  <section class="col-12 col-sm-6 col-md-3 m-padding">
    <div class="card col-12 depth-2 m-padding">
      <span class="col-sm-12 center depth-1">
        {{if urlthbprd}}
        <img src="{{urlthbprd}}" alt="{{skuprd}} {{dscprd}}" class="imgthumb center" />
        {{endif urlthbprd}}
      </span>
      <span class="col-12 center depth-1 m-padding card-desc">
        <span class="card-side">{{skuprd}}</span>
        <span class="col-12">{{dscprd}}</span>
      </span>
      <span class="col-12 center depth-1 m-padding">
        <span class="col-6 m-padding">Disponibles</span>
        <span class="col-6 right m-padding">{{stkprd}}</span>
        <span class="col-12 bold center m-padding">
          <a href="index.php?page=addtocart&codprd={{codprd}}" class="l-padding btn btn-primary col-12 sendToCart">
            L {{prcprd}} <span class="ion-plus-circled"></span>
          </a>
        </span>
      </span>
    </div>
    <h1>{{sesion}}</h1>
  </section>
  {{endfor productos}}
</section> -->

<section>
  <div class="row">
    <div class="row">
      <div class="col-md-9">
        <h3>Salud</h3>
      </div>
      <div class="col-md-3">
        <!-- Controls -->
        <div class="controls pull-right">
          <a class="left fa fa-chevron-left btn btn-success" href="#prodSalud" data-slide="prev"></a>
          <a class="right fa fa-chevron-right btn btn-success" href="#prodSalud" data-slide="next"></a>
        </div>
      </div>
    </div>
    <div id="prodSalud" class="carousel slide" data-ride="carousel">
      <!-- Wrapper for slides -->
      <div class="carousel-inner">

        <div class="item active">
          <div class="row">
            {{foreach productosSalud}}
            <div class="col-sm-3">
              <div class="col-item">
                <div class="photo">
                  {{if urlthbprd}}
                  <img src="{{urlthbprd}}" alt="{{skuprd}} {{dscprd}}" class="img-responsive" />
                  {{endif urlthbprd}}
                </div>
                <div class="info">
                  <div class="row">
                    <div class="price col-md-6">
                      <h4>{{dscprd}}</h4>
                      <h6>{{skuprd}}</h6>
                      <h4 class="price-text-color">$ {{prcprd}}</h4>
                    </div>
                    <div class="rating hidden-sm col-md-6">
                      <!-- <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                      </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                      </i><i class="fa fa-star"></i> -->
                      <h5>Disponibles {{stkprd}}</h5>
                    </div>
                  </div>
                  <div class="separator clear-left">
                    <p class="btn-add">
                      <i class="fa fa-shopping-cart"></i>
                      <a href onclick="postUrl('index.php?page=addtocart&codprd={{codprd}}')"
                        class="hidden-sm sendToCart">Añadir
                        al carrito</a></p>
                    <!-- <p class="btn-details">
                      <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More
                        details</a>
                    </p> -->
                  </div>
                  <div class="clearfix">
                  </div>
                </div>
              </div>
            </div>
            {{endfor productosSalud}}

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<section>
  <div class="row">
    <div class="row">
      <div class="col-md-9">
        <h3>Tecnologia</h3>
      </div>
      <div class="col-md-3">
        <!-- Controls -->
        <div class="controls pull-right">
          <a class="left fa fa-chevron-left btn btn-success" href="#prodTec" data-slide="prev"></a>
          <a class="right fa fa-chevron-right btn btn-success" href="#prodTec" data-slide="next"></a>
        </div>
      </div>
    </div>
    <div id="prodTec" class="carousel slide" data-ride="carousel">
      <!-- Wrapper for slides -->
      <div class="carousel-inner">

        <div class="item active">
          <div class="row">
            {{foreach productosTec}}
            <div class="col-sm-3">
              <div class="col-item">
                <div class="photo">
                  {{if urlthbprd}}
                  <img src="{{urlthbprd}}" alt="{{skuprd}} {{dscprd}}" class="img-responsive" />
                  {{endif urlthbprd}}
                </div>
                <div class="info">
                  <div class="row">
                    <div class="price col-md-6">
                      <h4>{{dscprd}}</h4>
                      <h6>{{skuprd}}</h6>
                      <h4 class="price-text-color">$ {{prcprd}}</h4>
                    </div>
                    <div class="rating hidden-sm col-md-6">
                      <!-- <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                      </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                      </i><i class="fa fa-star"></i> -->
                      <h5>Disponibles {{stkprd}}</h5>
                    </div>
                  </div>
                  <div class="separator clear-left">
                    <p class="btn-add">
                      <i class="fa fa-shopping-cart"></i>
                      <a href onclick="postUrl('index.php?page=addtocart&codprd={{codprd}}')"
                        class="hidden-sm sendToCart">Añadir
                        al carrito</a></p>
                    <!-- <p class="btn-details">
                      <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More
                        details</a>
                    </p> -->
                  </div>
                  <div class="clearfix">
                  </div>
                </div>
              </div>
            </div>
            {{endfor productosTec}}

          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
  function postUrl(url) {
    var form_data = $(this).serialize();
    $.ajax({
      url: url,
      type: "POST",
      dataType: "json",
      data: form_data,
    }).done(function (data, success, xqXML) {
      console.log(data);
    });
  }
  /*$(".sendToCart").click(function (e) {
    var form_data = $(this).serialize();
    $.ajax({
      url: $(this).attr("href"),
      type: "POST",
      dataType: "json",
      data: form_data,
    }).done(function (data, success, xqXML) {
      if (data.cartAmount && data.cartAmount > 0) {
        window.location.reload();
      }
    });
  });*/
</script>