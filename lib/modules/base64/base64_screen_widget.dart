import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_toys/modules/base64/base64_provider.dart';
import 'package:super_toys/widgets/page_title.dart';
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
    final input = ref.watch(base64StateProvider.select((s) => s.input));
    final output = ref.watch(base64StateProvider.select((s) => s.output));

    useEffect(() {
      inputController.text = input;
      return () {};
    }, []);

    useEffect(() {
      outputController.text = output;
      return () {};
    }, [output]);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageTitle(title: 'Base64 String Encode/Decode'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const Text('Input'),
          ),
          Expanded(
            child: Textarea(
              controller: inputController,
              onChanged: (value) {
                ref.read(base64StateProvider.notifier).setInput(value);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const Text('Output'),
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
