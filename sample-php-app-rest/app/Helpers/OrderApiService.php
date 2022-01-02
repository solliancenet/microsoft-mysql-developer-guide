<?php

namespace App\Helpers;

use GuzzleHttp\Client;

class OrderApiService {
    private string $apiPath;
    private Client $client;

    public function __construct()
    {
        $this->apiPath = config('api.rest_api_base_path') . '/orders';
        $this->client = new Client();
    }

    public static function instance() {
        return new OrderApiService();
    }

    public function createOrder($userId, $cartId, $name, $address, $specialInstructions, $cookTime) {
        $body = array(
            'userId' => $userId,
            'cartId' => $cartId,
            'name' => $name,
            'address' => $address,
            'specialInstructions' => $specialInstructions,
            'cooktime' => $cookTime
        );
        $order = $this->client->request('POST', $this->apiPath, ['json' => $body]);
        return json_decode($order->getBody());
    }

}