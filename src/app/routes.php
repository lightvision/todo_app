<?php

// rutele aplicatiei
$app->get('/', function($request, $response,$args){
    return $this->view->render($response, 'index.html.twig', [
        'name' => $args['name']
    ]);
});