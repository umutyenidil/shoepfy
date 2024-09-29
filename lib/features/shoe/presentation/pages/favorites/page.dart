import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  static const String path = '/Favorites';

  static route() => MaterialPageRoute(
    builder: (_) => page(),
  );

  static page() => const Favorites();

  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
        ),
        centerTitle: true,
      ),
    );
  }
}
