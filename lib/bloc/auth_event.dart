part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInRequested extends AuthEvent {
  LogInRequested(
    this.email,
    this.password,
  );
  final String email;
  final String password;
  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class LogInEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class ResgisterRequested extends AuthEvent {
  ResgisterRequested(this.email, this.password, this.userName);

  final String email;
  final String password;
  final String userName;
  @override
  List<Object> get props => [
        email,
        password,
        userName,
      ];
}

class LogOutRequested extends AuthEvent {}
