import 'package:tut/features/store_details/domain/entities/store_details.dart';

abstract class StoreDetailsRemoteDataSource {
  Future<StoreDetails> getStoreDetails();
}

class StoreDetailsRemoteDataSourceImpl implements StoreDetailsRemoteDataSource {
  @override
  Future<StoreDetails> getStoreDetails() async {
    // mock api call
    await Future.delayed(const Duration(seconds: 1));
    return StoreDetails(
      1,
      "Store 1",
      "Address 1",
      "image1.png",
      "Details 1",
      "Services 1",
      "About 1",
    );
  }
}
