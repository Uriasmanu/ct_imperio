import 'package:flutter/material.dart';

class UsuarioScreen extends StatelessWidget {
  const UsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Text(
        '',
        style: theme.textTheme.headlineMedium,
      ),
    );
  }
}
