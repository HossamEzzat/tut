import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart';

class ForgotPasswordUseCase implements BaseUseCase<String, String> {
  final ForgotPasswordRepository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String email) async {
    return await _repository.forgotPassword(email);
  }
}
