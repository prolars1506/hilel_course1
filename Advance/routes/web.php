<?php

$router->add('parks/{id:\d+}/update', [
'controller' => 'Controller',
'action' => 'update',
'method' => 'POST'
]);