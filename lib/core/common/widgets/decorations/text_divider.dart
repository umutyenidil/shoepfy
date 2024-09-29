import 'package:flutter/material.dart';

import '../../../resources/edge_insets_res.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsetsRes.H16,
          child: Text(text),
        ),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
