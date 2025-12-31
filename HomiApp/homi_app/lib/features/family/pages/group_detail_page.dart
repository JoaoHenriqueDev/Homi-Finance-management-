import 'package:flutter/material.dart';

class GroupDetailPage extends StatelessWidget{
  const GroupDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Grupo')),
      body: Center(child: Text('Tela de detalhes sobre o grupo')),
    );
  }
}