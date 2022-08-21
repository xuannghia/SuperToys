import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Textarea extends HookWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool? readOnly;
  const Textarea(
      {super.key, required this.controller, this.onChanged, this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly ?? false,
      controller: controller,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.top,
      keyboardType: TextInputType.multiline,
      minLines: null,
      maxLines: null,
      expands: true,
    );
  }
}
