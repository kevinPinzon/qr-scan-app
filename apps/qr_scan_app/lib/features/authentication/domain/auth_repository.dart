abstract class AuthRepository {
  Future<bool> authenticateUser();
  Future<void> logOut();
}
