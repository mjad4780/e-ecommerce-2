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

//verfycode
final class SuccessVerfycode extends AuthState {}

final class failerverfycode extends AuthState {
  // final String ss;

  // failerverfycode({required this.ss});
}

final class serverfailer extends AuthState {}
// final class SuccessSignup extends AuthState {}

//////////Login//////////
final class Loginloading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailer extends AuthState {}

final class LoginFailernodata extends AuthState {}

final class LoginFailerExpition extends AuthState {}
