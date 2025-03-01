import 'package:qr_scan_app/features/authentication/domain/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<bool> isAuthenticated() {
    return _authRepository.authenticateUser();
  }

  Future<void> logOut() {
    return _authRepository.logOut();
  }
}
