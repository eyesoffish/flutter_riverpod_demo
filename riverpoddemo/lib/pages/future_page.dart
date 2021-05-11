import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final futureProvider = FutureProvider.autoDispose((ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return Future.value(36);
});

final stramProvider = StreamProvider.autoDispose((ref) {
  return Stream.fromIterable([1,2,3,4,5]);
});

class FuturePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // final streamAsyncValue = watch(stramProvider);
    final futurevale = watch(futureProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Future"),),
      body: ProviderListener<AsyncValue<int>>(
        provider: futureProvider,
        onChange: (context, value) {
          
        },
        child: Center(
          child: futurevale.when(
            data: (data) => Text('value: $data'), 
            loading: () => CircularProgressIndicator(), 
            error: (e, st) => Text("Error: $e")
          ),
        ),
      ),
    );
  }
}