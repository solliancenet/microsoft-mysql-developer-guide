@extends('layouts.app')
@section('content')

	<div class="hero">
		<div class="logo">Contoso NoshNow</div>
	</div>

	<div class="center-block order-form">
		<div class="one-half column">
			<form>
				<label for="delivery_address">Welcome back, {{ $user->first_name }}! Where should we deliver your meal?</label>
				<input id="delivery_address" class="u-full-width" type="text" placeholder="Enter your street address" value="{{ $user->address }}">
				<a href="{{ route('category-list') }}" class="start-order button button-primary">Start Order</a>
			</form>
		</div>
	</div>

@endsection
@push('scripts')
<script>
</script>
@endpush
