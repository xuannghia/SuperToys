import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final Color? activeColor;
  final bool value;
  final void Function(bool) onChanged;
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 24,
      child: Transform.scale(
        scale: 0.6,
        child: CupertinoSwitch(
          activeColor: activeColor ?? Theme.of(context).primaryColor,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
