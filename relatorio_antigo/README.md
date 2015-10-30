Verificação e Validação
=======

Plano de V&V da aplicação Grandes Pontos


Dependências:
============

- texlive-latex-base
- texlive-latex-recommended
- texlive-latex-extra
- texlive-base
- texlive-publishers
- texlive-fonts-recommended
- texlive-generic-recommended
- texlive-lang-german
- abntex

### Módulo Perl (cpamn)

- IPC::System::Simple

> Utilize o `cpamn` para realizar a instalação deste modulo se for o caso.

Instalando Dependências:
============

Instale o [Chef](https://downloads.chef.io/chef-client/ubuntu/):

    $ curl -L https://www.opscode.com/chef/install.sh | sudo bash

Execute o Chef sobre o arquivo de dependências na raiz do documento:

    # chef-apply dependencies.rb