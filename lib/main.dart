import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_todo_app/screens/home.dart';
import 'package:flutter_todo_app/screens/login_register_page.dart';
//import 'package:flutter_todo_app/screens/login_register_page.dart';
import "package:flutter_todo_app/services/auth.dart";
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Auth authService = Auth();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
            stream: authService.authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginRagisterPage();
              }
            }) //home: const LoginRagistePage(),
        );
  }
}
