## Configurar ambiente para rodar a automação de API

Instalação e configuração, utilizando httparty com Cucumber em Ruby.

## Abrir o terminal e executar os seguintes passos:

* Instalar Homebrew

		$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

* Instalar RVM

		$ curl -sSL https://get.rvm.io | bash

* Instalar Ruby

		$ rvm install ruby-2.7.0

* Dar permissão nas Gems

		$ sudo chown -R `whoami` /Library/Ruby/Gems

* Clonar o projeto do git 

		$ git clone <url-do_repositorio-do-git>

* Instalar bundle

		$ gem install bundler

* Instalar as dependencias e gems

		$ bundler install

* Para executar o projeto no Mac execute o comnado

		$ cucumber -f html -o report.html

* Para executar os testes com a tag @regression via rake utilize o seguinte comando

		$ rake regression 

* Para ver o relátorio dos teste execute o comando no terminal na raiz do projeto

		$ open report.html
