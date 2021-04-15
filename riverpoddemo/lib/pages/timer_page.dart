import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Clock extends StateNotifier<DateTime> {
  late Timer _timer;
  Clock() : super(DateTime.now()) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) { 
      state = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});

class ClockPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final curremtTime = watch(clockProvider);
    final datetime = DateFormat.Hms().format(curremtTime);
    return Scaffold(
      appBar: AppBar(title: Text("Clock"),),
      body: Center(
        child: Text("$datetime"),
      ),
    );
  }
}