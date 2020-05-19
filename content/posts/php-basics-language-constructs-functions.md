+++
title = "PHP Basics - Language Constructs and Functions"
date = "2018-07-20"
tags = [
  "php", "basic", "control", "structures"
]
draft = false
+++

## Construtores da Linguagem e Funções

Assim como em muitas outras linguagens de programação, no PHP existem várias palavras com um significado especial. 
Como essas palavras formam a base do PHP e, portanto, constroem a linguagem, elas são frequentemente chamadas de 
construções de linguagem PHP ou palavras reservadas.

Você pode conferir a lista de [palavras reservadas](http://php.net/manual/en/reserved.keywords.php) na documentação.

Se você pesquisar construções de linguagem versus funções internas, você pode ter visto que as construções de linguagem 
são relativamente mais rápidas em relação às suas funções, já que são elementos básicos da linguagem.

No entanto, você não deve pensar na diferença em nada além de microssegundos. E também o tempo de execução final 
depende dos parâmetros que são passados ​​para um construtor da linguagem ou funções internas.

### Output Constructs

* `die()` e `exit()` são equivalentes. Usado para realizar **output** de um resultado e encerrar o script.
* `echo()` É usado para realizar **output** de um valor escalar. (String, Float, Boolean, int)
* `return` Usado para finalizar a execução de uma função ou de um script em escopo global.
* `print` usado para realizar o **output** de um valor escalar.

```php
<?php
echo ('Neymar permanece no PSG.');
echo 'Neymar permanece no PSG.';

// OUTPUT
// Neymar permanece no PSG.
// Note que o uso de () é opcional.

$futebol = 'Cristiano Ronaldo é apresentado no Juventus';
echo $futebol; 
print $futebol;

// OUTPUT
// Cristiano Ronaldo é apresentado no Juventus
// Note que o echo consegue printar variáveis

print false; // Nada acontece. Feijoada.

die('Chega de exemplos com futebol!'); // Chega de exemplos com futebol!
die;

echo 'Irei usar pokemons nos próximos exemplos.' // Não será executado devido ao die()
?>
```

### Evaluation Constructs

* `eval(param)`

A LC (Language Constructs) `eval()` executa a string dada no seu parâmetro como **código PHP**. Entre outras coisas, isto pode ser útil 
para guardar código em um campo de texto de um banco de dados para execução posterior.

> **ALERTA** A LC `eval()` é muito perigosa porque permite a execução de código PHP arbitrário. 
> **Seu uso, portanto, é desencorajado.** Se você verificou com cuidado que não há outra opção a não ser usar esse LC, 
> preste especial atenção para não passar nenhum dado fornecido pelo usuário sem validá-lo adequadamente antes.

```php
<?php
    eval( '?>  <?php echo \'Pikachu\';' );
?>

Não lança nenhum erro. Imprimi a string Pikachu.

<?php
    eval( '?> echo \'Evee\' <?php ' ); 
    // echo 'Evee'
    // Não é executado pois está do lado de fora das tags do PHP
?>
```

* `empty(param)`

A partir da versão 5.5 a LC `empty()` suporta receber expressões e variáveis e determina se ela está vazia.

Nenhum aviso é gerado se a variável não existir. 
Isso significa que a LC `empty()` é essencialmente equivalente a `!isset($var) || $var == false`.

```php
<?php

$pikachu  = "Pika Pika.";
$pokemons = [];
$digimons = "";
$mew = 0;
$mewtwo = 0.0;
$arceus;

var_dump(empty($pikachu));  // bool(false)
var_dump(empty($squirtle)); // bool(true). Note que nenhum erro é emitido.
var_dump(empty($pokemons)); // bool(true)
var_dump(empty($digimons)); // bool(true)
var_dump(empty($mew)); // bool(true).
var_dump(empty($mewtwo)); // bool(true).

var_dump(empty($arceus)); // bool(true).
// Note que é uma variável declarada mas sem valor.
?>
```

* `include` e `include_once`
* `require` e `require_once`

#### Entendendo a diferença entre Include/Require

1. `include` irá adicionar o arquivo especificado na execução do script, e caso não seja encontrado, irá retornar um 
erro do tipo “warning” com mensagem de “arquivo não encontrado”.
2. `include_once` possui a mesma função do “include” simples, mas não irá incluir o arquivo novamente, caso já tenha 
sido adicionado anteriormente na execução.
3. `require` basicamente irá realizar a mesma função que os **includes**, mas como o próprio nome descreve, o script 
requer o arquivo para continuar a execução. Sem esse “require”, o script será parado de executar e 
retornará um **FATAL ERROR** de nível **E_COMPILE_ERROR** e irá parar de executar o script.
4. `require_once` possui a mesma funcionalidade do “require”, mas com o “once” junto, só irá incluir o arquivo se não 
houver uma chamada anterior do mesmo.

### Other Constructs

* `isset()` e `unset()` respectivamente, verifica se a variável é definida e destrói a variável recebida como parametro.

```php
<?php

$gengar = "É um Pokemon do tipo fantasma.";

var_dump(isset($gengar));      // TRUE

unset ($gengar); // Destroí a variável

var_dump(isset($gengar));   // FALSE

?>
```

* `list()` cria uma lista de variáveis em apenas uma ação.

```php
<?php

$pokemons = array("Charmander", "Charmilion", "Charizard");

list($var[0], $var[1], $var[5]) = $pokemons;

var_dump($var);

/* OUTPUT
    array(3) {
      [0] =>
      string(10) "Charmander"
      [1] =>
      string(10) "Charmilion"
      [5] =>
      string(9) "Charizard"
    }

    Note a posição das 3 strings dentro do array.
*/
?>
```