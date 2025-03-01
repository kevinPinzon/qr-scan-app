import 'package:biometric_auth/auth_biometric.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final biometricAuth = BiometricRepositoryImpl();
  static const String _authKey = 'is_authenticated';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<bool> authenticateUser() async {
    try {
      final isAuthenticated = await biometricAuth.getResult();
      if (isAuthenticated) {
        await _secureStorage.write(key: _authKey, value: 'true');
      }
      return isAuthenticated;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isAuthenticated() async {
    final value = await _secureStorage.read(key: _authKey);
    return value == 'true';
  }

  Future<void> logOut() async {
    try {
      await clearAuthentication();
    } catch (e) {
      throw Exception("Error during logout: $e");
    }
  }

  Future<void> clearAuthentication() async {
    try {
      await _secureStorage.delete(key: _authKey);
    } catch (e) {
      throw Exception("Error clearing authentication data: $e");
    }
  }
}
