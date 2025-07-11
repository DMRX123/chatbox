import 'package:chatbox/models/user_model.dart';
import 'package:chatbox/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({required AuthService authService})
      : _authService = authService;

  Future<UserModel> login({required String email, required String password}) async {
    try {
      final user = await _authService.loginWithEmail(email, password);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await _authService.signupWithEmail(
        email: email,
        password: password,
        name: name,
      );
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      rethrow;
    }
  }
}