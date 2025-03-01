import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_scan_app/features/authentication/domain/auth_use_case.dart';
import '../../../data/repositories/auth_repository_impl.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;

  AuthBloc({AuthUseCase? authUseCase})
      : _authUseCase = authUseCase ?? AuthUseCase(AuthRepositoryImpl()),
        super(AuthInitial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<SignIn>(_onSignIn);
    on<LogOut>(_onLogOut);
  }

  Future<void> _onCheckAuthStatus(
      CheckAuthStatus event, Emitter<AuthState> emit) async {
    final isAuthenticated = await _authUseCase.isAuthenticated();
    if (isAuthenticated) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final isAuthenticated = await _authUseCase.isAuthenticated();
    if (isAuthenticated) {
      emit(Authenticated());
    } else {
      emit(AuthError('Authentication failed'));
    }
  }

  Future<void> _onLogOut(LogOut event, Emitter<AuthState> emit) async {
    await _authUseCase.logOut();
    emit(Unauthenticated());
  }
}
