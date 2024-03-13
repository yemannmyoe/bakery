	
	<main id="main" class="main-site">

		<div class="container">
<style>
	.wrap-address-billing .row-in-form input[type=password] {
    font-size: 13px;
    line-height: 19px;
    display: inline-block;
    height: 43px;
    padding: 2px 20px;
    width: 100%;
    border: 1px solid #e6e6e6;
}
</style>
			<div class="wrap-breadcrumb">
				<ul>
					<li class="item-link"><a href="/" class="link">home</a></li>
					<li class="item-link"><span>Checkout</span></li>
				</ul>
			</div>
			<div class=" main-content-area">
				<form action="" wire:submit.prevent="placeOrder">
				<div class="row">
					<div class="col-md-12">
						<div class="wrap-address-billing">
							<h3 class="box-title">Billing Address</h3>
							<div class="billing-address">
								<p class="row-in-form">
									<label for="fname">first name<span>*</span></label>
									<input  type="text" name="fname" value="" placeholder="Your name" wire:model="firstname">
								</p>
								@error('firstname')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="lname">last name<span>*</span></label>
									<input  type="text" name="lname" value="" placeholder="Your last name" wire:model="lastname">
								</p>
								@error('lastname')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="email">Email Addreess:</label>
									<input  type="email" name="email" value="" placeholder="Type your email" wire:model="email">
								</p>
								@error('email')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="phone">Phone number<span>*</span></label>
									<input  type="number" name="phone" value="" placeholder="10 digits format" wire:model="mobile">
								</p>
								@error('mobile')
								<span class="text-danger">{{$message}}</span>
								@enderror

								<p class="row-in-form">
									<label for="phone">Line1<span>:</span></label>
									<input  type="text" name="add" value="" placeholder="street at apartment number" wire:model="line1">
								</p>
								@error('line1')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="phone">Line2<span>:</span></label>
									<input  type="text" name="add" value="" placeholder="street at apartment number" wire:model="line2">
								</p>
								@error('line2')
								<span class="text-danger">{{$message}}</span>
								@enderror

								
								<p class="row-in-form">
									<label for="country">Country<span>*</span></label>
									<input type="text" name="country" value="" placeholder="Myanmar" wire:model="country">
								</p>
								@error('country')
								<span class="text-danger">{{$message}}</span>
								@enderror
								

								<p class="row-in-form">
									<label for="city">Province<span>*</span></label>
									<input type="text" name="province" value="" placeholder="Province" wire:model="province">
								</p>
								@error('province')
								<span class="text-danger">{{$message}}</span>
								@enderror

								<p class="row-in-form">
									<label for="city">Town / City<span>*</span></label>
									<input type="text" name="city" value="" placeholder="City name" wire:model="city">
								</p>
								@error('city')
								<span class="text-danger">{{$message}}</span>
								@enderror

								<p class="row-in-form">
									<label for="zip-code">Postcode / ZIP:</label>
									<input  type="number" name="zip-code" value="" placeholder="Your postal code" wire:model="zipcode">
								</p>
								@error('zipcode')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form fill-wife">
									<label class="checkbox-field">
										<input name="different-add" id="different-add" value="1" type="checkbox" wire:model="ship_to_different">
										<span>Delivery to different cities ?</span>
									</label>
								</p>
							</div>
						</div>
					</div>

					@if($ship_to_different)
					<div class="col-md-12">
						<div class="wrap-address-billing">
							<h3 class="box-title">Shipping Address</h3>
							<div class="billing-address">
								
							{{-- shipping --}}
								<p class="row-in-form">
									<label for="fname">first name<span>*</span></label>
									<input  type="text" name="fname" value="" placeholder="Your name" wire:model="s_firstname">
								</p>
								@error('s_firstname')
								<span class="text-danger">{{$message}}</span>
								@enderror
							
								<p class="row-in-form">
									<label for="lname">last name<span>*</span></label>
									<input  type="text" name="lname" value="" placeholder="Your last name" wire:model="s_lastname">
								</p>
								@error('s_lastname')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="email">Email Addreess:</label>
									<input  type="email" name="email" value="" placeholder="Type your email" wire:model="s_email">
								</p>
								@error('s_email')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="phone">Phone number<span>*</span></label>
									<input  type="number" name="phone" value="" placeholder="10 digits format" wire:model="s_mobile">
								</p>
								@error('s_phone')
								<span class="text-danger">{{$message}}</span>
								@enderror
								
								<p class="row-in-form">
									<label for="add">Line1:</label>
									<input type="text" name="add" value="" placeholder="Street at apartment number" wire:model="s_line1">
								</p>
								@error('s_line1')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="add">Line2:</label>
									<input type="text" name="add" value="" placeholder="Street at apartment number" wire:model="s_line2">
								</p>
								@error('s_line2')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="country">Country<span>*</span></label>
									<input type="text" name="country" value="" placeholder="United States" wire:model="s_country">
								</p>
								@error('s_country')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="zip-code">Postcode / ZIP:</label>
									<input  type="number" name="zip-code" value="" placeholder="Your postal code" wire:model="s_zipcode">
								</p>
								@error('s_zipcode')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="city">Province<span>*</span></label>
									<input type="text" name="province" value="" placeholder="Province" wire:model="s_province">
								</p>
								@error('s_province')
								<span class="text-danger">{{$message}}</span>
								@enderror
								<p class="row-in-form">
									<label for="city">Town / City<span>*</span></label>
									<input type="text" name="city" value="" placeholder="City name" wire:model="s_city">
								</p>
								@error('s_city')
								<span class="text-danger">{{$message}}</span>
								@enderror
								
							</div>
						</div>
					</div>
					@endif
				</div>

			

				<div class="summary summary-checkout">
					<div class="summary-item payment-method">
						<h4 class="title-box">Payment Method</h4>
				
						<div class="choose-payment-methods">
							<label class="payment-method">
								<input name="payment-method" id="payment-method-bank" value="cod" type="radio" wire:model="paymentmode">
								<span>Cash On Delivery</span>
								<span class="payment-desc">Order Now & Pay On delivery</span>
							</label>
							
						
							@error('paymentmode')
								<span class="text-danger">{{$message}}</span>
								@enderror
						</div>
						@if(Session::has('checkout'))
						<p class="summary-info grand-total"><span>Grand Total</span> <span class="grand-total-price">{{Session::get('checkout')['total']}} MMK</span></p>
						@endif
						<button type="submit" class="btn btn-medium">
							Place Order Now
						</button>
					</div>
					<div class="summary-item shipping-method">
						<h4 class="title-box f-title">Shipping method</h4>
						<p class="summary-info"><span class="title">Flat Rate</span></p>
						<p class="summary-info"><span class="title">Fixed 0.00 MMK</span></p>
						
					</div>
				</div>
				</form>
				

			</div><!--end main content area-->
		</div><!--end container-->

	</main>