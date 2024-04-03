part of 'home_page_cubit.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class NavigationBottm extends HomePageState {}

///////// Home/////////
final class LoadingHome extends HomePageState {}

final class Successhome extends HomePageState {}

final class Successhome2 extends HomePageState {}

final class NodataHome extends HomePageState {}

final class FailerHome extends HomePageState {}

////////itemCategories/////
final class LoadingitemCategories extends HomePageState {}

final class SuccessitemCategories extends HomePageState {}

final class NodataitemCategories extends HomePageState {}

final class FaileritemCategories extends HomePageState {}

/////////////favorite add/////////
final class SuccessLike extends HomePageState {}

final class LoadingAdd extends HomePageState {}

final class SuccessAdd extends HomePageState {}

final class failerAdd extends HomePageState {}

final class NodataAdd extends HomePageState {}
/////////////////favorite remove////////

final class LoadingRemove extends HomePageState {}

final class SuccessRemove extends HomePageState {}

final class failerRemove extends HomePageState {}
///////////////Local//////////

final class SaveLocalInitial extends HomePageState {}

final class ReadLocalInitial extends HomePageState {}

final class removelInitial extends HomePageState {}

final class loadinglocallInitial extends HomePageState {}
///////////////favorite get//////

final class Loadingfavoriteget extends HomePageState {}

final class successFavoriteget extends HomePageState {}

final class NodataFavoriteget extends HomePageState {}

final class failerFavoriteget extends HomePageState {}
