part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthInitiagkl extends AuthState {}

final class disposeer extends AuthState {}

//  auth
final class loadingSignup extends AuthState {}

final class SuccessSignup extends AuthState {}

final class failer extends AuthState {
  final String ss;

  failer({required this.ss});
}
// final class disposeer extends AuthState {}
