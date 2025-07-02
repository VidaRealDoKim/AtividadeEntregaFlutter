// Importa o pacote do Flutter com widgets visuais do Material Design
import 'package:flutter/material.dart';

// Função principal que inicializa o aplicativo
Future<void> main() async {
  runApp(const MyApp()); // Inicia o app com o widget MyApp como raiz
}

// Widget principal do aplicativo (Stateless, pois não possui estado)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Método que constrói a interface do app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta a faixa "debug" no canto da tela
      title: 'Flutter Demo', // Título do app (não aparece visualmente por padrão)
      theme: ThemeData(
        // Define as cores do app com base em uma cor-semente
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 217, 255, 0), // Cor base azul escuro
        ),
      ),
      // Define a tela inicial do app como MyHomePage, passando um título
      home: const MyHomePage(title: 'Minha Home page'),
    );
  }
}

// Widget de tela com estado (pode mudar, pois é um contador)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // Título que será mostrado na AppBar

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Cria o estado da tela
}

// Classe que representa o estado do widget MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Variável que armazena o valor do contador

  // Função que é chamada ao clicar no botão "add"
  void _incrementCounter() {
    setState(() {
      _counter++; // Incrementa o contador em 1 e atualiza a interface
    });
  }

  // Método que constrói a interface visual da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Define a cor da barra superior com base no tema atual
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title), // Exibe o título passado pelo widget pai
      ),

      // Corpo principal da tela
      body: Center(
        // Centraliza a coluna vertical no centro da tela
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinha verticalmente ao centro
          children: <Widget>[
            // Texto fixo explicando a funcionalidade
            const Text('voce apertou o botão muitas vezes'),

            // Texto dinâmico que mostra o valor atual do contador
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium, // Usa estilo do tema
            ),
          ],
        ),
      ),

      // Botão flutuante (FloatingActionButton) que aparece no canto inferior direito
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Ao clicar, chama a função que incrementa
        tooltip: 'Increment', // Tooltip que aparece ao segurar o botão
        child: const Icon(Icons.add), // Ícone de "+", importado do Material Icons
      ),
    );
  }
}
