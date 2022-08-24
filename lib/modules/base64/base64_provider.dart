import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Base64State {
  final String input;
  final String output;
  final bool isEncoding;
  final bool isError;
  Base64State(this.input, this.output, this.isEncoding, this.isError);

  Base64State copyWith({
    String? input,
    String? output,
    bool? isEncoding,
    bool? isError,
  }) {
    return Base64State(
      input ?? this.input,
      output ?? this.output,
      isEncoding ?? this.isEncoding,
      isError ?? this.isError,
    );
  }
}

class Base64StateNotifier extends StateNotifier<Base64State> {
  Base64StateNotifier() : super(Base64State('', '', true, false));

  setInput(String value) {
    state = state.copyWith(input: value, isError: false);
    calcOutput();
  }

  setOutput(String value) {
    state = state.copyWith(output: value, isError: false);
  }

  calcOutput() {
    try {
      String result = state.isEncoding
          ? base64.encode(utf8.encode(state.input))
          : utf8.decode(base64.decode(state.input));
      setOutput(result);
    } catch (e) {
      state = state.copyWith(isError: true);
    }
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
