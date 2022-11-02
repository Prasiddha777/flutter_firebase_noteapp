import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_note_app/screens/auth/login_screen.dart';
import 'package:firebase_note_app/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter NoteApp with Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        // iconTheme: IconThemeData(
        //   color: Colors.black,
        // ),
      ),
      initialRoute: '/loginScreen',
      // home: const SplashScreen(),
      routes: {
        '/loginScreen': (context) => const LoginScreen(),
        '/signUpScreen': (context) => const SignUpScreen(),
      },
    );
  }
}
