# Quiz História da Computação
Exemplo de um app flutter que **abre dados Mockup** JSON e cria um quiz, uma lista de perguntas sobre computação.<br>Exemplo de arquivos, estilização com paleta de cores e tema e radio buttons (Botões de opção).

## Tecnologias
- Flutter
- VsCode
- Android Studio

|Efeitos|WidGets|
|-|:-:|
|Tema|ThemeData.light().copyWith()|
|Imagens|Image.asset()|
|Assincronicidade|async|
|Carregar arquivos texto locais|rootBundle.loadString('assets/..');|
|Conversão de dados|json.encode(), json.decode()|
|Menu dropDown "Select"|DropdownButton<dynamic>()|
|Botões de controle de conteúdos em tela|ElevatedButton()|
|Botões de opção|RadioGroup()|

|![Splash](./assets/info/screenshot01.png)|![Home](./assets/info/screenshot02.png)|![Home](./assets/info/screenshot03.png)|
|:-:|:-:|:-:|
|Splash|Home  Questão| Respondida|

|![Splash](./assets/info/screenshot04.png)|![Home](./assets/info/screenshot05.png)|
|:-:|:-:|
|Desabilitada|Resultado final|

# Para testar
- 1 Clone o repositório
- 2 Abra com VsCode, Abra o trminal **CTRL + "**, execute o comando `flutter pub get` para instalar as dependências
- 3 Navegue até o arquivo lib/main.dart e dê **play** ou execute o comando `flutter run` para rodar o projeto
- 4 Escolha navegador ou um emulador para testar, ou abra o arquivo */lib/main.dart* e clique em Play.
- O projeto irá abrir a tela de Splash com uma animação, clique em entrar e navegue pelos produtos.

