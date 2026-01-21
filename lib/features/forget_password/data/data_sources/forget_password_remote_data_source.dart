abstract class ForgotPasswordRemoteDataSource {
  Future<String> forgotPassword(String email);
}

class ForgotPasswordRemoteDataSourceImpl
    implements ForgotPasswordRemoteDataSource {
  @override
  Future<String> forgotPassword(String email) async {
    await Future.delayed(const Duration(seconds: 1));
    return "support@example.com"; // return some success message or string
  }
}
