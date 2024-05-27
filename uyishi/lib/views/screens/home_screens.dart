import 'package:flutter/material.dart';
import 'package:uyishi/utils/app_constants.dart';
import 'package:uyishi/views/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<String> onAppBarColorChanged;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        onThemeChanged: onThemeChanged,
        onBackgroundImageChanged: onBackgroundImageChanged,
        onAppBarColorChanged: onAppBarColorChanged,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: AppConstants.backgroundImageUrl.isNotEmpty
              ? DecorationImage(
                  image: NetworkImage(AppConstants.backgroundImageUrl),
                )
              : null,
        ),
      ),
    );
  }
}
