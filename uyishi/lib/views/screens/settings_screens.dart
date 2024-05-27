import 'package:flutter/material.dart';
import 'package:uyishi/utils/app_constants.dart';
import 'package:uyishi/views/widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  final ValueChanged<String> onAppBarColorChanged;
  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
    required this.onAppBarColorChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();
  final colorController = TextEditingController();

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sozlamalar"),
        actions: [
          IconButton(
            onPressed: () {
              String imageUrl = imageController.text;
              imageController.clear();
              widget.onBackgroundImageChanged(imageUrl);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
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
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: const Text("Tungi holat"),
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                labelText: 'Background Image URL',
              ),
            ),
            TextField(
              controller: colorController,
              decoration: const InputDecoration(
                labelText:
                    'AppBarning Rangini kiriting (red, green, blue, amber)',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String colorName = colorController.text;
                colorController.clear();
                widget.onAppBarColorChanged(colorName);
              },
              child: const Text('Rangni o\'zgartirish'),
            ),
          ],
        ),
      ),
    );
  }
}
