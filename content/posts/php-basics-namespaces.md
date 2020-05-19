+++
title = "PHP Basics - Namespaces"
date = "2018-07-24"
tags = [
  "php", "basic", "namespace"
]
draft = false
+++

## Namespace

Namespaces possibilitam o agrupamento de **classes**, **interfaces**, **funções** e **constantes**, visando evitar o conflito entre 
seus nomes, atuando como um encapsulador para estes itens. Vejamos o exemplo.

```php
<?php

namespace Pokedex\Model;

class Pokemon {
    const TOTAL = 151;
    
    function getType($city) { ... }
}

?>
```

Dessa maneira, nossa classe `Pokemon` está sob o **namespace** `Pokedex\Model`, isso nos permite o seu uso da seguinte 
maneira.

```php
<?php

namespace Pokedex\Http\Controllers;

use Pokedex\Model\Pokemon;
use Pokedex\Model\Battle as PB;

class BattleController
{
    public function getAvailablePokemons()
    {
        $city = "Lavender Town";
        $types = Pokemon::getType($city);
        
        $weakness = PB::getDisadvantageOfType($types);
        
        echo Pokemon::TOTAL; // 151
        
        ...
    }
}

?>
```

Utilizando do construtor `use` podemos acessar facilmente tanto as funções como as constantes do nosso model `Pokemon`.

O construtor `use`  é útil quando vamos chamar a mesma função de novo e de novo no mesmo arquivo de código ou chamar 
diferentes funções, constantes ou classes de um namespace específico, tornando o nosso código muito mais legível.

> Nota: Namespaces **NÃO** são equivalentes a Classes. Um namespace é um ambiente de **isolamento** onde 
> uma classe, função, constante, trait e interface são definidas e, portanto, protegidas de erro de colisão 
> de nomes de funções, classes, etc. de ambientes diferentes.