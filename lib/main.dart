import 'package:flutter/material.dart';

import 'core/services/services_locator.dart';
import 'core/utils/app_string.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey.shade800,
        primarySwatch: Colors.blue,
      ),
      home: MoviesScreen(),
    );
  }
}
