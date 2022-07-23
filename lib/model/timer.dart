import 'dart:async';

class TimerSingleton {
  static Duration _duration = Duration();

  static setDuration(Duration duration) {
    _duration = duration;
  }

  static Duration get instance => _duration;
}
