import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentIndex = ScopedProvider<int>((_) => throw UnimplementedError());

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list page"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ProviderScope(
          overrides: [
            currentIndex.overrideWithValue(index)
          ],
          child: Cell()
        );
      }),
    );
  }
}

class Cell extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final index = watch(currentIndex);
    return ListTile(
      title: Text("$index"),
      onTap: () => Navigator.pop(context),
    );
  }
}