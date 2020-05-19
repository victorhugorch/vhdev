+++
title = "PHP Basics - Operators"
date = "2018-07-12"
tags = [
  "php", "basic", "operators"
]
draft = false
+++

## Operadores

Sinais/Simbolos utilizados para performar operações em variáveis e valores.

### Operadores Aritméticos

```php
<?php

$sum = 1 + 1; // SOMA
echo $sum;    // 2

$sub = 5 - 4; // SUBTRAÇÃO
echo $sub;    // 1

$mul = 2 * 2; // MULTIPLICAÇÃO
echo $mul;    // 4

$div = 9 / 3; // DIVISÃO
echo $div;    // 3

$mod = 5 % 2; // MÓDULO [RESTO DA DIVISÃO]
echo $mod;    // 1

$exp = 2 ** 3; // EXPONENCIAL
echo $exp;     // 8

?>
```

#### Precedência de Operadores

Em uma operação mais complexa como `1 + 2 * 3` o resultado é **7** e não 9, pois o operador `*` (multiplicação) 
tem prioridade de precedência que o operador de adição. O PHP segue as prioridades matemáticas de precedência, 
sendo assim para obter 9 no cálculo anterior deveriável fazer a conta da seguinte maneira: `(1 + 2) * 3`.

O uso de parânteses, embora não estritamente necessário, melhora a leitura do seu código. Sempre **mantenha o seu código legível**.

### Operadores de Atribuição

No PHP para atribuirmos um valor a uma variável usamos o sinal de `=` (igual). Logo, `$craque = 'Neymar'` 
atribui a string Neymar a variável `$craque`.

Existe uma forma de abrevia os operadores aritméticos adicionado-os antes do operador de atribuição. Vamos utilizar a
variável `$sum` do exemplo anterior.

`$sum += 5 // 7`

Essa abreviação está disponível para **todos** os operadores aritméticos. 
Caso a variável usada não esteja declarada o seguinte erro será mostrado no seu console:
 
 `PHP Notice:  Undefined variable: sum in /path/file.php on line %`

Apesar do possibilidade de abreviação, ela não é considerada uma boa prática por tornar o 
código difícil de ser compreendido. **Mantenha o seu código legível**.

### Operadores de Incremento/Decremento

Vamos continuar utilizando a variável `$sum`. 

Operadoress | Nome           | Resultados
----------- | -------------- | ----------
++$sum      | Pré-incremento | echo $sum; // 11
$sum++      | Pós-incremento | echo $sum; // 10
--$sum      | Pré-decremento | echo $sum; // 9
$sum--      | Pós-decremento | echo $sum; // 10


1. Os operadores **Pré** fazem a operação **ANTES** do retorno.

2. Os operadores **Pós** fazem o retorno **ANTES** da operação.

3. O comportamento é igual ao do **javascript**.

```javascript
// Javascript
let sum = 10;

console.log(--sum); // 9
console.log(++sum); // 11
console.log(sum--); // 10
console.log(sum++); // 10
``` 

### Operadores Lógicos

Operadoress | Exemplos           | Resultados
----------- | ------------------ | ----------
and (&&)    | $morango and $maça | **TRUE** se ambos forem true
or  (\ \\)  | $morango or  $maça | **TRUE** se um dos dois for true
xor (^)     | $morango xor $maça | **TRUE** se $morango **OU** $maça forem true **MAS NÃO AMBOS**
!           | !$laranja          | **TRUE** se $laranja **NÃO FOR** true



### Operadores de String

Operadoress | Exemplos           | Resultados                               | Print
----------- | ------------------ | ---------------------------------------- | -------------
.           | $hello . $world    | Contatena as strings $hello e $world     | echo $hello . $world // "Hello World"
.=          | $hello .=  $world  | Anexa a string $world na variável $hello | echo $hello // "Hello World" 


### Operadores de Arrays

Usaremos as seguintes variáveis:

```php
$people = array("a" => "marcelo", "b" => "victor");  
$player = array("c" => "geraldo", "d" => "diego");  
```

Operadoress | Exemplos             | Resultados
----------- | -------------------- | ----------------------------------------
+           | $people +   $player  | União 
==          | $people ==  $player  | Igualdade 
===         | $people === $player  | Idêntico // Mesmo KEY PAIR ORDER 
!=          | $people !=  $player  | Diferente 
<>          | $people <>  $player  | Diferente 
!==         | $people !== $player  | Não é identico 


### Operadores de Comparação
Usaremos as seguintes variáveis:

```php
$player = "Neymar";  
$craque = "Mbappé";
```

Operadores  | Resultado             
----------- | -------------------- 
==          | **TRUE** se $player é igual $craque    
===         | **TRUE** se $player é igual $craque e do mesmo tipo   
!=          | **TRUE** se não é igual
<>          | **TRUE** se não é igual   
!==         | **TRUE** se não é igual e não é do mesmo tipo
>           | **TRUE** se maior
<           | **TRUE** se menor   
>=          | **TRUE** se maior ou igual  
<=          | **TRUE** se menor ou igual


### Operadores de Execução

O PHP suporta um operador de execução: acentos graves. 
**NÃO** são aspas simples! O PHP executará o código dentro das aspas simples como um código Shell. 
A utilização do operador acento grave é idêntica a função `shell_exec()`.

```php
<?php
$output = `ls -al`;

echo "<shell>$output</shell>"; // Lista o diretório onde está o arquivo
?>
```

### Operadores Bit a bit (Bitwise)

Os sinais `>>` / `<<` movem os bits de um valor para a direita e para a esquerda.

```php
<?php

$valor = 4;
echo $valor >> 2;   // 1
echo $valor << 1;   // 8
echo -$valor << 1;  // -8 [-$valor = -4]
echo $valor >> 5;   // 0
?>
```

Para entedermos os resultados acima precisamos de conhecimento sobre o **sistema binário**.


| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|-----|----|----|----|---|---|---|---|
|  0  | 0  | 0  | 0  | 0 | 0 | 0 | 0 |

Vamos representar o número 4 nessa tabela de bits.

| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|-----|----|----|----|---|---|---|---|
|  0  | 0  | 0  | 0  | 0 | 1 | 0 | 0 |

Agora vamos realizar a operação Bitwise `4 << 1`

| 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|-----|----|----|----|---|---|---|---|
|  0  | 0  | 0  | 0  | 1 | 0 | 0 | 0 |


#### Operador de Negação

O símbolo `~` (til) converte zeros em uns e uns em zeros.

```php
<?php

$valor = 4;
echo ~$valor;   // -5
?>
```

| +/- | 8 | 4 | 2 | 1 |
|-----|---|---|---|---|
| -   | 1 | 0 | 1 | 1 |

_______________

# Desafio do capítulo

> O que é **PAAMAYIM NEKUDOTAYIM**?