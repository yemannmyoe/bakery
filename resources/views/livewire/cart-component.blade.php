
<main id="main" class="main-site">

<div class="container">

    <div class="wrap-breadcrumb">
        <ul>
            <li class="item-link"><a href="/" class="link">home</a></li>
            <li class="item-link"><span>login</span></li>
        </ul>
    </div>
    <div class=" main-content-area">
        @if(Cart::instance('cart')->count()>0)

        <div class="wrap-iten-in-cart">
            @if(Session::has('success_message'))
                <div class="alert alert-success">
                    <Strong>Success</Strong> {{ Session::get('success_message') }}
                </div>
            @endif
            @if(Cart::instance('cart')->count() > 0)
            <h3 class="box-title">Products Name</h3>
            <ul class="products-cart">
                @foreach (Cart::instance('cart')->content() as $item)
               
                <li class="pr-cart-item">
							<div class="product-image">
								<figure><img src="{{asset('assets/images/products')}}/{{$item->model->image}}" alt="{{ $item->model->name }}"></figure>
							</div>
							<div class="product-name">
								<a class="link-to-product" href="{{ route('product.details',['slug'=>$item->model->slug]) }}"> {{ $item->model->name }}</a>
							</div>
                           
                            @if($item->model->sale_price>0 && $sale->status == 1 && $sale->sale_date > Carbon\Carbon::now())
                            <div class="price-field produtc-price"><p class="price">  {{ $item->model->sale_price }}</p></div>
							@else
                            <div class="price-field produtc-price"><p class="price">  {{ $item->model->regular_price }}</p></div>
							@endif
							
							<div class="quantity">
                                @if($item->qty > $item->model->quantity  )
                                <div class="price-field produtc-price"><p class="price"> Out of stock</p></div>
                                @endif
								<div class="quantity-input">
                                    @if($item->qty > $item->model->quantity  )
									<a class="btn btn-reduce" href="#" wire:click.prevent="decreaseQuantity('{{$item->rowId}}')"></a>
                                    @else
									<input type="text" name="product-quatity" value="{{ $item->qty }}" data-max="120" pattern="[0-9]*">									
									<a class="btn btn-increase" href="#" wire:click.prevent="increaseQuantity('{{$item->rowId}}')"></a>
									<a class="btn btn-reduce" href="#" wire:click.prevent="decreaseQuantity('{{$item->rowId}}')"></a>
                                    @endif
								</div>
							</div>
                            @if($item->qty > $item->model->quantity  )
                            <div class="price-field sub-total"><p class="price"> Out Of Stock </p></div>
                            @else
                            <div class="price-field sub-total"><p class="price"> {{ $item->subtotal}} </p></div>
                            @endif
						
							<div class="delete">
								<a href="#" wire:click.prevent="destroy('{{$item->rowId}}')" class="btn btn-delete" title="">
									<span>Delete from your cart</span>
									<i class="fa fa-times-circle" aria-hidden="true"></i>
								</a>
							</div>
						</li>	
              
               
                  
                @endforeach
            
             											
            </ul>
            @else
            <p>NO item in CART</p>
            @endif
        </div>

        <div class="summary">
            <div class="order-summary">
                <h4 class="title-box">Order Summary</h4>
                @if($item->qty > $item->model->quantity  )
                <p class="summary-info text-danger"><span class="title">Subtotal</span><b class="index ">One of your cart item is out of stock. Please reduce</b></p>
                @else
                <p class="summary-info"><span class="title">Subtotal</span><b class="index">{{ Cart::instance('cart')->subtotal() }}MMK</b></p>
                @endif
                @if (Session::has('coupon'))
                <p class="summary-info"><span class="title">Discount ({{Session::get('coupon')['code']}})
                <a href="#" wire:click.prevent="removeCoupon">
                    <i class="fa fa-times text-danger"></i>
                </a>
                </span><b class="index"> {{$discount}}MMK</b></p>
                <p class="summary-info"><span class="title">Subtotal with Discount</span><b class="index"> {{$subtotalAfterDiscount}}MMK</b></p>
                <p class="summary-info"><span class="title">Tax({{config('cart.tax')}}%)</span><b class="index"> {{$taxAfterDiscount}}MMK</b></p>
                
                <p class="summary-info total-info "><span class="title">Total</span><b class="index">{{$totalAfterDiscount}} MMK</b></p>
                    @else
                    <p class="summary-info"><span class="title">Tax</span><b class="index">{{ Cart::tax() }} MMK</b></p>
                    <p class="summary-info"><span class="title">Shipping</span><b class="index">Free Shipping</b></p>
                    <p class="summary-info total-info "><span class="title">Total</span><b class="index">{{ Cart::instance('cart')->total() }} MMK</b></p>
                @endif
               
            </div>
          

            <div class="checkout-info">
                @if(!Session::has('coupon'))
                <label class="checkbox-field">
                    <input class="frm-input " name="have-code" id="have-code" value="1" type="checkbox" wire:model="haveCouponCode"><span>I have promo code</span>
                </label>
                @if($haveCouponCode == 1)
                <div class="summary-item">
                    <form action="" wire:submit.prevent="applyCouponCode">
                        <h4 class="title-box">Coupon Code</h4>
                        @if (Session::has('coupon_message'))
                            <div class="alert alert-danger">
                                {{ Session::get('coupon_message')}}
                            </div>
                        @endif
                        <p class="row-in-form">

                            <label for="coupon-code">Enter Your Coupon:</label>
                            <input type="text" name="coupon-code" wire:model="couponCode" />
                        </p>
                        <button type="submit" class="btn btn-small">Apply</button>
                    </form>
                </div>
                @endif
                @endif
                @if($item->qty > $item->model->quantity  )
                <a class="btn btn-checkout" href="#" disabled>Check out</a>
                @elseif($item->qty < $item->model->quantity)
                <a class="btn btn-checkout" href="#" wire:click.prevent="checkout">Check out</a>
                @endif
                <a class="link-to-shop" href="shop.html">Continue Shopping<i class="fa fa-arrow-circle-right" aria-hidden="true"></i></a>
            </div>
            <div class="update-clear">
                <a class="btn btn-clear" href="#" wire:click.prevent="destroyAll()">Clear Shopping Cart</a>
                <a class="btn btn-update" href="#">Update Shopping Cart</a>
            </div>
        </div>
        @else
            <div class="text-center" style="padding:10px 0;">
                <h1>Your cart is empty!!</h1>
                <p>Add item to it now</p>
                <a href="/shop" class="btn btn-success">Shop Now</a>
            </div>
        @endif

     
    </div><!--end main content area-->
</div><!--end container-->

</main>
<!--main area-->