<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
session_start();

// instantiem aplicatia
$settings = require __DIR__ . '/../app/settings.php';
$app = new \Slim\App($settings);

// setam depedintele
require __DIR__ . '/../app/dependencies.php';

// inregistram middleware
require __DIR__ . '/../app/middleware.php';

// inregistram rutele
require __DIR__ . '/../app/routes.php';

// sa fie lumina: rulam aplicatia
$app->run();