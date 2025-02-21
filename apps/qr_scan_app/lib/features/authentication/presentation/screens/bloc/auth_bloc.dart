import 'package:bloc/bloc.dart';

import 'package:qr_scan_app/features/authentication/domain/auth_use_case.dart';
import '../../../data/repositories/auth_repository_impl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;

  AuthBloc({AuthUseCase? authUseCase})
      : _authUseCase = authUseCase ?? AuthUseCase(AuthRepositoryImpl()),
        super(Initial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignIn) {
        await signIn(emit);
      } else if (event is LogOut) {
        await logOut(emit);
      }
    });
  }

  Future<void> signIn(Emitter emit) async {
    try {
      emit(Loading());
      bool isAuthenticated = await _authUseCase.authenticateUser();

      if (isAuthenticated) {
        emit(SignInSuccessful());
      } else {
        emit(const AuthError(message: 'Authentication failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> logOut(Emitter emit) async {
    try {
      emit(Loading());
      await _authUseCase.logOut();
      emit(const LogOutSuccessful());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
