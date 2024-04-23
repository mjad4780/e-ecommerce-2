part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

//////getcart
final class loadingGetCart extends CartState {}

final class SuccessGetCart extends CartState {}

final class FailerGetCart extends CartState {}

final class NodataGetCart extends CartState {}

/////addcart
final class loadingAddCart extends CartState {}

final class SuccessAddCart extends CartState {}

final class FailerAddCart extends CartState {}

final class NodataAddCart extends CartState {}

/////////deletecart/////////
final class loadingdeleteCart extends CartState {}

final class SuccessdeleteCart extends CartState {}

final class FailerdeleteCart extends CartState {}

final class NodatadeleteCart extends CartState {}

/////////current
final class loadingGetcurrentCart extends CartState {}

final class SuccessGetcurrentCart extends CartState {}

final class FailerGetcurrentCart extends CartState {}

final class NodataGetcurrentCart extends CartState {}

/////////coupon/////////////////////
final class LoadingCoupon extends CartState {}

final class SuccessCoupon extends CartState {}

final class NodataCoupon extends CartState {}

final class FailerCoupon extends CartState {
  final StatusReqest statusReqest;

  FailerCoupon({required this.statusReqest});
}
