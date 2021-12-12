<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
	use HasFactory;

	public $timestamps = false;

	protected $fillable = [
		'category',
		'name',
		'img',
		'price',
		'cooktime',
		'desc',
	];

	protected $with = [
		'category',
	];

	public function category()
	{
		return $this->belongsTo(Category::class, 'category', 'id');
	}

}
