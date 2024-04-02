import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/sqlliite.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());
  List ggg = [];

  SqlDb sql1 = SqlDb();
  read(String Itemid) async {
    var response = await sql1
        .insertData("INSERT INTO 'favorite' ('itemid') VALUES ('note')");
    print('#####################################$response');
    print('#####################################$Itemid');

    emit(SaveLocalInitial());
  }

  Future readData() async {
    List<Map> response = await sql1.read("favorite");
    ggg.addAll(response);
    print('GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG$ggg');
    emit(SaveLocalInitial());
  }
}
