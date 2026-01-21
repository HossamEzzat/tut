import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart';
import 'package:tut/features/store_details/domain/entities/store_details.dart';
import 'package:tut/features/store_details/domain/repositories/store_details_repository.dart';

class StoreDetailsUseCase implements BaseUseCase<void, StoreDetails> {
  final StoreDetailsRepository _repository;

  StoreDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) async {
    return await _repository.getStoreDetails();
  }
}
