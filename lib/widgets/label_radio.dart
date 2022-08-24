import 'package:flutter/material.dart';

class LabelRadio extends StatelessWidget {
  final Object value;
  final Widget label;
  final Object? groupValue;
  final void Function(Object?)? onChanged;

  const LabelRadio({
    super.key,
    required this.value,
    required this.label,
    this.groupValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        GestureDetector(
          onTap: () {
            onChanged?.call(value);
          },
          child: label,
        ),
      ]),
    );
  }
}
