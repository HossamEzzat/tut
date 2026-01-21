import 'package:flutter/material.dart';
import 'package:tut/core/app_manager/strings_manager.dart';
import 'package:tut/core/app_manager/values_manager.dart';
import 'package:tut/core/di/di.dart';
import 'package:tut/features/store_details/domain/entities/store_details.dart';
import 'package:tut/features/store_details/presentation/manager/store_details_viewmodel.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  final StoreDetailsViewModel _viewModel = instance<StoreDetailsViewModel>();

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<StoreDetails>(
        stream: _viewModel.outputStoreDetails,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        },
      ),
    );
  }

  Widget _getContentWidget(StoreDetails? storeDetails) {
    if (storeDetails == null) {
      return Container(); // Or loading indicator
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(storeDetails.name),
          elevation: AppSize.s0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  storeDetails.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 100);
                  },
                ),
              ),
              _getSection(AppStrings.details, storeDetails.details),
              _getSection(AppStrings.services, storeDetails.services),
              _getSection(AppStrings.about, storeDetails.about),
            ],
          ),
        ),
      );
    }
  }

  Widget _getSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.p12,
        left: AppPadding.p28,
        right: AppPadding.p28,
        bottom: AppPadding.p12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p8),
            child: Text(content, style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
