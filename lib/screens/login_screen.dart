import 'package:ct_imperio/main.dart';
import 'package:ct_imperio/screens/loja_screen.dart';
import 'package:ct_imperio/services/json_loader.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Carregar os textos de maneira assíncrona
  Future<Map<String, dynamic>> _loadTexts() async {
    return await JsonLoader.load(); // Carrega os textos do JSON
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("CT Imperio"),
        backgroundColor: Colors.yellow,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _loadTexts(),  // Chama o método que carrega os textos
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Exibe o carregamento no corpo da tela
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar textos')); // Exibe erro se houver algum problema
          }

          // Se carregou com sucesso
          var texts = snapshot.data ?? {};

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                texts['loginScreen'] != null
                    ? Image.asset(
                  texts['loginScreen']['logoImage'],  // Caminho da imagem no JSON
                  fit: BoxFit.cover,
                )
                    : const SizedBox(height: 50),  // Placeholder se a imagem não for carregada
                const SizedBox(height: 16),
                Text(
                  texts['loginScreen'] != null
                      ? texts['loginScreen']['welcomeText']
                      : 'Bem-vindo ao CT Imperio',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: texts['loginScreen'] != null
                        ? texts['loginScreen']['hintUser']
                        : 'Usuário',
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: const Color(0xFF585C62),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: texts['loginScreen'] != null
                        ? texts['loginScreen']['hintPassword']
                        : 'Senha',
                    hintStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: const Color(0xFF585C62),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    minimumSize: Size(double.infinity, 60),  // Tamanho mínimo (largura: infinito e altura: 60)
                    padding: EdgeInsets.symmetric(vertical: 16),  // Ajuste do padding para aumentar a altura
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.black, fontSize: 18),  // Tamanho do texto
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
