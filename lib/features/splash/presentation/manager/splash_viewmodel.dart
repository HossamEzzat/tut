import 'dart:async';
import 'package:tut/core/base_view_model/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  void startDelay(Function onDelayFinished) {
    Timer(const Duration(seconds: 3), () {
      onDelayFinished();
    });
  }

  @override
  void dispose() {
    // nothing to dispose for now
  }

  @override
  void start() {
    // nothing to start for now
  }
}
