import 'package:flutter/material.dart';


class FailureView extends StatelessWidget {
  final VoidCallback onPressReload;
  const FailureView({super.key, required this.onPressReload});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Не удалось получить курсы валют'),
          const SizedBox(height: 16),
          IconButton(
            onPressed: onPressReload,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
