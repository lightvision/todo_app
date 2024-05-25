<?php

// configram DIC (dependency injection container)


$container = $app->getContainer();

// setam template-ul pentru view /
$container['view'] = function ($container) {
    $view = new \Slim\Views\Twig('../templates');

    // Instantiate and add Slim specific extension
    $basePath = rtrim(str_ireplace('index.php', '', $container['request']->getUri()->getBasePath()), '/');
    $view->addExtension(new Slim\Views\TwigExtension($container['router'], $basePath));

    return $view;
};