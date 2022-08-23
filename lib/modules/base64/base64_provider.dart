import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Base64State {
  final String input;
  final String output;
  final bool isEncoding;
  Base64State(this.input, this.output, this.isEncoding);

  Base64State copyWith({String? input, String? output, bool? isEncoding}) {
    return Base64State(
      input ?? this.input,
      output ?? this.output,
      isEncoding ?? this.isEncoding,
    );
  }
}

class Base64StateNotifier extends StateNotifier<Base64State> {
  Base64StateNotifier() : super(Base64State('', '', true));

  setInput(String value) {
    state = state.copyWith(input: value);
    calcOutput();
  }

  setOutput(String value) {
    state = state.copyWith(output: value);
  }

  calcOutput() {
    String result = base64Encode(utf8.encode(state.input));
    setOutput(result);
  }

  setIsEncoding(bool value) {
    state = state.copyWith(isEncoding: value);
    calcOutput();
  }
}

final base64StateProvider =
    StateNotifierProvider<Base64StateNotifier, Base64State>((ref) {
  return Base64StateNotifier();
});
