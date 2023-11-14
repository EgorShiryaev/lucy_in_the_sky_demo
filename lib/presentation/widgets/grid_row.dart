import 'package:flutter/material.dart';

class GridRow extends StatelessWidget {
  final Widget? firstItem;
  final Widget secondItem;
  final Widget thirdItem;
  final bool bottomSafeArea;
  const GridRow({
    super.key,
    this.firstItem,
    required this.secondItem,
    required this.thirdItem,
    this.bottomSafeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 8),
      bottom: bottomSafeArea,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: firstItem ?? const SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: Center(child: secondItem),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: thirdItem,
            ),
          ),
        ],
      ),
    );
  }
}
