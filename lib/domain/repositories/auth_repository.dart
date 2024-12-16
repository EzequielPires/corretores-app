import 'package:app/domain/models/auth_response.dart';
import 'package:app/domain/models/user.dart';

abstract class AuthRepository {
  Future<AuthResponse> signin(String email, String password);
  Future<AuthResponse?> load();
  Future<AuthResponse> signup(User user);
  Future<void> signout();
}
