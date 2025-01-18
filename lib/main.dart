import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const MyHomePage(),
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

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CT Imperio'),
        centerTitle: true,
      ),
      body: <Widget>[
        // Página Login
        Center(
          child: Text(
            'Página de Login',
            style: theme.textTheme.headlineMedium,
          ),
        ),
        // Página Loja
        const Center(
          child: Text('Página da Loja'),
        ),
        // Página Agenda
        const Center(
          child: Text('Página da Agenda'),
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            selectedIcon: Icon(Icons.account_circle),
            label: 'Login',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_mall_outlined),
            selectedIcon: Icon(Icons.local_mall),
            label: 'Loja',
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            selectedIcon: Icon(Icons.article),
            label: 'Agenda',
          ),
        ],
      ),
    );
  }
}
