import 'package:flutter/material.dart';
import 'package:reactive_form/app/features/login_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      title: 'Reactive Form',
      home: const LoginView(),
    );
  }
}
