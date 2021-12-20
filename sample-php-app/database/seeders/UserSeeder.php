<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

use App\Models\User;

class UserSeeder extends Seeder
{
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
	public function run()
	{
		DB::table('users')->truncate();
		$users = [
			[
				'name' => 'Peter Gibbons',
				'address' => '97 Walt Whitman Street',
				'email' => 'pgibbons@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Michael Bolton',
				'address' => '7756 Princeton Street',
				'email' => 'mbolton@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Samir Nagheenanajar',
				'address' => '7583 Honey Creek St.',
				'email' => 'snagheenanajar@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Bob Slydell',
				'address' => '820 Beach Street',
				'email' => 'bslydell@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Bill Lumbergh',
				'address' => '9318 South Pulaski Ave.',
				'email' => 'blumbergh@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Barbara Reiss',
				'address' => '849 East Depot St.',
				'email' => 'breiss@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Nina McInroe',
				'address' => '839 Illinois St.',
				'email' => 'nmcinroe@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Drew Pitts',
				'address' => '234 Depot Ave.',
				'email' => 'dpitts@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Jennifer Emerson',
				'address' => '71 Pierce St.',
				'email' => 'jemerson@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Milton Waddams',
				'address' => '497 Thomas Avenue',
				'email' => 'mwaddams@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Tom Smykowski',
				'address' => '25 Manchester Street',
				'email' => 'tsmykowski@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
			[
				'name' => 'Dom Portwood',
				'address' => '905 Deerfield Lane',
				'email' => 'dportwood@contoso-noshnow.com',
				'password' => Hash::make('password'),
			],
		];
		User::insert($users);
	}
}
