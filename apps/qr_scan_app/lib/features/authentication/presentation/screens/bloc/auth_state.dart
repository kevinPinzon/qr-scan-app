part of 'auth_bloc.dart';

class AuthState {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Initial extends AuthState {}

class Loading extends AuthState {}

class SignInSuccessful extends AuthState {}

class LogOutSuccessful extends AuthState {
  const LogOutSuccessful();

  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String? message;

  const AuthError({
    this.message = '',
  });

  List<Object> get props => [];
}
