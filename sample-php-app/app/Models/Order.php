<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
	use HasFactory;

	protected $fillable = [
		'user',
		'cart',
		'name',
		'address',
		'special_instructions',
		'cooktime',
	];

	protected $with = [
		'cart_detail',
	];

	public function cart_detail()
	{
		return $this->hasOne(Cart::class, 'cart', 'id');
	}

}
