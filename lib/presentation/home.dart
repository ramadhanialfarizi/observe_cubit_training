import 'package:flutter/material.dart';
import 'package:observe_cubit_training/bloc_cubit/bloc_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observed Cubit'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        // KITA BISA MEMBERIKAN INISIAL DATA DI STREAM
        initialData: myCounter.initial,
        stream: myCounter.stream,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Current State : ' + myCounter.current.toString()),
                    Text('Next State : ' + myCounter.next.toString()),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myCounter.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
