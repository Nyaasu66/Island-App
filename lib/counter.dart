import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 194;

  @action
  void increment() {
    value++;
    print("Counter: $value");
  }
}
