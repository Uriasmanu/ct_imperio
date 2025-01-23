import 'package:flutter/material.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Text(
        'Tela de Usuário',
        style: theme.textTheme.headlineMedium,
      ),
    );
  }
}
