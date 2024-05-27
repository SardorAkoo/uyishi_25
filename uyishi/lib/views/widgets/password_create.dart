import 'package:flutter/material.dart';

class PasswordCreatePage extends StatefulWidget {
  final ValueChanged<String> onPasswordSet;

  const PasswordCreatePage({super.key, required this.onPasswordSet});

  @override
  State<PasswordCreatePage> createState() => _PasswordCreatePageState();
}

class _PasswordCreatePageState extends State<PasswordCreatePage> {
  final _passwordController = TextEditingController();

  void _setPassword() {
    if (_passwordController.text.isNotEmpty) {
      widget.onPasswordSet(_passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password Save',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _setPassword,
              child: const Text('Password Save'),
            ),
          ],
        ),
      ),
    );
  }
}
