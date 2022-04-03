import 'package:cm_state_demo/src/app_route.dart';
import 'package:cm_state_demo/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:cm_state_demo/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, AppRoute.another),
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: BlocBuilder<CounterABloc, CounterAState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'CounterA:',
                ),
                Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterABloc>().add(CounterAEventReset()),
            tooltip: 'Reset',
            child: const Icon(Icons.restore),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterABloc>().add(CounterAEventAdd()),
            tooltip: 'Add',
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
