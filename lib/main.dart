import 'package:ct_imperio/screens/usuario_screen.dart';
import 'package:flutter/material.dart';
import 'screens/loja_screen.dart';
import 'screens/agenda_screen.dart';
import 'screens/login_screen.dart';
import 'components/navigation_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(), // Define a tela de login como a inicial
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  final List<Widget> pages = const [
    LojaScreen(),
    AgendaScreen(),
    UsuarioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CT Imperio'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      body: pages[currentPageIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: currentPageIndex,
        onItemSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}