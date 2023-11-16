import 'package:flutter/material.dart';

class FailureView extends StatelessWidget {
  final VoidCallback onPressReload;
  final String message;
  const FailureView({
    super.key,
    required this.onPressReload,
    this.message = 'Не удалось получить курсы валют',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            IconButton(
              onPressed: onPressReload,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
