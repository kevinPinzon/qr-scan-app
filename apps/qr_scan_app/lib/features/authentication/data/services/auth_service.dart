import 'package:biometric_auth/biometric_auth.dart';

class AuthService {
  final BiometricAuthApi _biometricAuthApi = BiometricAuthApi();

  // Función que retorna true o false dependiendo del resultado de la autenticación
  Future<bool> authenticateUser() async {
    try {
      // Intentamos autenticar al usuario
      final result = await _biometricAuthApi.authenticate();

      // Retorna true si la autenticación fue exitosa, false en caso contrario
      return result;
    } catch (e) {
      // Si ocurre un error, se lanza una excepción
      return false; // Retorna false si hay un error
    }
  }

  Future<void> logOut() async {
    try {
      // Aquí puedes agregar el código de cierre de sesión si es necesario
    } catch (e) {
      throw e;
    }
  }
}
