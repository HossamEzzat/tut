import 'dart:async';

import 'package:tut/core/base_view_model/base_view_model.dart';
import 'package:tut/features/register/domain/use_cases/register_usecase.dart';

class RegisterViewModel extends BaseViewModel
    implements RegisterViewModelInputs, RegisterViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _profilePictureStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final RegisterUseCase _registerUseCase;
  var registerObject = RegisterObject("", "", "", "", "", "");

  RegisterViewModel(this._registerUseCase);

  // inputs
  @override
  void dispose() {
    _userNameStreamController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _profilePictureStreamController.close();
    _isAllInputsValidStreamController.close();
  }

  @override
  void start() {
    // start
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  void register() async {
    (await _registerUseCase.execute(
      RegisterUseCaseInput(
        registerObject.userName,
        registerObject.countryMobileCode,
        registerObject.mobileNumber,
        registerObject.email,
        registerObject.password,
        registerObject.profilePicture,
      ),
    )).fold(
      (failure) {
        // print(failure.message);
      },
      (data) {
        // print(data.toString());
      },
    );
  }

  @override
  void setUserName(String userName) {
    inputUserName.add(userName);
    if (_isUserNameValid(userName)) {
      registerObject = registerObject.copyWith(userName: userName);
    } else {
      registerObject = registerObject.copyWith(userName: "");
    }
    _validate();
  }

  @override
  void setCountryCode(String countryCode) {
    if (countryCode.isNotEmpty) {
      registerObject = registerObject.copyWith(countryMobileCode: countryCode);
    } else {
      registerObject = registerObject.copyWith(countryMobileCode: "");
    }
    _validate();
  }

  @override
  void setEmail(String email) {
    inputEmail.add(email);
    if (_isEmailValid(email)) {
      registerObject = registerObject.copyWith(email: email);
    } else {
      registerObject = registerObject.copyWith(email: "");
    }
    _validate();
  }

  @override
  void setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if (_isMobileNumberValid(mobileNumber)) {
      registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    } else {
      registerObject = registerObject.copyWith(mobileNumber: "");
    }
    _validate();
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      registerObject = registerObject.copyWith(password: password);
    } else {
      registerObject = registerObject.copyWith(password: "");
    }
    _validate();
  }

  @override
  void setProfilePicture(String profilePicture) {
    inputProfilePicture.add(profilePicture);
    if (profilePicture.isNotEmpty) {
      registerObject = registerObject.copyWith(profilePicture: profilePicture);
    } else {
      registerObject = registerObject.copyWith(profilePicture: "");
    }
    _validate();
  }

  // outputs
  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputErrorUserName => outputIsUserNameValid.map(
    (isUserNameValid) => isUserNameValid ? false : true,
  );

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<bool> get outputIsMobileNumberValid => _mobileNumberStreamController
      .stream
      .map((mobileNumber) => _isMobileNumberValid(mobileNumber));

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsProfilePictureValid =>
      _profilePictureStreamController.stream.map((_) => true);

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _validateAllInputs());

  // private functions
  bool _isUserNameValid(String userName) {
    return userName.length >= 8;
  }

  bool _isEmailValid(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  bool _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length >= 10;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool _validateAllInputs() {
    return registerObject.userName.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.mobileNumber.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.countryMobileCode.isNotEmpty &&
        registerObject.profilePicture.isNotEmpty;
  }

  void _validate() {
    inputAllInputsValid.add(null);
  }
}

abstract class RegisterViewModelInputs {
  Sink get inputUserName;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputProfilePicture;
  Sink get inputAllInputsValid;

  void setUserName(String userName);
  void setMobileNumber(String mobileNumber);
  void setCountryCode(String countryCode);
  void setEmail(String email);
  void setPassword(String password);
  void setProfilePicture(String profilePicture);
  void register();
}

abstract class RegisterViewModelOutputs {
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputErrorUserName;

  Stream<bool> get outputIsMobileNumberValid;
  Stream<bool> get outputIsEmailValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsProfilePictureValid;
  Stream<bool> get outputIsAllInputsValid;
}

class RegisterObject {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterObject(
    this.userName,
    this.countryMobileCode,
    this.mobileNumber,
    this.email,
    this.password,
    this.profilePicture,
  );

  RegisterObject copyWith({
    String? userName,
    String? countryMobileCode,
    String? mobileNumber,
    String? email,
    String? password,
    String? profilePicture,
  }) {
    return RegisterObject(
      userName ?? this.userName,
      countryMobileCode ?? this.countryMobileCode,
      mobileNumber ?? this.mobileNumber,
      email ?? this.email,
      password ?? this.password,
      profilePicture ?? this.profilePicture,
    );
  }
}
