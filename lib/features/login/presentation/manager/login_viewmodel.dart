import 'dart:async';

import 'package:tut/core/base_view_model/base_view_model.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final LoginUseCase _loginUseCase;

  var loginObject = LoginObject("", "");

  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _isAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // start view model
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  void login() async {
    (await _loginUseCase.execute(
      LoginUseCaseInput(loginObject.userName, loginObject.password),
    )).fold(
      (failure) => {
        // left -> failure
        // print(failure.message),
      },
      (data) => {
        // right -> success (data)
        // print(data.toString()),
      },
    );
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  void setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }

  // outputs
  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  // private functions
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }

  void _validate() {
    inputIsAllInputsValid.add(null);
  }
}

abstract class LoginViewModelInputs {
  void setUserName(String userName);
  void setPassword(String password);
  void login();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputIsAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}

class LoginObject {
  String userName;
  String password;

  LoginObject(this.userName, this.password);

  LoginObject copyWith({String? userName, String? password}) {
    return LoginObject(userName ?? this.userName, password ?? this.password);
  }
}
