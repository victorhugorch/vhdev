+++
title = "PHP Basics - Control Structures II"
date = "2018-07-13"
tags = [
  "php", "basic", "control", "structures"
]
draft = false
+++

## Estruturas de controle

O código em PHP é construído por uma série de instruções. Muitas
dessas instruções são baseadas em loops, que executam o mesmo bloco de instrução um número específico de vezes.

### While / Do-While

Laços **while** são os mais simples tipos de laços do PHP. Possui comportamento semelhante ao C. O propósito da declaração 
while é simples. Ele dirá ao PHP para executar as declarações aninhadas repetidamente, 
enquanto a expressão do while forem avaliadas como **TRUE**.

Os laços **do-while** é muito similar aos laços while, com exceção que a expressão de avaliação é verificada ao 
final de cada iteração em vez de no começo.

```php
<?php

// DO WHILE
do {
    $num_de_copas = 0;
    echo "França campeã 98!\n";
    $num_de_copas++; 

} while ($num_de_copas > 1 || finishWorldCup() );

function finishWorldCup() {
    echo "França Campeã 18!";
    return false;
}

// OUTPUT:
// França campeã 98!
// França campeã 18¹

// WHILE
$count = 1;

while ($count <= 8) {
    if ($count == 1) {
        echo "Não dá pra esconder, o que eu sinto por você Russia!\n";
    } else if ($count == 2) {
        echo "Não dá, não dá, não dá, não dá...\n";
    } else if ($count == 3) {
        echo "Só sei que a Alemanha estremece\n";
    } else if ($count == 4) {
         echo "A Argentina só tem o Messi\n";
    } else if ($count == 5) {
        echo "Inevitavelmente a Itália dança\n";
    } else if ($count == 6) {
        echo "O Zidane não nasceu na França\n";
    } else if ($count == 7) {
        echo "O Iniesta não joga mais\n";
    } else {
        echo "Só sei que ser brasileiro é bom demais\n
              Ê ô, ê ô, sou brasileiro... sou brasileiro...";
    }
    $count++;
}

// OUTPUT:
// Não dá pra esconder, o que eu sinto por você Russia!
// Não dá, não dá, não dá, não dá...
// Só sei que a Alemanha estremece
// A Argentina só tem o Messi
// Inevitavelmente a Itália dança
// O Zidane não nasceu na França
// O Iniesta não joga mais
// Só sei que ser brasileiro é bom demais
//               Ê ô, ê ô, sou brasileiro... sou brasileiro...
?>
```

### For

Os laços for são os mais complexo no PHP. Possui comportamento semelhante ao C. 

```
for (expr1; expr2; expr3)
    statement
```

Cada uma das expressões podem ser vazias ou conter múltiplas expressões separadas por vírgulas. 
Na expr2, todas as expressões separadas por vírgula são avaliadas mas o resultado é obtido da última parte. 
Se a expr2 estiver vazia significa que o laço deve ser executado indefinidamente 
(O PHP considera implicitamente como **TRUE**, igual ao C). 

Isto não é inútil como se imagina, pois muitas vezes deseja-se interromper o laço utilizando a instrução break ao 
invés de usar a expressão verdade do `for`.

```php
<?php
$i = 1;

for (; ;) {
    if ($i > 10) {
        break;
    }
    
    echo $i;
    $i++;
}

// OUTPUT
// 123456789
?>
```

### Foreach

O construtor foreach fornece uma maneira fácil de iterar sobre arrays. O foreach funciona somente em arrays e objetos, 
e emitirá um erro ao tentar usá-lo em uma variável com um tipo de dado diferente ou em uma variável não inicializada. 

```
foreach (array_expression as $value)
    statement
foreach (array_expression as $key => $value)
    statement
```

```php
<?php

$titles = array(1958, 1962, 1970, 1994, 2002); 

foreach ($titles as $value) {
  echo "O Brasil foi campeão mundial em $value!\n";
}

?> 
```

#### Break / Continue

* **break** finaliza a execução da estrutura for, foreach, while, do-while ou switch atual.
* **continue** é utilizado em estruturas de laço para pular o resto da iteração atual.