import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart';

abstract class LoginRepository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
