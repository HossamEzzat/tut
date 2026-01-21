import 'package:flutter/material.dart';
import 'package:tut/core/app_manager/assets_manager.dart';
import 'package:tut/core/app_manager/values_manager.dart';
import 'package:tut/core/di/di.dart';
import 'package:tut/features/forget_password/presentation/manager/forget_password_viewmodel.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgotPasswordViewModel _viewModel =
      instance<ForgotPasswordViewModel>();
  final TextEditingController _emailEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();
    _emailEditingController.addListener(
      () => _viewModel.setEmail(_emailEditingController.text),
    );
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
        title: const Text("Forgot Password"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: AppSize.s0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: AppPadding.p100),
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
                const SizedBox(height: AppSize.s28),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p28,
                    right: AppPadding.p28,
                  ),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outputIsAllInputValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.s40,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.forgotPassword();
                                }
                              : null,
                          child: const Text("Reset Password"),
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
