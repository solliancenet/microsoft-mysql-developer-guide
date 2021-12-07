@extends('layouts.app')
@section('content')

	<h3>Select a meal</h3>

	<div class="center-block item-list">
		<div class="two-thirds column">
			<div class="row">
			@foreach($item as $i)
				<div class="item one-third column">
					<div class="image" style="background-image:url(/img/{{ $i->img }});"></div>
					<div class="name">{{ $i->name }}</div>
					<div class="price">$ {{ is_numeric($i->price) ? number_format($i->price, 2) : '0.00' }}</div>
					<div class="desc">{{ $i->desc }}</div>
					<button class="add-to-cart button-small button-primary" data-item="{{ $i->id }}">Add</button>
				</div>
			@endforeach
			</div>
		</div>
		<a href="{{ route('category-list') }}" class="button">Back</a>
		<a href="{{ route('checkout') }}" class="button {{ session('cart') && count(session('cart')) ? 'button-primary' : '' }} checkout-button" {{ session('cart') && count(session('cart')) ? '' : 'disabled' }}>Continue</a>
	</div>

@endsection
@push('scripts')
<script>
</script>
@endpush
