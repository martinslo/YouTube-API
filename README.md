# YouTube-API

# Objetivo:
Este é um exemplo de API criada com Ruby on Rails.
O objetivo dessa API é implementar os métodos básicos de uma API RestFul com GET, POST, PUT e DELETE.

Para saber mais sobre o Ruby <a href="https://www.ruby-lang.org/en/" target="_blank">clique aqui</a>.

Para saber mais sobre o Ruby on Rails (ou Rails) <a href="https://rubyonrails.org/" target="_blank">clique aqui</a>

# Dependências
Sobre o aplicativo, você vai precisar das seguintes versões do Ruby e Rails:
- Ruby: ruby 2.5.3p105

- Rails: Rails 5.2.2

# Como testar:
Para testar essa API você pode utilizar o aplicativo Postman, que é bem fácil visualmente.
Para baixar o Postman <a href="https://www.getpostman.com/apps" target="_blank">clique aqui</a>

Primeiro, inicie o projeto via terminal com $rails s;
Obs.: Caso tudo dê certo, você pode ir no navegador e digitar localhost:3000 e aparecerá uma tela do Rails.

# Método GET
Abra o Postman e o primeiro método de acesso vai ser GET, na URL coloca localhost:3000/api/v1/videos.json e clique em Send.
Você receberá esse retorno:
{
    "error": "You need to sign in or sign up before continuing."
}
Isso quer dizer que você precisa ter um usuário válido para acessar a API.

Para isso, clique em Headers e adicione nas chaves (Keys) as seguintes informações:
X-User-Email: test@example.com
X-User-Token: 4VoWzRCHhwz9kHSDFtse

Clique em Send novamente e você receberá esse retorno:
[]

Um retorno vazio, pois não existe dados no banco.

# Método POST
Para adicionar informações na API, mude o método para POST no Postman.
Clique em Body e é nessa área onde iremos colocar as informações que queremos.
Por exemplo, vamos adicionar um vídeo de desafios de lâminas, pegue o título e a URL no YouTube e vamos adicionar nas chaves (Keys)

video[titulo]: EPISÓDIO 4 - FACA COMANDO | DESAFIO SOB FOGO AMÉRICA LATINA | HISTORY
video[url]: https://www.youtube.com/watch?v=SHT7_ADbuuM

Clique em Send e deve retornar isso:
{
    "id": 1,
    "titulo": "EPISÓDIO 4 - FACA COMANDO | DESAFIO SOB FOGO AMÉRICA LATINA | HISTORY",
    "url": "https://www.youtube.com/watch?v=SHT7_ADbuuM",
    "user_id": 1,
    "created_at": "2018-12-11T13:58:58.249Z",
    "updated_at": "2018-12-11T13:58:58.249Z"
}

# Método PUT
O método PUT serve para atualizar alguma informação na API, vamos adicionar mais um vídeo e depois trocar:
Temos a seguinte informação na API
{
    "id": 2,
    "titulo": "Maravilhas modernas - Armas de pequeno porte",
    "url": "https://www.youtube.com/watch?v=EBdFH6aHbL8",
    "user_id": 1,
    "created_at": "2018-12-11T14:01:52.423Z",
    "updated_at": "2018-12-11T14:01:52.423Z"
}

Vamos trocar para outro vídeo, dessa forma altere o método para PUT e na URL troque para localhost:3000/api/v1/videos/2
Onde 2 é o id do vídeo.

No caso, vamos alterar o vídeo para um de culinária, na aba Body coloque nas chaves(Keys) os campos que deseja alterar e clique em Send.

video[titulo]: Bolos Decorados - Como Fazer Bolos Decorados E Simples #2
video[url]: https://www.youtube.com/watch?v=sa3muLkCuV0

Você terá esse retorno:
{
    "user_id": 1,
    "id": 2,
    "titulo": "Bolos Decorados - Como Fazer Bolos Decorados E Simples #2",
    "url": "https://www.youtube.com/watch?v=sa3muLkCuV0",
    "created_at": "2018-12-11T14:01:52.423Z",
    "updated_at": "2018-12-11T14:05:30.365Z"
}

# Método DELETE
Para o método DELETE, basta alterar o método para DELETE e informar o id do vídeo via URL ficando assim, por exemplo, localhost:3000/api/v1/videos/2

Você receberá um retorno vazio e com código 204.

Caso você queira, volte ao método GET e agora terá apenas um vídeo registrado.

Esse projeto foi baseado no artigo do site OneBitCode, <a href="https://onebitcode.com/api-completa-rails/" target="_blank">clique aqui</a> 


