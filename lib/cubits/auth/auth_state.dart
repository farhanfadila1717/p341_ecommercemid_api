part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class SuccessGetAuth extends AuthState {
  final UserModel user;

  SuccessGetAuth({required this.user});
}

class FailedGetAuth extends AuthState {}

class FailedForgotPassword extends AuthState {}
