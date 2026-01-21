import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, String>> forgotPassword(String email);
}
