import 'package:local_auth/local_auth.dart';

class BiometricAuthApi {
  final LocalAuthentication _localAuth = LocalAuthentication();

  // Método para autenticar con biometría o PIN
  Future<bool> authenticate() async {
    bool isDeviceSupported = await _localAuth.isDeviceSupported();
    if (!isDeviceSupported) {
      return false; // El dispositivo no soporta autenticación biométrica
    }

    try {
      bool canCheckBiometrics = await _localAuth.canCheckBiometrics;
      if (canCheckBiometrics) {
        bool didAuthenticate = await _localAuth.authenticate(
          localizedReason: 'Por favor autentíquese para continuar.',
          options: const AuthenticationOptions(
            biometricOnly: true,
          ),
        );
        if (didAuthenticate) {
          return true; // Autenticación biométrica exitosa
        }
      }
    } catch (e) {
      // Error al intentar autenticar con biometría
      return false;
    }

    // Si no hay biometría disponible o no se pudo autenticar, intentamos con el PIN
    return await authenticateWithPin();
  }

  // Método para autenticar con el PIN del dispositivo
  Future<bool> authenticateWithPin() async {
    try {
      bool didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Por favor ingresa tu PIN para continuar.',
        options: const AuthenticationOptions(
          biometricOnly: false, // Permite PIN, patrón o contraseña
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
      return didAuthenticate;
    } catch (e) {
      return false; // Si ocurre un error al autenticar con PIN
    }
  }
}
