<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartItemsTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('cart_items', function (Blueprint $table) {
			$table->id();
			$table->integer('cart');
			$table->integer('item');
			$table->unsignedSmallInteger('qty');
			$table->engine = 'InnoDB';
			$table->charset = 'utf8';
			$table->collation = 'utf8_general_ci';
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('cart_items');
	}
}
