+++
title = "PHP Basics - Control Structures I"
date = "2018-07-12"
tags = [
  "php", "basic", "control", "structures"
]
draft = false
+++

## Estruturas de controle

O código em PHP é construído por uma série de instruções. Muitas
dessas instruções são baseadas em expressões que são avaliadas por seus valores booleanos. 

Se uma expressão for avaliada como **TRUE**, o PHP executará a declaração, e se avaliá-la como **FALSE** vai ignorá-la.

Sempre use `{}` (chaves) para criar agrupamentos de suas estruturas de controle. Apesar de não ser mandatório e não 
produzir nenhum erro no console, essa prática ajuda a **manter o seu código legível**.

##### Conversão para booleano

Antes de enterdemos como funcionam essas estruturas precisamos conhecer como funciona a conversão para valores 
booleanos no PHP.

```php
<?php

var_dump((bool) 1);         // bool(true)
var_dump((bool) -2);        // bool(true)
var_dump((bool) 2.3e5);     // bool(true)
var_dump((bool) "foo");     // bool(true)
var_dump((bool) "false");   // bool(true)
var_dump((bool) array(12)); // bool(true)
var_dump((bool) array());   // bool(false)
var_dump((bool) "");        // bool(false)
var_dump((bool) false);     // bool(false)
var_dump((bool) true);      // bool(true)
var_dump((bool) 0);         // bool(false)
var_dump((bool) 0.0);       // bool(false)

?>
```

### If

Permite a execução condicional de fragmentos de código. O PHP apresenta uma estrutura `if` semelhante a do C:

```
if (expr)
  statement
```

```php
<?php
// Número de títulos na Champions League
$cr7   = 5;
$messi = 4;

// RUIM
if ($cr7 > $messi)
  echo "CR7 é maior que Messi";

// BOM
if ($cr7 > $messi) {
    echo "CR7 é maior que Messi";
}
?>
```

#### Else

Muitas vezes deseja-se executar uma instrução se uma certa condição for válida, e uma instrução diferente se a mesma 
condição não for válida.

```php
<?php
// Número de Campeonatos Espanhóis
$cr7   = 2;
$messi = 9;

// BOM
if ($cr7 > $messi) {
    echo "CR7 é maior que Messi";
} else {
    echo "Messi é maior que CR7";
}

// MUITO BOM
echo $cr7 > $messi ? "CR7 é maior que Messi" : "Messi é maior que CR7";
?>
```

#### Else if

Como o nome sugere é uma combinação do `if` e do `else` como mostra o exemplo abaixo.

```php
<?php
// Número de Supercopa da Europa
$cr7   = 3;
$messi = 3;

// RUIM
echo $cr7 > $messi
    ? "CR7 maior que o Messi"
    : ($cr7 == $messi
        ? "CR7 é Messi são geniais"
        : "CR7 é maior que Messi");

// BOM
if ($cr7 > $messi) {
    echo "CR7 é maior que Messi";
} elseif ($cr7 == $messi) {
    echo "CR7 e Messi são geniais";
} else {
    echo "Messi é maior que CR7";
}
```

#### Operador Ternário

```php
// COMUM [COMMON ASSIGNMENT FORM]
<EXPRESSÃO> ? <VALOR SE TRUE> : <VALOR SE FALSE>;

// FORMA CURTA [SHORTHAND ASSIGNMENT FORM]
<EXPRESSÃO> ?: <VALOR SE FALSE>; // RETORNA E_NOTICE IF NO VALUE [NOT RECOMMENDED]

// EVITA NULO [NULL COALESCE OPERATOR]
<EXPRESSÃO> ?? <VALOR SE FALSE>; // NO E_NOTICE IF NO VALUE      [BEST PRACTICE]
```

Para entedermos o **Coalesce Operator** vamos compará-lo com a função `COALESCE(expr1, expr2, ..., expr_n)` do MySQL.

```
//MySQL
SELECT COALESCE(NULL, NULL, NULL, 'veus.com.br', NULL, 'homolog.veus.com'); // 'veus.com.br'

//PHP
echo null ?? "VEUS" ?? null ?? "PNCQ"; // "VEUS"
```

### Switch

A declaração switch é similar a uma série de declarações IF na mesma expressão. Em muitos casos, se deseja comparar as 
mesmas variáveis (ou expressões), com diferentes valores, e executar pedaços diferentes de código dependendo de qual 
valor ela é igual.

No PHP 7.0 múltiplos **cases default** lançarão um `erro E_COMPILE_ERROR`.

```php
<?php
$craque = "Gabriel Jesus";

switch ($craque) {
    case 7:
    case 10:
    case 11:
        echo "Faz gol em Copa do Mundo!";
        break;
    default:
       echo "Pior camisa 9 da história!";
}
?>
```

# Desafio do Capítulo

> Qual será a saída da instrução `var_dump((bool) "0"); // bool(?)` ?

