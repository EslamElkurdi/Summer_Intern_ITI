import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/cubit/counter_cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  static final CounterCubit _instance = CounterCubit._internal();

  factory CounterCubit() => _instance;

  CounterCubit._internal() : super(CounterIntial());

  int _count = 0;

  void increment() {
    _count++;
    emit(CounterValueChanhed(_count));
  }

  void decrement() {
    _count--;
    emit(CounterValueChanhed(_count));
  }

  int get count => _count;
}
