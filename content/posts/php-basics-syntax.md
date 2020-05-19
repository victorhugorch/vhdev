+++
title = "PHP Basics - Syntax"
date = "2018-07-11"
tags = [
  "php", "basic", "syntax"
]
draft = false
+++

## Sintaxe

Existem três formas conhecidas de se iniciar a escrita de código **PHP**, são elas:

* `<?= ?>` **ABREVIAÇÃO** de `<?php echo 'zeus' ?>`
* `<?php ... ?>` **RECOMENDADO**
* `<script language="php"> ... </script>` **REMOVIDO NO PHP 7.0**

Finalize as suas linhas de código usando `;` (ponto e vírgula).

### O problema das Tags PHP

Seguindo o exemplo:

A. user.php
```php
<?php

echo 'Olá, Zeus. Você deseja enviar um e-mail?';

?> // Espaço em branco

```
B. email.php
```php
<?php

require 'user.php';

header('Location: user.php');
exit();
?>

```

Ao executar o código acima você verá o seguinte erro `PHP Warning:  Cannot modify header information - headers already sent`. Esse erro não acontece apenas com o espaço mas com qualquer saída (HTML, printf, ...) que seja executada antes dos headers HTTP.

Por isso é uma **BOA PRÁTICA** evitar o uso da tag de fechamento para previnir conflitos com funções do PHP que utilizam **HTTP headers** como header, session_start e setcookie.

## Comentários

A maneira de se escrever comentários em PHP é igual ao do **Javascript**.

A. Comentário de uma linha
```php
// Esse é um comentário
// De uma linha. Onde as barras
// Precisam ser repetidas a cada linha.
```

B. Comentário de multiplas linhas
```
/*

    Esse é um comentário de multiplas linhas
    Onde a barra e o * só precisam ser inseridos
    no começo e no final do seu comentário.
    Sem mistérios aqui.

*/
```