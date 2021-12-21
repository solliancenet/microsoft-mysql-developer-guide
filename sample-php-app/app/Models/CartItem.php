<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
	use HasFactory;

	public $timestamps = false;

	protected $fillable = [
		'id',
		'cart',
		'item',
		'qty',
	];

	protected $with = [
		'item_detail',
	];

	public function cart_detail()
	{
		return $this->belongsTo(Cart::class, 'cart', 'id');
	}

	public function item_detail()
	{
		return $this->hasOne(Item::class, 'id', 'item')->orderBy('name');
	}

}
