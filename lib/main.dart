import 'package:cm_state_demo/src/app_route.dart';
import 'package:cm_state_demo/src/bloc/app_bloc_observer.dart';
import 'package:cm_state_demo/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:cm_state_demo/src/bloc/counter_b_bloc/counter_b_bloc.dart';
import 'package:cm_state_demo/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // runApp(const MyApp());

  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final counterABloc = BlocProvider<CounterABloc>(create: (context) => CounterABloc());
    final counterBBloc = BlocProvider<CounterBBloc>(create: (context) => CounterBBloc());


    return MultiBlocProvider(
      providers: [counterABloc, counterBBloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: AppRoute().getAll,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'HomePage'),
      ),
    );
  }
}
