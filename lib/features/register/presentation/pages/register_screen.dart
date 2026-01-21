import 'package:flutter/material.dart';
import 'package:tut/core/app_manager/assets_manager.dart';
import 'package:tut/core/app_manager/values_manager.dart';
import 'package:tut/core/di/di.dart';
import 'package:tut/features/register/presentation/manager/register_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameEditingController =
      TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _mobileNumberEditingController =
      TextEditingController();

  void _bind() {
    _viewModel.start();
    _userNameEditingController.addListener(() {
      _viewModel.setUserName(_userNameEditingController.text);
    });
    _emailEditingController.addListener(() {
      _viewModel.setEmail(_emailEditingController.text);
    });
    _passwordEditingController.addListener(() {
      _viewModel.setPassword(_passwordEditingController.text);
    });
    _mobileNumberEditingController.addListener(() {
      _viewModel.setMobileNumber(_mobileNumberEditingController.text);
    });

    // dummy country code & profile picture for now
    _viewModel.setCountryCode("+20");
    _viewModel.setProfilePicture("profile_pic.png");
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: AppSize.s0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: AppPadding.p28),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                  child: Image(image: AssetImage(AssetsManager.splashLogo)),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _userNameEditingController,
                        decoration: InputDecoration(
                          hintText: "User Name",
                          labelText: "User Name",
                          errorText: (snapshot.data ?? true)
                              ? null
                              : "Invalid User Name",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.s12),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsEmailValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _emailEditingController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "Email",
                          errorText: (snapshot.data ?? true)
                              ? null
                              : "Invalid Email",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.s12),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsMobileNumberValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _mobileNumberEditingController,
                        decoration: InputDecoration(
                          hintText: "Mobile Number",
                          labelText: "Mobile Number",
                          errorText: (snapshot.data ?? true)
                              ? null
                              : "Invalid Mobile Number",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.s12),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _passwordEditingController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          errorText: (snapshot.data ?? true)
                              ? null
                              : "Invalid Password",
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.register();
                                }
                              : null,
                          child: const Text("Register"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
