import 'package:flutter/material.dart';
import 'package:uyishi/views/screens/home_screens.dart';
import 'package:uyishi/views/screens/settings_screens.dart';
import 'package:uyishi/views/screens/pin_screens.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<String> onAppBarColorChanged;

  const CustomDrawer({
    Key? key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Mehmonxonalar"),
                Text("MENYU"),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen(
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                      onAppBarColorChanged: onAppBarColorChanged,
                    );
                  },
                ),
              );
            },
            title: const Text("Bosh sahifa"),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                      onAppBarColorChanged: onAppBarColorChanged,
                    );
                  },
                ),
              );
            },
            title: const Text("Sozlamalar"),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return PinScreens(
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                      onAppBarColorChanged: onAppBarColorChanged,
                    );
                  },
                ),
              );
            },
            title: const Text("Parol"),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
