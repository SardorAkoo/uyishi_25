import 'package:flutter/material.dart';
import 'package:uyishi/utils/app_constants.dart';
import 'package:uyishi/views/widgets/home_page.dart';
import 'package:uyishi/views/widgets/password_create.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _password;

  void _setPassword(String password) {
    setState(() {
      _password = password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppConstants.appBarColor,
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.themeMode,
      home: _password == null
          ? PasswordCreatePage(onPasswordSet: _setPassword)
          : HomePage(password: _password!),
    );
  }
}
