<?php

namespace Core;

class Router
{
    protected array $routes = [];
    protected array $params = [];
    protected array $convertTypes = [
        'd' => 'int',
        'w' => 'string',
    ];

    public function add(string $route, array $params = [])
    {
        $route = preg_replace('/\//', '\\/', $route);
        $route = preg_replace('/\{([a-z]+)\}/', '(?P<\1>[a-z-]+)', $route);
        $route = preg_replace('/\{([a-z]+):([^\}]+)\}/', '(?P<\1>\2)', $route);

        $route = "/^{$route}$/i";
        $this->routes[$route] = $params;
    }
    public function dispatch(string $url)
    {
        $url = trim($url, '/');
        $url = $this->removeQueryVariables($url);
        d($this->params);

        if ($this->match($url)) {
            dd($this->params);
        }
    }
    protected function match(string $url)
    {
        foreach($this->routes as $route => $params) {
            if (preg_match($route, $url, $matches)) {
                $this->params = $this->setParams($route, $matches, $params);
                return true;
            }
        }

        return false;
    }
    protected function setParams(string $route, array $matches, array $params): array
    {
        preg_match_all('/\(\?P<[\w]+>\\\\(\w[\+])\)/', $route, $types);
        $matches = array_filter($matches, 'is_string', ARRAY_FILTER_USE_KEY);

        if (!empty($types)) {
            $step = 0;
            $lastKey = array_key_last($types);

            foreach ($matches as $key => $match) {
                $types[$lastKey] = str_replace('+', '', $types[$lastKey]);
                settype($match, $this->convertTypes[$types[$lastKey][$step]]);
                $params[$key] = $match;
                $step++;
            }
        }

        return $params;
    }
    protected function removeQueryVariables(string $url)
    {

        return preg_replace('/([\w\/]+)\?([\w\/=\d]+)/i', '$1', $url);
    }
}