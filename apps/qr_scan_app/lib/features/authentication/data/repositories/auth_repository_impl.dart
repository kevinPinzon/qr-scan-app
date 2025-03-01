import 'package:qr_scan_app/features/authentication/data/services/auth_service.dart';
import 'package:qr_scan_app/features/authentication/domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl({AuthService? authService})
      : _authService = authService ?? AuthService();

  @override
  Future<bool> authenticateUser() async {
    try {
      return await _authService.authenticateUser();
    } catch (e) {
      throw Exception("Error during authentication: $e");
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _authService.logOut();
    } catch (e) {
      throw Exception("Error during logout: $e");
    }
  }
}
