import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'validate_serivce.g.dart';

class ValidateService {
  String? idValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some username';
    }
    if (value.length < 8) {
      return 'Username must be at least 8 characters';
    }
    return null;
  }

  String? passwordvalidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}

@Riverpod(keepAlive: true)
ValidateService validateService(ValidateServiceRef ref) {
  return ValidateService();
}
