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

    public function addCartItem($cartId, $itemId, $itemQty)
    {
        $body = array("cartId" => $cartId, "itemId" => $itemId, "qty" => $itemQty);
        $cartItem = $this->client->request('POST', $this->apiPath, ['json' => $body]);
        return json_decode($cartItem->getBody());
    }
}