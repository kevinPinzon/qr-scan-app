import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/native/biometric_auth.g.dart',
  kotlinOut:
      'android/src/main/kotlin/dev/flutter/biometric_auth/BiometricAuth.g.kt',
  kotlinOptions: KotlinOptions(
    package: "dev.flutter.biometric_auth",
  ),
  dartPackageName: 'biometric_auth',
))
@HostApi()
abstract class BiometricAuthHost {
  @async
  bool isAvailable();
}
