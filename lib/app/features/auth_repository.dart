import 'package:reactive_form/app/common/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repository.g.dart';

class AuthRepository {
  Future<Result> signIn(
      {required String username, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return const Success('Response 200');
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}
