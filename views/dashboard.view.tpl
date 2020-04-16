<header>
  <h1>Bienvenido {{userScreenName}}</h1>
</header>

<section>
  <div class="row">
    <div class="row">
      <div class="col-md-9">
        <h3>Productos</h3>
      </div>
      <div class="col-md-3">
        <!-- Controls -->
        <div class="controls pull-right hidden-xs">
          <a class="left fa fa-chevron-left btn btn-success" href="#prodSalud" data-slide="prev"></a>
          <a class="right fa fa-chevron-right btn btn-success" href="#prodSalud" data-slide="next"></a>
        </div>
      </div>
    </div>
    <div id="prodSalud" class="carousel slide hidden-xs" data-ride="carousel">
      <!-- Wrapper for slides -->
      <div class="carousel-inner">

        <div class="item active">
          <div class="row">
            {{foreach productos}}
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
                      <a href="index.php?page=addtocart&codprd={{codprd}}" class="hidden-sm sendToCart">Añadir
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
            {{endfor productos}}
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
  $().ready(function () {
    $(".sendToCart").click(function (e) {
      e.preventDefault();
      e.stopPropagation();
      $.post(
        $(this).attr("href"),
        function (data, success, xqXML) {
          console.log(data);
          if (data.cartAmount && data.cartAmount > 0) {
            window.location.reload();
          }
        }
      );
    });
  });
</script>
<style>
  .card {
    position: relative;
  }

  .card-desc {
    height: 4em;
    overflow: scroll;
  }

  .card-side {
    position: absolute;
    top: 6em;
    left: 1em;
    transform-origin: left top;
    transform: rotate(-90deg);
  }
</style>