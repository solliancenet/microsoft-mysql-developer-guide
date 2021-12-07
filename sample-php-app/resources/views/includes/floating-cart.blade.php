			<div class="cart-icon {{ $cart_total ? '' : 'disabled' }}">
				<span class="count" id="cart_total">{{ $cart_total ? $cart_total : '0' }}</span>
				<span class="icon-cart"></span>
			</div>

			<div class="cart-block {{ $show && $cart_total ? '' : 'initially-hidden' }}">
				<div class="cart-items">
				@if (!$cart_total)
					<table class="u-full-width m-b-0"><tbody><tr><td>&nbsp; Uh oh! Your cart is empty.</td></tr></tbody></table>
				@else
					<table class="u-full-width m-b-0 full-cart">
						<tbody>
						@foreach($cart_data as $c)
							<tr>
								<td><span>{{ $c->name }}</span></td>
								<td><input type="text" value="{{ $c->qty }}" class="item-qty" data-item="{{ $c->id }}"></td>
								<td>@ {{ is_numeric($c->price) ? number_format($c->price, 2) : '0.00' }}</td>
								<td>{{ number_format($c->sub, 2) }}</td>
							</tr>
						@endforeach
						</tbody>
					</table>
				@endif
				</div>
				<div class="cart-footer">
					<table class="u-full-width m-b-0 b-b-0">
						<tbody>
							<tr>
							@if ($cart_total)
								<td>
									<a href="{{ route('checkout') }}" class="button button-tiny btn-success cart-checkout">Checkout</a>
									<button class="button-tiny cart-update">Update</button>
								</td>
							@endif
								<td class="text-right">
									<button class="button-tiny closer">&#9650;</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>