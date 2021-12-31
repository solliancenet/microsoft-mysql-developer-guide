<?php

namespace App\Helpers;

use GuzzleHttp\Client;

class UserApiService {
    private string $apiPath;
    private Client $client;

    public function __construct()
    {
        $this->apiPath = config('api.rest_api_base_path') . '/users';
        $this->client = new Client();
    }
    
    public static function instance()
    {
        return new UserApiService();
    }

    public function getRandomUser()
    {
        $res = $this->client->request('GET', $this->apiPath . '/randomUser');
        return json_decode($res->getBody());
    }
}
