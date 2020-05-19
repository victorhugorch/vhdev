+++
title = "Docker - Construindo o seu ambiente de desenvolvimento Laravel"
date = "2018-01-13"
tags = [
  "php", "docker", "laravel"
]
draft = false
+++

Olá, DevZ.

Vamos começar esse ano juntando dois temas que eu escrevo com frequência por aqui: [Docker](https://medium.com/trainingcenter/docker-o-que-%C3%A9-docker-e-como-come%C3%A7ar-58e04bdcb043) 
e Laravel. Eu comecei 2018 isolando todo o meu ambiente de desenvolvimento e vou mostrar para vocês como essa **boa prática** 
não é nenhum bicho de sete cabeças.

A essa altura do campeonato vocês já sabem como começar um projeto Laravel, se você é novo por aqui e no **desenvolvimento PHP** 
eu vou lembrar para você.

`composer create-project --prefer-dist laravel/laravel <app-name>`

Você pode encontrar outras maneiras de fazer a instalação e iniciar o seu projeto na [documentação](https://laravel.com/docs/5.5/installation). 
Depois disso você teria que ter a versão do PHP superior a 7.0 para rodar a versão 5.5 do Laravel, 
além de ter o MySQL instalado para rodarmos as migrations do projeto.

Ao invés disso nós vamos criar um arquivo **docker-compose.yml**, arquivo de configuração do Docker, responsável por levantar
 os seus containers. Se você não está familiarizado com esse vocabulário recomendo que você dê alguns passos para trás na 
 documentação do [Docker](https://docs.docker.com/install/) e ler mais sobre a instação do docker e do docker-compose, 
 aqui irei pular esses baby-steps e explicar o nosso arquivo de configuração.

```
# v2 syntax
version: '2'

# Named volumes
volumes:
  # MySQL Data
  <app-name>-mysql-data:
    driver: local

services:
  # MySQL (5.7)
  mysql:
    image: ambientum/mysql:5.7
    container_name: <app-name>-mysql
    volumes:
      - <app-name>-mysql-data:/var/lib/mysql
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=<app-name>
      - MYSQL_DATABASE=<app-name>
      - MYSQL_USER=<app-name>
      - MYSQL_PASSWORD=<app-name>

  # PHP (with Caddy)
  app:
    image: ambientum/php:7.1-caddy
    container_name: <app-name>-app
    volumes:
      - .:/var/www/app
    ports:
      - "80:8080"
    links:
      - mysql
```

Estou utilizando as [imagens](https://medium.com/@victorhugorocha/docker-o-que-s%C3%A3o-imagens-e-os-containers-df7a42a16358) do Ambientum, 
excelente projeto Open-Source do Diego Hernandes e da galera do Codecasts. 
No repositório há uma variedade de imagens pré-configuradas com diferentes bancos de dados e ambientes de produção e desenvolvimento.

[codecasts/ambientum](https://github.com/codecasts/ambientum)

No nosso caso estamos criando dois serviços (containers): **app** e **mysql**. Para o seu projeto você deve substituir todas as 
ocorrências de **<app-name>** pelo nome do seu projeto. Com isso ao rodarmos o comando `docker-compose up -d` veremos o 
containers serem criados e podemos confirmar se eles estão levantados com o comando `docker ps -a`.

Além disso nós temos que rodar todos os comandos de configuração de um projeto Laravel e agora nós precisamos executar 
todos esses comandos dentro do nosso container Docker que é onde o nosso projeto estará rodando. Como esses comandos 
se repetem ao início de todo o projeto podemos deixar toda essa configuração ainda mais simples.

Ao criarmos um script **run.sh** conseguimos agrupar todos esses comandos em um único arquivo de configuração dentro do 
nosso projeto. Esse Shell Script pode ser rodado em todos os ambientes: Linux, Mac e Windows. No Windows você vai 
precisar do git bash e no Mac você precisa usar o prefixo bash antes de executar o script.

```bash
#!/bin/bash

echo Uploading Application container 
docker-compose up -d

echo Copying the configuration example file
docker exec -it <app-name>-app cp .env.example .env

echo Install dependencies
docker exec -it <app-name>-app composer install

echo Generate key
docker exec -it <app-name>-app php artisan key:generate

echo Make migrations
docker exec -it <app-name>-app php artisan migrate

echo Make seeds
docker exec -it <app-name>-app php artisan db:seed

echo Information of new containers
docker ps -a 
```

Assim como no arquivo anterior você precisa trocar todas as ocorrências do `<app-name>` pelo nome do seu projeto. 
Isso diz em qual dos seus containers o comando está sendo executado. O prefixo **-it** após o comando faz com que ele seja 
interativo e você receba os outputs similar ao rodar eles localmente na sua máquina.

Dessa maneira, agora você consegue ter todo o seu projeto pronto para rodar sem ao menos ter o MySQL instalado na sua 
máquina, dessa forma também fica muito fácil trabalhar com diferentes versões de linguagem em muitos projetos.

**Dica extra**: Lembre-se sempre de verificar que você está rodando o Docker caso você esteja no Windows ou Mac, 
um ícone do Docker deve ficar visível na sua barra de tarefas do Desktop. Além disso, caso você já tenha o MySQL instalado 
e queria containerizar seu ambiente, é preciso que você pare o serviço antes de executar o comando, pois a porta 3306 
já estará sendo usada pelo seu serviço local.
