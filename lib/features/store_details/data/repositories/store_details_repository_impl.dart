import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/store_details/data/data_sources/store_details_remote_data_source.dart';
import 'package:tut/features/store_details/domain/entities/store_details.dart';
import 'package:tut/features/store_details/domain/repositories/store_details_repository.dart';

class StoreDetailsRepositoryImpl implements StoreDetailsRepository {
  final StoreDetailsRemoteDataSource _remoteDataSource;

  StoreDetailsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() async {
    try {
      final response = await _remoteDataSource.getStoreDetails();
      return Right(response);
    } catch (error) {
      return Left(Failure(400, "error logic"));
    }
  }
}
