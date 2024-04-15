import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecases/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usercase<String, UserSignUpParams> {
  final AuthRepository _authRepository;

  UserSignUp(this._authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await _authRepository.signUp(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({required this.name, required this.email, required this.password});
}
