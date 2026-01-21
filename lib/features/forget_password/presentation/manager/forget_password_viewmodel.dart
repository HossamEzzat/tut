import 'dart:async';

import 'package:tut/core/base_view_model/base_view_model.dart';
import 'package:tut/features/forget_password/domain/use_cases/forget_password_usecase.dart';

class ForgotPasswordViewModel extends BaseViewModel
    implements ForgotPasswordViewModelInputs, ForgotPasswordViewModelOutputs {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  String email = "";

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  @override
  void start() {
    // start
  }

  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  void forgotPassword() async {
    (await _forgotPasswordUseCase.execute(email)).fold(
      (failure) {
        // print(failure.message);
      },
      (supportMessage) {
        // print(supportMessage);
      },
    );
  }

  @override
  void setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outputIsAllInputValid => _isAllInputValidStreamController
      .stream
      .map((isAllInputValid) => _isAllInputValid());

  bool _isEmailValid(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  bool _isAllInputValid() {
    return _isEmailValid(email);
  }

  void _validate() {
    inputIsAllInputValid.add(null);
  }
}

abstract class ForgotPasswordViewModelInputs {
  void setEmail(String email);
  void forgotPassword();

  Sink get inputEmail;
  Sink get inputIsAllInputValid;
}

abstract class ForgotPasswordViewModelOutputs {
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsAllInputValid;
}
