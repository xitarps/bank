# RaroBank

# Tecnologias
 - Ruby 3.2.1
 - Rails 7
 - Postgres
 - RSpec
 - Simplecov
 - Rubocop

# Rodando o projeto o projeto
Clone esse repositorio
```
git clone https://git.raroacademy.com.br/rodrigo.xita/rarobank.git
```
Entre na pasta do projeto
```
cd rarobank
```
Execute o setup
```
./bin/setup
```
Ligue o servidor
```
./bin/dev
```
Suba o Sidekiq(necessário redis 6.2 + instalado)
```
sidekiq -C ./config/sidekiq.yml
```
### Opcional
Caso necessite de dados iniciais:
```
rails db:seed
```
Caso precise debugar(binding.break) ligue o servidor com:
```
rails server
```

# Variáveis de ambiente
sidekiq:
```
export SIDEKIQ_PASSWORD=123
export SIDEKIQ_USER=exemplo
```
Mailer:
```
export GMAIL_USER=exemplo@gmail.com
export GMAIL_PASSWORD=exemplo
```

# Padrões

Commits, branches e issues seguem padronizadas em inglês
## Branches/Issues
As issues e branches seguem com mesmo nome e numero para mais facil localização.

Padrão de branch/issue:
```
XYZ_Tipo_Intuito_da_branch
```

exemplos:
```
001_Config_Add_tests_lib
023_Feature_Add_Admin_dashboard
037_Fix_Adjust_HomeController_index
077_Style_Apply_tailwind_on_login_page
```

## Commits
Os commits seguem o numero e o tipo da branch seguidos pelo que de fato fazem.

Padrão de commit:
```
XYZ [Tipo]: Do something
```

exemplos:
```
001 [Config]: Add RSpec
037 [Feat]: Add admin dashboard index view
023 [Fix]: Change each to map on fetch_customers
077 [Style]: Add navbar style
```

# Observações
Para rodar os testes de feature com o browser, favor trocar o nome da pasta features para system(localizada dentro de spec)

Também se atentar de ter chromium-chromedriver:
```
sudo apt-get install chromium-chromedriver
```

# Diagramas

[Diagrama entidade relacionamento](https://drive.google.com/file/d/1mBrZUS-Fpxfe53FY9hK_IWCqvCYY_ixU/view)

- Diagrama Entidade-Relacionamento desenvolvido em equipe, especificando os relacionamentos que nossa aplicação RaroBank vai possuir. Identificamos todas as entidades relevantes no domínio e seus atributos, estabelecemos, por meio de discussões, as relações indicando a cardinalidade e, por fim, evitamos redundâncias e inconsistências nos dados.

![Diagrama ER](./Doc/ArgonautasDER.drawio(1).png)



[Diagrama lógico relacional](https://drive.google.com/file/d/1AiG_Sd3lFNVN6bXxYXYUzs1Umd5aWIOt/view?usp=sharing)

- Diagrama Lógico-Relacional: Após o desenvolvimento do diagrama entidade-relacionamento, utilizamos as tabelas para representar as entidades no banco, as colunas para representar os campos e atributos na tabela, os relacionamentos são as conexões entre as tabelas e, por fim, as chaves primárias como identificadores únicos e as chaves estrangeiras para referenciar as chaves primárias em outras tabelas. Seguindo esses princípios, nosso objetivo é representar a clareza nas estruturas de banco de dados, facilitando a compreensão dos relacionamentos entre tabelas e auxiliando no planejamento e desenvolvimento do nosso banco de dados.

![Diagrama LR](./Doc/Argonautas.drawio(1).png)