import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100.0),
            child: Column(
              children: [
                Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(onPressed: () {
                  final text = nameController.text;
                  if (nameController.text.isNotEmpty) {
                    appState.data.username = text;
                    context.goNamed('home');
                  }
                }, child: const Text('Enter'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
