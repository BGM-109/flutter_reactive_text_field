import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_form/app/features/reactive_text_field.dart';
import 'package:reactive_form/app/features/sign_in_controller.dart';
import 'package:reactive_form/app/features/validate_serivce.dart';
import 'package:rxdart/rxdart.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});
  static const String routeName = "login";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = useMemoized(() => BehaviorSubject<String>());
    final passwordSubject = useMemoized(() => BehaviorSubject<String>());
    useEffect(() => subject.close, []);
    useEffect(() => passwordSubject.close, []);
    final combined =
        Rx.combineLatest2(subject, passwordSubject, (a, b) => true);

    final buttonController = ref.watch(signInControllerProvider);
    final service = ref.read(validateServiceProvider);
    void onSubmit() {
      if (buttonController.isLoading) return;

      ref.read(signInControllerProvider.notifier).signIn(
          context: context,
          username: subject.value,
          password: passwordSubject.value,
          onSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    '😊 Login Success! username : ${subject.value} password ${passwordSubject.value}')));
          });
    }

    const space = SizedBox(
      height: 20,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Reactive Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReactiveTextField(
                subject: subject,
                decoration: const InputDecoration(hintText: 'Username'),
                textInputAction: TextInputAction.next,
                onChanged: (String value) {
                  final valid = service.idValidate(value);
                  if (valid != null) {
                    subject.sink.addError(valid);
                  } else {
                    subject.sink.add(value);
                  }
                },
              ),
              space,
              ReactiveTextField(
                subject: passwordSubject,
                decoration: const InputDecoration(hintText: 'Password'),
                textInputAction: TextInputAction.done,
                onSubmitted: (t) {
                  onSubmit();
                },
                onChanged: (String value) {
                  final valid = service.passwordvalidate(value);
                  if (valid != null) {
                    passwordSubject.sink.addError(valid);
                  } else {
                    passwordSubject.sink.add(value);
                  }
                },
              ),
              space,
              StreamBuilder(
                  stream: combined,
                  builder: (context, snapshot) {
                    final isCompleted = snapshot.data;
                    return ElevatedButton(
                        onPressed: isCompleted != true ? null : onSubmit,
                        child: buttonController.isLoading
                            ? const CircularProgressIndicator()
                            : const Text("Login"));
                  })
            ],
          ),
        ));
  }
}
