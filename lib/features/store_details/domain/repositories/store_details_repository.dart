import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/store_details/domain/entities/store_details.dart';

abstract class StoreDetailsRepository {
  Future<Either<Failure, StoreDetails>> getStoreDetails();
}
