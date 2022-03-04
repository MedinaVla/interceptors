part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class LoggedInSuccessfully extends AuthState {}

class NotLoggedIn extends AuthState {}

class LoggedInFailed extends AuthState {
  final String error;

  LoggedInFailed(this.error);
  @override
  List<Object> get props => [error];
}

class RegisteredSuccessfully extends AuthState {}

class NotRegistered extends AuthState {}

class RegisteredFailed extends AuthState {
  final String error;

  RegisteredFailed(this.error);
  @override
  List<Object?> get props => [error];
}
