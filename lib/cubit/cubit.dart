import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());
  int counter = 0;
  static CounterCubit get(context) => BlocProvider.of(context);
  void minus() {
    counter--;
    emit(CounterMinusState(counter));
  }
  void plus() {
    counter++;
    emit(CounterPlusState(counter));
  }
}