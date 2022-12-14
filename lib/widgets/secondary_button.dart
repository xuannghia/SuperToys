import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondaryButton extends ConsumerWidget {
  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final double? spacing;
  final void Function()? onPressed;
  const SecondaryButton({
    super.key,
    required this.child,
    this.onPressed,
    this.leading,
    this.trailing,
    this.spacing,
  });

  @override
  Widget build(BuildContext context, ref) {
    bool isDark = Brightness.dark == Theme.of(context).brightness;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: BorderSide(
            width: 0.5,
            color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
        primary: isDark ? Colors.black12 : Colors.grey.shade100,
        onPrimary: Theme.of(context).textTheme.bodyLarge?.color,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (leading != null) leading!,
          if (leading != null) const SizedBox(width: 4),
          child,
          if (trailing != null) const SizedBox(width: 4),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
