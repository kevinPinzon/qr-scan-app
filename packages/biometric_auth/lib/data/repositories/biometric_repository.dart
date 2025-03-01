import 'package:biometric_auth/native/biometric_auth.g.dart';

final _api = BiometricAuthHost();

class BiometricRepositoryImpl {
  Future<bool> getResult() async {
    try {
      return await _api.isAvailable();
    } catch (e) {
      return false;
    }
  }
}
