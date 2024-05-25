<?php
return [
    'settings' => [
        'displayErrorDetails' => true, // fals in productie
        'addContentLengthHeader' => false, // permite webserverului sa trimita headerul content-lenght

        // Renderer settings
        'renderer' => [
            'template_path' => __DIR__ . '/../templates/',
        ],
    ],
];