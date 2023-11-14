import 'package:flutter/material.dart';

class CustomAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? child;
  const CustomAppBarBottom({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.shade200,
      child: SizedBox.fromSize(
        size: preferredSize,
        child: child,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
