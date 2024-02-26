part of 'authenticaton_bloc.dart';

sealed class AuthenticatonState {}

final class AuthenticatonInitial extends AuthenticatonState {}

final class LoadingState extends AuthenticatonState {}

final class ExceptionState extends AuthenticatonState {
  String exception;
  ExceptionState({required this.exception});
}

final class InvalidEmailFormatState extends AuthenticatonState {
  String errorMessage;
  InvalidEmailFormatState({required this.errorMessage});
}

final class InvalidPasswordFormatState extends AuthenticatonState {
  String errorMessage;
  InvalidPasswordFormatState({required this.errorMessage});
}

final class RegisterSuccessState extends AuthenticatonState {
  String message;
  RegisterSuccessState({required this.message});
}

final class RegisterFailedState extends AuthenticatonState {
  String errorMessage;
  RegisterFailedState({required this.errorMessage});
}

final class LoginSuccessState extends AuthenticatonState {
  String message;
  LoginSuccessState({required this.message});
}

final class LoginFailedState extends AuthenticatonState {
  String errorMessage;
  LoginFailedState({required this.errorMessage});
}
