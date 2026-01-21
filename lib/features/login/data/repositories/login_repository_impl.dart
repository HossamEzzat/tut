import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/login/data/data_sources/remote_data_source.dart';
import 'package:tut/features/login/domain/repositories/login_repository.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _remoteDataSource;

  LoginRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
    LoginRequest loginRequest,
  ) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);
      return Right(response);
    } catch (error) {
      // logic for error handling..
      return Left(Failure(400, "error logic"));
    }
  }
}
