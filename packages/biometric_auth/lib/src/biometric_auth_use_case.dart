import 'package:biometric_auth/biometric_auth.dart';

class BiometricAuthUseCase {
  final BiometricAuthApi biometricAuthApi;

  BiometricAuthUseCase({required this.biometricAuthApi});

  Future<bool> authenticateUser() async {
    // Verificar si el dispositivo soporta biometría y hacer la autenticación
    bool isAuthenticated = await biometricAuthApi.authenticate();

    if (!isAuthenticated) {
      return false; // Si no fue posible autenticar con biometría o PIN
    }

    return true; // Autenticación exitosa
  }
}
