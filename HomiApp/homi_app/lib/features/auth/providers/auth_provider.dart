import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  String? _token;
  String? get token => _token;

  bool get isLoggedIn => _token != null;

  Future<void> login(String email, String password) async {
    _token = await _authService.login(email, password);
    await _storage.write(key: 'token', value: _token);
    notifyListeners();
  }

  Future<void> register(String name, String email, String password, String fotoURL, String celular) async {
    await _authService.register(name, email, password, fotoURL, celular);
  }

  Future<void> logout() async {
    _token = null;
    await _storage.delete(key: 'token');
    notifyListeners();
  }

  Future<void> loadToken() async {
    _token = await _storage.read(key: 'token');
    notifyListeners();
  }
}
