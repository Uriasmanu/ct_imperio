import 'package:flutter/material.dart';
import '../components/card.dart';

class LojaScreen extends StatelessWidget {
  const LojaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      body: Center(
        child: CustomCard(
          title: 'Nome do equipamento (Semi novo)',
          subtitle: 'R\$ 100,00',
        ),
      ),
    );
  }
}