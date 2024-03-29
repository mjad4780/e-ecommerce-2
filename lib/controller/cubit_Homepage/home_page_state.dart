part of 'home_page_cubit.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class NavigationBottm extends HomePageState {}

///////// Home/////////
final class LoadingHome extends HomePageState {}

final class Successhome extends HomePageState {}

final class NodataHome extends HomePageState {}

final class FailerHome extends HomePageState {}

////////itemCategories/////
final class LoadingitemCategories extends HomePageState {}

final class SuccessitemCategories extends HomePageState {}

final class NodataitemCategories extends HomePageState {}

final class FaileritemCategories extends HomePageState {}
