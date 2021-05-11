import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) {
    return 0;
});
class CounterPage extends StatelessWidget {
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