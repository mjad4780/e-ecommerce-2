part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

///////////////CheckEmail////////////////
final class CheckEmailloading extends ForgetPasswordState {}

final class CheckEmailSuccess extends ForgetPasswordState {}

final class CheckEmailfailer extends ForgetPasswordState {}

final class CheckEmailFailernodata extends ForgetPasswordState {}

/////////////////////verfycodefor////////////////
final class verfycodeforloading extends ForgetPasswordState {}

final class verfycodeforSuccess extends ForgetPasswordState {}

final class verfycodeforfailer extends ForgetPasswordState {}

final class verfycodeforFailernodata extends ForgetPasswordState {}

//////////Repassword//////////
final class Repasswordloading extends ForgetPasswordState {}

final class RepasswordSuccess extends ForgetPasswordState {}

final class RepasswordFailer extends ForgetPasswordState {}

final class RepasswordFailernodata extends ForgetPasswordState {}

final class RepasswordNull extends ForgetPasswordState {}
