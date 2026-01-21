import 'package:tut/features/login/domain/use_cases/login_usecase.dart';
import 'package:tut/features/register/domain/use_cases/register_usecase.dart';

abstract class RegisterRemoteDataSource {
  Future<Authentication> register(RegisterRequest registerRequest);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  @override
  Future<Authentication> register(RegisterRequest registerRequest) async {
    // mock api calling
    await Future.delayed(const Duration(seconds: 1));
    return Authentication();
  }
}
