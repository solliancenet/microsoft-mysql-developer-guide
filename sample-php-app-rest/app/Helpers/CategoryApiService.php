<?php

namespace App\Helpers;

use GuzzleHttp\Client;

class CategoryApiService {
    private string $apiPath;
    private Client $client;

    public function __construct()
    {
        $this->apiPath = config('api.rest_api_base_path') . '/categories';
        $this->client = new Client();
    }

    public static function instance() {
        return new CategoryApiService();
    }

    public function getCategoriesAsc()
    {
        $categoryList = $this->client->request('GET', $this->apiPath);
        return json_decode($categoryList->getBody());
    }
}