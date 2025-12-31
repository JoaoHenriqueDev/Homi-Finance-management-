import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fotoURLController = TextEditingController();
  final _celularController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _fotoURLController, decoration: const InputDecoration(labelText: 'Foto URL')),
            TextField(controller: _celularController, decoration: const InputDecoration(labelText: 'Celular')),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
            const SizedBox(height: 20),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() => _loading = true);
                      try {
                        await authProvider.register(_nameController.text, _emailController.text, _passwordController.text, _fotoURLController.text, _celularController.text );
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cadastro realizado!')));
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                      } finally {
                        setState(() => _loading = false);
                      }
                    },
                    child: const Text('Registrar'),
                  ),
          ],
        ),
      ),
    );
  }
}
