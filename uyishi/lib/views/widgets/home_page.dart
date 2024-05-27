import 'package:flutter/material.dart';
import 'package:uyishi/utils/app_constants.dart';
import 'package:uyishi/views/screens/home_screens.dart';
import 'package:uyishi/views/screens/lock_screen.dart';

class HomePage extends StatefulWidget {
  final String password;

  const HomePage({super.key, required this.password});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLocked = false;

  void _toggleLock() {
    setState(() {
      _isLocked = true;
    });
  }

  void _unlock(String password) {
    if (password == widget.password) {
      setState(() {
        _isLocked = false;
      });
    }
  }

  void toggleThemeMode(bool isDarkMode) {
    setState(() {
      AppConstants.themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void changeBackgroundImage(String imageUrl) {
    setState(() {
      AppConstants.backgroundImageUrl = imageUrl;
    });
  }

  void changeAppBarColor(String colorName) {
    setState(() {
      switch (colorName.toLowerCase()) {
        case 'red':
          AppConstants.appBarColor = Colors.red;
          break;
        case 'green':
          AppConstants.appBarColor = Colors.green;
          break;
        case 'blue':
          AppConstants.appBarColor = Colors.blue;
          break;
        case 'amber':
          AppConstants.appBarColor = Colors.amber;
          break;
        default:
          AppConstants.appBarColor = Colors.blue; // default color
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLocked
        ? LockScreen(onUnlock: _unlock)
        : Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.lock),
                  onPressed: _toggleLock,
                ),
              ],
            ),
            body: HomeScreen(
              onThemeChanged: toggleThemeMode,
              onBackgroundImageChanged: changeBackgroundImage,
              onAppBarColorChanged: changeAppBarColor,
            ),
          );
  }
}
