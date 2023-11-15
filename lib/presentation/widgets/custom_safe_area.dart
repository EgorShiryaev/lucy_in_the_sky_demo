import 'package:flutter/material.dart';

class CustomSafeArea extends StatelessWidget {
  final bool needBottomSafeArea;
  final Widget child;
  const CustomSafeArea({
    super.key,
    required this.child,
    this.needBottomSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: needBottomSafeArea,
      minimum: const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}
