import 'package:flutter/material.dart';
import 'screens/home_screens.dart';
import 'screens/sign_in_screens.dart';
import 'screens/sign_up_screens.dart';
import 'screens/tambah_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport App',
      debugShowCheckedModeBanner: false,
      // Menggunakan tema gelap yang modern
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          elevation: 0,
        ),
      ),
      initialRoute: '/signin', // Layar pertama yang muncul
      routes: {
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/tambah': (context) => const TambahScreen(),
      },
    );
  }
}