part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignIn extends AuthEvent {}

class LogOut extends AuthEvent {}
