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
					<div class="price">$ {{ $i->price }}</div>
					<div class="desc">{{ $i->desc }}</div>
					<button class="button-primary">Add</button>
				</div>
			@endforeach
			</div>
		</div>
		<a href="{{ route('category-list') }}" class="select-category button">Back</a>
		<button class="select-category button" disabled>Continue</button>
	</div>

@endsection
@push('scripts')
<script>
$(document).ready( function() {
});
</script>
@endpush
