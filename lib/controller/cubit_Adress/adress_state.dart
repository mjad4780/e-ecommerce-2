part of 'adress_cubit.dart';

@immutable
sealed class AdressState {}

final class AdressInitial extends AdressState {}

final class Adressloding extends AdressState {}

final class Adresssuccess extends AdressState {}

final class Adressfailer extends AdressState {
  final StatusReqest statusReqest;

  Adressfailer({required this.statusReqest});
}

final class addAdressloding extends AdressState {}

final class addAdresssuccess extends AdressState {}

final class addAdressfailer extends AdressState {
  final StatusReqest statusReqest;

  addAdressfailer({required this.statusReqest});
}

final class editAdressloding extends AdressState {}

final class editAdresssuccess extends AdressState {}

final class editAdressfailer extends AdressState {
  final StatusReqest statusReqest;

  editAdressfailer({required this.statusReqest});
}

final class deleteAdressloding extends AdressState {}

final class deleteAdresssuccess extends AdressState {}

final class deleteAdressfailer extends AdressState {
  final StatusReqest statusReqest;

  deleteAdressfailer({required this.statusReqest});
}
