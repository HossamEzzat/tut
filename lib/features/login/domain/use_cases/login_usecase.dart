import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/login/domain/repositories/login_repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    LoginUseCaseInput input,
  ) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}

// Minimal definition for BaseUseCase if not exists, otherwise import it.
// I assume it might not exist yet, so I will likely need to create it in core.
// But first, let's just define abstract class here or use direct implementation.
abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

// Placeholder for Authentication entity
class Authentication {
  // token, etc
}

// Request object for Repository
class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}
