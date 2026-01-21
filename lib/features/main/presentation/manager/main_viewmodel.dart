import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:tut/core/base_view_model/base_view_model.dart';
// import 'package:tut/features/main/domain/use_cases/home_usecase.dart'; // Future use

class MainViewModel extends BaseViewModel
    implements MainViewModelInputs, MainViewModelOutputs {
  final _titleStreamController = BehaviorSubject<String>();

  @override
  void start() {
    // initial title
    _titleStreamController.add("Main Screen");
  }

  @override
  void dispose() {
    _titleStreamController.close();
  }

  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Stream<String> get outputTitle => _titleStreamController.stream;

  void updateTitle(String title) {
    inputTitle.add(title);
  }
}

abstract class MainViewModelInputs {
  Sink get inputTitle;
}

abstract class MainViewModelOutputs {
  Stream<String> get outputTitle;
}
