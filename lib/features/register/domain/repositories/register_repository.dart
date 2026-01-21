import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart';
import 'package:tut/features/register/domain/use_cases/register_usecase.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Authentication>> register(
    RegisterRequest registerRequest,
  );
}
