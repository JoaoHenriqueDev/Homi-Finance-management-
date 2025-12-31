import 'package:flutter/material.dart';

class CreateGroupPage extends StatelessWidget{
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Grupo')),
      body: Center(child: Text('Tela de criação de grupo')),
    );
  }
}