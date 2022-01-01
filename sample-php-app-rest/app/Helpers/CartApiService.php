<?php

namespace App\Helpers;

use GuzzleHttp\Client;

class CartApiService {
    private string $apiPath;
    private Client $client;

    public function __construct()
    {
        $this->apiPath = config('api.rest_api_base_path') . '/carts';
        $this->client = new Client();
    }

    public static function instance() {
        return new CartApiService();
    }

    public function openCart($userId) {
        $body = array("userId" => $userId);
        $cart = $this->client->request('POST', $this->apiPath, [ 'json' => $body ]);
        return json_decode($cart->getBody());
    }

    public function closeCart($cartId) {
        $cart = $this->client->request('PUT', $this->apiPath . '/' . strval($cartId));
        return json_decode($cart->getBody());
    }

}