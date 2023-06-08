import 'package:flutter/material.dart';
import 'package:reactive_form/app/features/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(
      {required BuildContext context,
      required String username,
      required String password,
      required VoidCallback onSuccess}) async {
    state = const AsyncLoading();

    final repository = ref.read(authRepositoryProvider);

    state = await AsyncValue.guard(
        () => repository.signIn(username: username, password: password));

    if (state is AsyncData) {
      onSuccess();
    }
  }
}
