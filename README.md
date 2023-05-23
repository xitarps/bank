# RaroBank

# Tecnologias
 - Ruby 3.2.1
 - Rails 7
 - Postgres
 - RSpec

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
### Opcional
Caso necessite de dados iniciais:
```
rails db:seed
```
Caso precise debugar(binding.break) ligue o servidor com:
```
rails server
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