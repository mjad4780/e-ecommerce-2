part of 'translate_cubit.dart';

@immutable
sealed class TranslateState {}

final class TranslateInitial extends TranslateState {}

final class ChangeLocalState extends TranslateState {
  final Locale locale;

  ChangeLocalState({required this.locale});
}
