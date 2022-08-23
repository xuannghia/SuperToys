import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondaryButton extends ConsumerWidget {
  final Widget child;
  final void Function()? onPressed;
  const SecondaryButton({super.key, required this.child, this.onPressed});

  @override
  Widget build(BuildContext context, ref) {
    bool isDark = Brightness.dark == Theme.of(context).brightness;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 0.5, color: Colors.grey.shade500),
        primary: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
        onPrimary: isDark ? Colors.grey.shade500 : Colors.grey.shade400,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
