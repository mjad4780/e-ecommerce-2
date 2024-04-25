part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class ChoosePaymentMethod extends OrderState {}

final class ChooseDeliveryType extends OrderState {}

final class ChooseShippingAddress extends OrderState {}

final class LoadingCheckout extends OrderState {}

final class SuccessCheckout extends OrderState {}

final class FDailerCheckout extends OrderState {}

final class Failer extends OrderState {}

//////////////////////////
final class Loadinggetorder extends OrderState {}

final class Successgetorder extends OrderState {}

final class FDailergetorder extends OrderState {}

final class Failergetorder extends OrderState {}
