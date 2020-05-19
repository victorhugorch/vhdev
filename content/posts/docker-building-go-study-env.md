+++ 
draft = true
date = 2018-03-31T20:10:18-03:00
title = "Docker - Construindo o seu ambiente de estudos Go com docker"
slug = "Building-your-go-study-environment-with-docker" 
thumbnail = "images/tn.png"
tags = [
  "docker", "go"
]
description = ""
+++

---

Olá, DevZ.

Esse não é um post que te apresenta porque você deveria estar dando uma olhada em [Go](https://golang.org/), aqui eu assumo que você, 
assim como eu, já tomou essa decisão. Se você ainda precisa de um motivo, eu recomendo o [artigo](https://hackernoon.com/5-reasons-why-we-switched-from-python-to-go-4414d5f42690) 5 motivos pelos quais
 nós trocamos o Python pelo Go. (em inglês)


Agora que você decidiu estudar a primeira coisa a fazer seria instalar o Go e suas dependências, configurar as variáveis 
de ambiente necessárias e quaisquer outras ações que podem variar dependendo do seu sistema operacional, correto? 
Eu optei por não passar por isso e assumi outro pequeno desafio, rodar os meus scripts de estudo dentro do **docker** (❤).



### to refactor.


Dado o desafio, antes de começar a estudar e aprender o meu primeiro Hello World eu pesquisei como se rodava os scripts do Go, vi que no começo as pessoas executavam um arquivo chamado main.go, assim montei o meu docker-compose, utilizando uma imagem oficial do Go para executar esse arquivo.
victorhugorch/go-enviromment
go-enviromment - Simple and fast development environment for Go Lang using Docker and Docker-compose.github.com
Você pode encontrar o ambiente criado nesse repositório do Github. No README você tem um passo-a-passo de como começar a usar, se o seu interesse é só começar a estudar Go você pode ir direto pra lá. Se você quer entender um pouquinho do docker-compose, segue comigo.



Esse arquivo de configuração do Docker mostra que temos apenas um serviço chamado app, que roda em cima da imagem informada. Essa imagem foi tirada do Hub oficial, essa é a atual última versão do Go (1.10) enquanto escrevo esse post. Assim como também a versão 3.7 é a versão mais recente do Alphine Linux, escolhi essa opção de imagem por ser bem leve. Outras imagens também funcionariam para o meu objetivo de aprender.
O volume entre o PATH -"./src:/go/src/" aponta o local onde estão os meus scripts para dentro do container. Assim, eu consigo executar os meus arquivos dentro do Docker. working_dircomo você conseguem imaginar, informa o working directory do container que vai ser criado ao rodarmos o comando. O interessante nesse comando é a parte ${PROJECT_NAME}que lê o arquivo .enve procura esssa variável lá. Assim dentro de src eu separo por pastas os tópicos que estou estudando e quando quero executar um script, coloco o nome da pasta dentro do meu arquivo .env (Arquivo com variáveis de ambiente).
Depois de clonar o projeto você pode testar e executar os exemplos na pasta src para ver na prática o funcionamento do projeto mas ao rodar o serviço do Docker com docker-compose upessa é a sua resposta.