import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/cubit/counter_cubit/counter_cubit.dart';
import 'package:iti_flutter/cubit/counter_cubit/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  //

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Cubit Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            int count = 0;

            if (state is CounterValueChanhed) {
              count = state.counter;
            } else if (state is CounterIntial) {
              count = state.count;
            }

            return Text("Count: $count", style: TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: cubit.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16,),
          FloatingActionButton(
            onPressed: cubit.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
