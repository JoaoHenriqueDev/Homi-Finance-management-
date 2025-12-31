import '../../../core/api/api_client.dart';

class AuthService {

  Future<String> login(String email, String password) async {
    try {
      final response = await ApiClient.dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data['token']; // ajuste conforme seu retorno
      } else {
        throw Exception('Erro no login');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }

  Future<bool> register(String name, String email, String password, String fotoURL, String celular) async {
    try {
      final response = await ApiClient.dio.post('/auth/register', data: {
        'name': name,
        'email': email,
        'password': password,
        'fotoUrl': fotoURL,
        'celular': celular
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}