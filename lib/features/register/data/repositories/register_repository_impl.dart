import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart';
import 'package:tut/features/register/data/data_sources/register_remote_data_source.dart';
import 'package:tut/features/register/domain/repositories/register_repository.dart';
import 'package:tut/features/register/domain/use_cases/register_usecase.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource _remoteDataSource;

  RegisterRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final response = await _remoteDataSource.register(registerRequest);
      return Right(response);
    } catch (error) {
      return Left(Failure(400, "error logic"));
    }
  }
}
