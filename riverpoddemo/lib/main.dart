import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpoddemo/pages/counter_page.dart';
import 'package:riverpoddemo/pages/dash_bord.dart';
import 'package:riverpoddemo/pages/future_page.dart';
import 'package:riverpoddemo/pages/list_net_page.dart';
import 'package:riverpoddemo/pages/list_page.dart';
import 'package:riverpoddemo/pages/timer_page.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'RiverPod Demo'),
      // home: Scaffold(
      //   body: HomeScreen(),
      // ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String? title;

  MyHomePage({Key? key, this.title}) : super(key: key);

  final List<Widget> list = [
    CounterPage(),
    ClockPage(),
    FuturePage(),
    ListPage(),
    ListNetPage(),
    DashBoard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title ?? ""),),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${list[index].runtimeType}"),
            onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => list[index])),
          );
      }),
    );
  }
}

