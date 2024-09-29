import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const String path = '/Profile';

  static route() => MaterialPageRoute(
    builder: (_) => page(),
  );

  static page() => const Profile();

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
        centerTitle: true,
      ),
    );
  }
}
