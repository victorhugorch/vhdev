+++
title = "PHP Basics - Constants"
date = "2018-07-23"
tags = [
  "php", "basic", "constants"
]
draft = false
+++

## Constants

Uma constante é um identificador para um valor único. Como o nome sugere, esse valor não pode mudar durante a execução 
do script (exceto as **constantes mágicas**, que não são constantes de verdade). As constantes são **case-sensitive** 
por padrão. Por convenção, identificadores de constantes são **sempre** em maiúsculas.

```php
<?php

// VÁLIDO
define("ABRA", "063");
define("GOL1", "075");
define("MEGA_GYARADOS", "130");

// INVÁLIDO
define("9TALES", "038");

// VÁLIDO PORÉM É UMA MÁ PRÁTICA
define("__POKEMON__", "Gonna catch'all!");
?>
```

Como as superglobals, o escopo de uma constante é global. 
Você pode acessar constantes de qualquer lugar em seu script sem se preocupar com o escopo.

#### Constantes no Laravel

Segue mais um exemplo usando Pokemons.

```php
<?php


namespace App;

class Pokemon {
   const TOTAL = 151;

    ...
}

?>
```

Então, adicione um alias no arquivo `onfig/app.php`.

```php
aliases' => [
  //...
  'Pokemon' => App\Pokemon::class,
```

Assim, você pode acessar a constante onde você quiser (controllers ou blade files): `Pokemon::TOTAL`. Você também pode
criar um arquivo `constant.php` dentro da sua pasta `app` e mapeá-la usando o arquivo `composer.json`.

```
...
"autoload": {
   "classmap": [
       "database/seeds",
       "database/factories"
   ],
   "psr-4": {
       "App\\": "app/"
   },
   "files": [
       "app/helpers.php",
       "app/config/constants.php"
   ]
}
```

Essa forma **NÃO** é uma boa prática e não é recomendada, é apenas um exemplo. A **MELHOR MANEIRA** de se fazer isso é criando um arquivo 
dentro da pasta `config` com um array de valores e acessando ele através do Helper `Config` seguindo o exemplo abaixo.

```php
// CRIANDO UM ARRAY COM OS VALORES
// charmander.php
return [
    'moves' => [
        'growl'       => 0,
        'scratch'     => 40,
        'ember'       => 40,
        'smokescreen' => 0,
    ]
];
```

```php
// ACESSANDO OS VALORES CONSTANTES
Config::get('charmander.moves');
// or if you want a specific one
Config::get('charmander.moves.ember'); // 40
```

## "MAGIC" Constants

O PHP providencia uma série de constantes definidas pelo **Core** da linguagem. 
Você pode conferir a [lista](http://php.net/manual/pt_BR/language.constants.predefined.php) de magic constants na documentação.


