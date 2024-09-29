import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../buttons/button.dart';
import 'dart:math' as math;

import '../../../resources/edge_insets_res.dart';

class MessageDialog extends StatelessWidget {
  final String message;
  final String? buttonText;
  final VoidCallback? onOkay;

  const MessageDialog({
    super.key,
    required this.message,
    this.buttonText,
    this.onOkay,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsetsRes.ALL8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Transform.rotate(
                  angle: 45 * math.pi / 180,
                  child: const Icon(
                    HugeIcons.strokeRoundedAdobeIllustrator,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsRes.V16.add(EdgeInsetsRes.B16),
              child: Text(message),
            ),
            Button(
              text: buttonText ?? "Ok",
              onPressed: () {
                Navigator.of(context).pop();
                if (onOkay != null) onOkay!();
              },
            ),
          ],
        ),
      ),
    );
  }
}
