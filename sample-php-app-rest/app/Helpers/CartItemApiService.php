<?php

namespace App\Helpers;

use GuzzleHttp\Client;

class CartItemApiService {
    private string $apiPath;
    private Client $client;

    public function __construct()
    {
        $this->apiPath = config('api.rest_api_base_path') . '/cartitems';
        $this->client = new Client();
    }

    public static function instance() {
        return new CartItemApiService();
    }

    public function addCartItems($cartItems)
    {
        $this->client->request('POST', $this->apiPath, ['json' => $cartItems]);
    }
}