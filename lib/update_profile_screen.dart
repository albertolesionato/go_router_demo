import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_state.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
                  'Update Profile',
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
                }, child: const Text('Update'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
