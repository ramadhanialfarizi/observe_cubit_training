import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initial = 0}) : super(initial);

  int initial;

  // KITA INGIN MENAMPILKAN HASIL OBSERVE ONCHANGE PADA WIDGET
  int? current;
  int? next;

  void increment() {
    // state in cubit refers to super
    emit(state + 1);
  }

  // OBSERVE CUBIT
  /* 
    observe cubit => digunakan untuk memantau segala sesuatu pada state management cubit
    apa yang bisa dipantau?
    - perubahan (onChange)
    - error (onError) 
  */

  // ONCHANGE
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
    current = change.currentState;
    next = change.nextState;
  }

  // ONERROR
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("$error , $stackTrace");
  }
}
