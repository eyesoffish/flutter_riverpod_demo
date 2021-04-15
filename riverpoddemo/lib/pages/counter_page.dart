import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends StatelessWidget {
  final counterStateProvider = StateProvider<int>((ref) {
    return 0;
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CounterPage"),
      ),
      body: Consumer(builder: (context, watch, child) {
        final counter = watch(counterStateProvider);
        return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${counter.state}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterStateProvider).state++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}