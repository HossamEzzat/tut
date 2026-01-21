import 'package:tut/features/login/domain/use_cases/login_usecase.dart';

abstract class LoginRemoteDataSource {
  Future<Authentication> login(LoginRequest loginRequest);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<Authentication> login(LoginRequest loginRequest) async {
    // mock api call
    await Future.delayed(const Duration(seconds: 1));
    return Authentication(); // return dummy authentication
  }
}
