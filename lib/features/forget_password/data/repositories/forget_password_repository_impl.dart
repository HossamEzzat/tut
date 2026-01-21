import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/forget_password/data/data_sources/forget_password_remote_data_source.dart';
import 'package:tut/features/forget_password/domain/repositories/forget_password_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordRemoteDataSource _remoteDataSource;

  ForgotPasswordRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    try {
      final response = await _remoteDataSource.forgotPassword(email);
      return Right(response);
    } catch (error) {
      return Left(Failure(400, "error logic"));
    }
  }
}
