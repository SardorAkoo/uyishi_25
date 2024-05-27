import 'package:flutter/material.dart';

class LockScreen extends StatelessWidget {
  final ValueChanged<String> onUnlock;

  const LockScreen({super.key, required this.onUnlock});

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Unlock Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onUnlock(_controller.text);
              },
              child: const Text('Unlock'),
            ),
          ],
        ),
      ),
    );
  }
}
