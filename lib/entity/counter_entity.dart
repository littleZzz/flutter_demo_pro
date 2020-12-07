import 'package:flutter/material.dart';

class CounterEntity with ChangeNotifier {
  num count = 0;

  CounterEntity();

  void increaseCount() {
    count++;
    notifyListeners();
    print("这个是计数器的值:${count}");
  }
}
