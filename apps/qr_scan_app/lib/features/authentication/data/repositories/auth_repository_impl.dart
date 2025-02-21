import 'package:qr_scan_app/features/authentication/data/services/auth_service.dart';
import 'package:qr_scan_app/features/authentication/domain/auth_repository.dart'; // Ya tienes este servicio.

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService = AuthService();

  @override
  Future<bool> authenticateUser() {
    return _authService.authenticateUser();
  }

  @override
  Future<void> logOut() {
    return _authService.logOut();
  }
}
