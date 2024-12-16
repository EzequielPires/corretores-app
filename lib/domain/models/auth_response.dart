import 'package:app/domain/models/user.dart';

class AuthResponse {
  final bool success;
  final User? user;
  final String? token;
  final String? error;

  AuthResponse({required this.success, this.token, this.user, this.error});
}
