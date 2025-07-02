// ignore: file_names
// Importa o pacote principal do Flutter com os widgets
import 'package:flutter/material.dart';

// Função principal que executa o app
void main() {
  runApp(LoginApp()); // Chama o widget principal
}

// Widget principal do app (Stateless porque ele não muda)
class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp é o widget base com estilo do Material Design
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      home: LoginScreen(), // Define a tela inicial
    );
  }
}

// Tela de login - usamos StatefulWidget porque vamos alterar o estado (inputs, validação)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

// Aqui começa o estado da tela de login
class _LoginScreenState extends State<LoginScreen> {
  // Chave para validar o formulário (verifica se os campos estão preenchidos)
  final _formKey = GlobalKey<FormState>();

  // Controladores para capturar o texto digitado
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  // Função chamada quando o usuário clica no botão de login
  void _login() {
    if (_formKey.currentState!.validate()) {
      // Se os campos estiverem válidos, executa esta parte
      print("E-mail: ${_emailController.text}");
      print("Senha: ${_senhaController.text}");

      // Mostra uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login realizado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold cria a estrutura básica da tela (appBar, body, etc)
    return Scaffold(
      appBar: AppBar(title: Text("Tela de Login")), // Barra superior com título

      // Padding adiciona espaçamento ao redor do conteúdo
      body: Padding(
        padding: const EdgeInsets.all(24.0),

        // Form agrupa os campos e permite validação
        child: Form(
          key: _formKey, // Conecta o formulário à chave de validação

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza os itens na vertical

            children: [

              // Título da tela
              Text("Bem-vindo!", style: TextStyle(fontSize: 28)),
              SizedBox(height: 32), // Espaço vertical

              // Campo de texto para o e-mail
              TextFormField(
                controller: _emailController, // Captura o texto digitado
                keyboardType: TextInputType.emailAddress, // Mostra teclado com "@" no celular
                decoration: InputDecoration(
                  labelText: "E-mail", // Rótulo do campo
                  border: OutlineInputBorder(), // Borda arredondada
                ),
                validator: (value) {
                  // Verifica se o campo está vazio
                  if (value == null || value.isEmpty) {
                    return 'Digite seu e-mail';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16), // Espaço entre os campos

              // Campo de texto para a senha
              TextFormField(
                controller: _senhaController,
                obscureText: true, // Oculta o texto (como senha)
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite sua senha';
                  }
                  return null;
                },
              ),

              SizedBox(height: 24), // Espaço antes do botão

              // Botão para enviar os dados
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ), // Quando clicado, chama a função _login
                child: Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
