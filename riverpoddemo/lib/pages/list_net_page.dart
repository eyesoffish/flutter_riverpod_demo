import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpoddemo/listpage/model.dart';
import '../listpage/list_controller.dart';

class ListNetPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final posts = watch(postsProvider);
    print("abc");
    return Scaffold(
      appBar: AppBar(
        title: Text("List network"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read(postsProvider.notifier).refresh();
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: posts.list.length,
                itemBuilder: (context, index) {
                  final m = posts.list[index];
                  return ListTile(title: Text(m.name), leading: Text(m.id),);
              }),
            ),
            SafeArea(child: Text("${posts.isLoading ? "Loading" : ""}"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.more),
        onPressed: () => context.read(postsProvider.notifier).loadMorePost(),
      ),
    );
  }
}