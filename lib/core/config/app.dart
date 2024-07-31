import 'package:flutter/material.dart';
import 'package:shoepfy/features/home/presentation/pages/home/page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage.page(),
    );
  }
}
