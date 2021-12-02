@extends('layouts.app')
@section('content')

	<div class="hero">
		<div class="logo">Contoso NoshNow</div>
	</div>

	<div class="center-block order-form">
		<div class="one-half column">
			<form>
				<input class="u-full-width" type="text" placeholder="Deliver to...">
				<a href="{{ route('category-list') }}" class="start-order button button-primary">Start Order</a>
			</form>
		</div>
	</div>












@endsection
@push('scripts')
<script>
$(document).ready( function() {
});
</script>
@endpush
