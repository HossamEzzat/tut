import 'package:dartz/dartz.dart';
import 'package:tut/core/error/failure.dart';
import 'package:tut/features/login/domain/use_cases/login_usecase.dart'; // Reusing Authentication entity
import 'package:tut/features/register/domain/repositories/register_repository.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final RegisterRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    RegisterUseCaseInput input,
  ) async {
    return await _repository.register(
      RegisterRequest(
        input.userName,
        input.countryMobileCode,
        input.mobileNumber,
        input.email,
        input.password,
        input.profilePicture,
      ),
    );
  }
}

class RegisterUseCaseInput {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterUseCaseInput(
    this.userName,
    this.countryMobileCode,
    this.mobileNumber,
    this.email,
    this.password,
    this.profilePicture,
  );
}

class RegisterRequest {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterRequest(
    this.userName,
    this.countryMobileCode,
    this.mobileNumber,
    this.email,
    this.password,
    this.profilePicture,
  );
}
