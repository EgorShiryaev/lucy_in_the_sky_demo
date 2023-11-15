import 'package:flutter/material.dart';

import 'custom_safe_area.dart';

class GridRow extends StatelessWidget {
  final Widget? firstItem;
  final Widget secondItem;
  final Widget thirdItem;
  final bool needBottomSafeArea;
  const GridRow({
    super.key,
    this.firstItem,
    required this.secondItem,
    required this.thirdItem,
    this.needBottomSafeArea = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      needBottomSafeArea: needBottomSafeArea,
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
