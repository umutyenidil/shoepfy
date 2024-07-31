import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String path = '/HomePage';

  static route() => MaterialPageRoute(
    builder: (_) => page(),
  );

  static page() => const HomePage();

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomePage',
        ),
        centerTitle: true,
      ),
    );
  }
}
