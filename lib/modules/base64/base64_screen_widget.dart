import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_toys/modules/base64/base64_provider.dart';
import 'package:super_toys/widgets/label_radio.dart';
import 'package:super_toys/widgets/page_title.dart';
import 'package:super_toys/widgets/secondary_button.dart';
import 'package:super_toys/widgets/textarea.dart';

class Base64Screen extends StatefulHookConsumerWidget {
  const Base64Screen({super.key});

  @override
  Base64ScreenState createState() => Base64ScreenState();
}

class Base64ScreenState extends ConsumerState<Base64Screen> {
  @override
  Widget build(BuildContext context) {
    final inputController = useTextEditingController();
    final outputController = useTextEditingController();
    final isEncoding =
        ref.watch(base64StateProvider.select((s) => s.isEncoding));
    final input = ref.watch(base64StateProvider.select((s) => s.input));
    final output = ref.watch(base64StateProvider.select((s) => s.output));
    final isError = ref.watch(base64StateProvider.select((s) => s.isError));
    final setInput = ref.read(base64StateProvider.notifier).setInput;
    final setIsEncoding = ref.read(base64StateProvider.notifier).setIsEncoding;

    useEffect(() {
      inputController.text = input;
      return () {};
    }, []);

    useEffect(() {
      outputController.text = output;
      return () {};
    }, [output]);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageTitle(title: 'Base64 String Encode/Decode'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Input'),
                Wrap(
                  spacing: 4,
                  children: [
                    SecondaryButton(
                      onPressed: () {
                        Clipboard.getData(Clipboard.kTextPlain).then((value) {
                          inputController.text = value?.text ?? '';
                          setInput(value?.text ?? '');
                        });
                      },
                      leading: const Icon(
                        Icons.paste_rounded,
                        size: 16,
                      ),
                      child: const Text(
                        'Paste',
                      ),
                    ),
                    SecondaryButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: inputController.text),
                        );
                      },
                      leading: const Icon(
                        Icons.copy,
                        size: 16,
                      ),
                      child: const Text(
                        'Copy',
                      ),
                    ),
                    SecondaryButton(
                      onPressed: () {
                        Clipboard.getData(Clipboard.kTextPlain).then((value) {
                          inputController.text = '';
                          setInput('');
                        });
                      },
                      leading: const Icon(
                        CupertinoIcons.clear,
                        size: 16,
                      ),
                      child: const Text(
                        'Clear',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Textarea(
              controller: inputController,
              onChanged: (value) {
                setInput(value);
              },
              decoration: InputDecoration(
                errorText: isError ? 'Invalid input' : null,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: LabelRadio(
                    value: true,
                    groupValue: isEncoding,
                    label: const Text('Encode'),
                    onChanged: (Object? value) {
                      setIsEncoding(value == true);
                    },
                  ),
                ),
                LabelRadio(
                  value: false,
                  groupValue: isEncoding,
                  label: const Text('Decode'),
                  onChanged: (Object? value) {
                    setIsEncoding(value == true);
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Output'),
                Wrap(
                  spacing: 4,
                  children: [
                    SecondaryButton(
                      onPressed: () {
                        inputController.text = outputController.text;
                        setInput(outputController.text);
                      },
                      leading: const Icon(
                        CupertinoIcons.arrow_up,
                        size: 16,
                      ),
                      child: const Text(
                        'Use as input',
                      ),
                    ),
                    SecondaryButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: outputController.text),
                        );
                      },
                      leading: const Icon(
                        Icons.copy,
                        size: 16,
                      ),
                      child: const Text(
                        'Copy',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Textarea(
              readOnly: true,
              controller: outputController,
            ),
          )
        ],
      ),
    );
  }
}
