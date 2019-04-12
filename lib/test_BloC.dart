import 'dart:async';

class CountBLoC {
  int _count;
  StreamController<int> _controller;

  CountBLoC() {
    _count = 0;
    _controller = StreamController<int>();
  }

  Stream<int> get value => _controller.stream;

  increment() {
    _controller.sink.add(++_count);
  }

  dispose() {
    _controller.close();
  }
}
