+++
title = "PHP Basics - Variables"
date = "2018-07-12"
tags = [
  "php", "basic", "variables"
]
draft = false
+++

## Variáveis

PHP é uma linguagem de programação não tipada (fracamente tipada) e que nos permite armazenar 
qualquer tipo de valor, sendo ele escalar, composto ou especial, sem declarar seu tipo dentro 
da variável. Devemos nos atentar à nomenclatura das variáveis ao utilizá-las.

1. Toda e qualquer variável deve começar com `$` (cifrão).
2. Após o `$`, deve ser seguido por uma **letra** ou **underscore**.
3. Após o `$` **NÃO** é possível usar números.
4. Toda variável no PHP pode possuir **underscore**, **números** e **letras**.
5. PHP é **case-sensitive**, ou seja, `$var != $VAR != $Var`.

Assim como no C, uma variável no PHP pode ser atribuída de duas maneiras: **valor** (`=`) e **referência** (`&`). 
O simbolo `&` cria uma referência entre o valor da variável até o valor na memória.

```
<?php

$var1 = ''; // VÁLIDO
$5var = ''; // INVÁLIDO
$_ar  = ''; // VÁLIDO

// Atribuir por VALOR (=)
$valor = 5;
$value = $valor;
$value = 10;

echo $valor; // 5
echo $value; // 10

// Atribuir por REFERÊNCIA (&)

$jogador  = 'Neymar';
$craque   = &$jogador;

$craque = 'Ronaldinho';

echo $jogador; // Ronaldinho
echo $craque;  // Ronaldinho
?>
```