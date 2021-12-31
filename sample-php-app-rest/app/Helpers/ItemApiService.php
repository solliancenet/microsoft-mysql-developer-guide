<?php

namespace App\Helpers;

use GuzzleHttp\Client;

class ItemApiService {
    private string $apiPath;
    private Client $client;

    public function __construct()
    {
        $this->apiPath = config('api.rest_api_base_path') . '/items';
        $this->client = new Client();
    }

    public static function instance() {
        return new ItemApiService();
    }

    public function getItemsAsc($url)
    {
        $categoryList = $this->client->request('GET', $this->apiPath . '/categories/' . $url);
        return json_decode($categoryList->getBody());
    }
}