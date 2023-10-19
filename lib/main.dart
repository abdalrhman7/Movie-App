import 'package:flutter/material.dart';
import 'package:movie_app/core/services/services_locator.dart';

import 'core/utils/app_string.dart';
import 'movies/presentation/view/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
      home: const MainMoviesScreen(),
    );
  }
}


