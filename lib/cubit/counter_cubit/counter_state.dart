abstract class CounterState {}

class CounterIntial extends CounterState {
  final int count = 0;
}


class CounterValueChanhed extends CounterState {
  final int counter;
  CounterValueChanhed(this.counter);
}