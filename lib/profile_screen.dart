import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('ProfileScreen'),
          ElevatedButton(onPressed: (){
            context.goNamed('update-profile');
          }, child: const Text('Update profile'))
        ],
      ),
    );
  }
}
