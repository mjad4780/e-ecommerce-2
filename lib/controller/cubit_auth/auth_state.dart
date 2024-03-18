part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthInitiagkl extends AuthState {}

final class disposeer extends AuthState {}

///////////////SignUp////////////////
final class Signuploading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignUpfailer extends AuthState {}

final class SignUpFailernodata extends AuthState {}

/////////////////////verfycode////////////////
final class LoadingVerfycode extends AuthState {}

final class SuccessVerfycode extends AuthState {}

final class failerverfycode extends AuthState {}

final class verfycodeFailernodata extends AuthState {}

//////////Login//////////
final class Loginloading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailer extends AuthState {}

final class LoginFailernodata extends AuthState {}

final class LoginFailerExpition extends AuthState {}
