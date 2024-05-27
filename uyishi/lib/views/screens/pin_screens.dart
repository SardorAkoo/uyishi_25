import 'package:flutter/material.dart';
import 'package:uyishi/utils/app_constants.dart';
import 'package:uyishi/views/widgets/custom_drawer.dart';

class PinScreens extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<String> onAppBarColorChanged;
  const PinScreens({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
  });

  @override
  State<PinScreens> createState() => _PinScreensState();
}

class _PinScreensState extends State<PinScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parol')),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
        onAppBarColorChanged: widget.onAppBarColorChanged,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: AppConstants.backgroundImageUrl.isEmpty
              ? null
              : DecorationImage(
                  image: NetworkImage(AppConstants.backgroundImageUrl),
                ),
        ),
      ),
    );
  }
}
