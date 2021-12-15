@extends('layouts.app')
@section('content')

	<h3>Checkout</h3>

	<div class="center-block item-list">
		<div class="two-thirds column">
			@if ($cart_data)
			<table class="u-full-width m-b-0 checkout-cart">
				<tbody>
				@foreach($cart_data as $c)
					<tr>
						<td><div class="image" style="background-image:url(/img/{{ $c->img }});"></div></td>
						<td>
							<span>{{ $c->name }}</span>
							<span>{{ $c->qty }} @ {{ is_numeric($c->price) ? number_format($c->price, 2) : '0.00' }}</span>
						</td>
						<td>{{ number_format($c->sub, 2) }}</td>
					</tr>
				@endforeach
					<tr>
						<td colspan="2">Total:</td>
						<td>$ {{ number_format($cart_total, 2) }}</td>
					</tr>
				</tbody>
			</table>

			<!-- keeping it simple for demo purposes, only displaying a name and street address field -->
			<form class="checkout-form">
				<label class="text-left">Name</label>
				<input type="text" class="u-full-width" value="{{ $user ?? '' ? $user->name : '' }}">
				<label class="text-left">Address</label>
				<input type="text" class="u-full-width" value="{{ $user ?? '' ? $user->address : '' }}">
			</form>

			<a href="{{ route('category-list') }}" class="button">Add to Order</a>
			<a href="{{ route('receipt') }}" class="button button-primary complete-order">Complete Order</a>
			@else
			<p>You have no food in your cart.</p>
			<a href="{{ route('category-list') }}" class="button">Start a New Order</a>
			@endif
		</div>
	</div>

@endsection
@push('scripts')
<script>
</script>
@endpush
