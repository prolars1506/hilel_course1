<?php 
require __DIR__ . '/vendor/autoload.php';
use App\Core\Router;

$router = new Router();
$router->setVar('test');
$router->run();
 ?>