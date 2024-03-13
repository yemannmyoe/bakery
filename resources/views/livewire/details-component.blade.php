<main id="main" class="main-site">

<style>
	.regprice{
		font-weight: 300;
		font-size: 13px !important;
		color: #aaaaaa !important;
		text-decoration: line-through;
		padding-left:10px;

	}
</style>

		<div class="container">

			<div class="wrap-breadcrumb">
				<ul>
					<li class="item-link"><a href="/" class="link">home</a></li>
					<li class="item-link"><span>detail</span></li>
				</ul>
			</div>
			<div class="row">

				<div class="col-lg-9 col-md-8 col-sm-8 col-xs-12 main-content-area">
					<div class="wrap-product-detail">
						<div class="detail-media">
							<div class="product-gallery">
							  <ul class="slides">
							    <li data-thumb="{{asset('assets/images/products')}}/{{ $product->image }}">
							    	<img src="{{asset('assets/images/products')}}/{{ $product->image }}" alt="{{ $product->name }}" />
							    </li>

							  </ul>
							</div>
						</div>
						<div class="detail-info">
							<div class="product-rating">
                              
                            </div>
                            <h2 class="product-name">{{ $product->name }}</h2>
                            <div class="short-desc">
                               {!! $product->short_description !!}
                            </div>
                            <div class="wrap-social">
                            	<a class="link-socail" href="#"><img src="{{asset('assets/images/social-list.png')}}" alt=""></a>
                            </div>
							@if($product->sale_price>0 && $sale->status == 1 && $sale->sale_date> Carbon\Carbon::now())
						<div class="wrap-price"><span class="product-price">{{ $product->sale_price }} MMK</span>
							<del>
								<span class="product-price regprice">
									{{ $product->regular_price }} MMK
								</span>
							</del>
						</div>
							@else
							<div class="wrap-price"><span class="product-price">{{ $product->regular_price }} MMK</span></div>
							@endif
                            <div class="stock-info in-stock">
                                <p class="availability">Availability: <b>{{ $product->stock_status }}</b></p>
                            </div>
                            <div class="quantity">
                            	<span>Quantity:</span>
								<div class="quantity-input">
									<input type="text" name="product-quatity" value="1" data-max="120" pattern="[0-9]*" wire:model="qty" >
									
									<a class="btn btn-reduce" wire:click.prevent="decreaseQuantity" ></a>
									<a class="btn btn-increase" wire:click.prevent="increaseQuantity"></a>
								</div>
							</div>
							<div class="wrap-butons">
								@if( $product->stock_status === 'outofstock')
								<a href="#" class="btn add-to-cart" wire:click.prevent="">Out Of Stock</a>
								<a href="/shop" class="btn add-to-cart" >SHOP</a>
								@else

							@if($product->sale_price>0 && $sale->status == 1 && $sale->sale_date> Carbon\Carbon::now())
							<a href="#" class="btn add-to-cart" wire:click.prevent="store({{ $product->id }},'{{ $product->name }}',{{$product->sale_price}} )">Add to Cart</a>
							@else
							<a href="#" class="btn add-to-cart" wire:click.prevent="store({{ $product->id }},'{{ $product->name }}',{{$product->regular_price}} )">Add to Cart</a>
							@endif
							
							@endif
                                <div class="wrap-btn">
                               
                                </div>
							</div>
						</div>
						<div class="advance-info">
							<div class="tab-control normal">
								<a href="#description" class="tab-control-item active">description</a>
							
							</div>
							<div class="tab-contents">
								<div class="tab-content-item active" id="description">
									{!! $product->description !!}
								</div>
								<!-- <div class="tab-content-item " id="add_infomation">
									<table class="shop_attributes">
										<tbody>
											<tr>
												<th>Weight</th><td class="product_weight">1 kg</td>
											</tr>
											<tr>
												<th>Dimensions</th><td class="product_dimensions">12 x 15 x 23 cm</td>
											</tr>
											<tr>
												<th>Color</th><td><p>Black, Blue, Grey, Violet, Yellow</p></td>
											</tr>
										</tbody>
									</table>
								</div> -->
								
							</div>
						</div>
					</div>
				</div><!--end main products area-->

				<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12 sitebar">
					<div class="widget widget-our-services ">
						<div class="widget-content">
							<ul class="our-services">

								
							</ul>
						</div>
					</div><!-- Categories widget-->

					<div class="widget mercado-widget widget-product">
						<h2 class="widget-title">Popular Products</h2>
						<div class="widget-content">
							<ul class="products">
							

							@foreach ($popular_products as $popular )
                            <li class="product-item">
									<div class="product product-widget-style">
										<div class="thumbnnail">
											<a href="{{ route('product.details',['slug'=>$popular->slug]) }}" title="{{ $product->name }}">
												<figure><img src="{{asset('assets/images/products')}}/{{$popular->image}}" alt=""></figure>
											</a>
										</div>
										<div class="product-info">
											<a href="{{ route('product.details',['slug'=>$popular->slug]) }}" class="product-name"><span>{{ $popular->name }}</span></a>
											<div class="wrap-price"><span class="product-price">{{ $popular->regular_price }} MMK</span></div>
										</div>
									</div>
								</li>
                            @endforeach

							</ul>
						</div>
					</div>

				</div><!--end sitebar-->

				<div class="single-advance-box col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="wrap-show-advance-info-box style-1 box-in-site">
						<h3 class="title-box">Related Products</h3>
						<div class="wrap-products">
							<div class="products slide-carousel owl-carousel style-nav-1 equal-container" data-items="5" data-loop="false" data-nav="true" data-dots="false" data-responsive='{"0":{"items":"1"},"480":{"items":"2"},"768":{"items":"3"},"992":{"items":"3"},"1200":{"items":"5"}}' >


							@foreach ($related_products as $related )
							<div class="product product-style-2 equal-elem ">
									<div class="product-thumnail">
										<a href="{{ route('product.details',['slug'=>$related->slug]) }}" title="{{ $related->name }}">
											<figure><img src="{{asset('assets/images/products')}}/{{$related->image}}" width="214" height="214" alt="{{ $related->name }}"></figure>
										</a>
										<div class="group-flash">
											<span class="flash-item new-label">new</span>
										</div>
										<div class="wrap-btn">
											<a href="#" class="function-link">quick view</a>
										</div>
									</div>
									<div class="product-info">
										<a href="{{ route('product.details',['slug'=>$related->slug]) }}" class="product-name"><span>{{ $related->name }}</span></a>
										<div class="wrap-price"><span class="product-price">{{ $related->regular_price }}MMK</span></div>
									</div>
										
							</div>
							
							@endforeach
						
						
							
						</div><!--End wrap-products-->
					</div>
				</div>

			</div><!--end row-->

		</div><!--end container-->

	</main>