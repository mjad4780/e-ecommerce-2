import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'servise_state.dart';

class ServiseCubit extends Cubit<ServiseState> {
  ServiseCubit() : super(ServiseInitial());
}
