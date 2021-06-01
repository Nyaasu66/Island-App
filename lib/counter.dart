import 'package:mobx/mobx.dart';
import 'dart:async';

part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 196;

  @observable
  bool btnStatus = false;

  @action
  void increment() {
    value++;
    print("Counter: $value");
  }

  @action
  void fastIncrement(bool status) {
    if (status) {
      btnStatus = true;
      const oneSec = const Duration(milliseconds: 40);
      new Timer.periodic(oneSec, (Timer t) {
        increment();
        if (btnStatus == false) {
          t.cancel();
        }
      });
    } else {
      btnStatus = false;
    }
  }
}
