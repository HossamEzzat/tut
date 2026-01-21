import 'package:flutter/material.dart';
import 'package:tut/core/di/di.dart';
import 'package:tut/features/main/presentation/manager/main_viewmodel.dart';
import 'package:tut/core/app_manager/values_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainViewModel _viewModel = instance<MainViewModel>();

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          stream: _viewModel.outputTitle,
          builder: (context, snapshot) {
            return Text(snapshot.data ?? "Main Screen");
          },
        ),
        centerTitle: true,
        elevation: AppSize.s0,
      ),
      body: Center(child: Text("Main Screen Content")),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
