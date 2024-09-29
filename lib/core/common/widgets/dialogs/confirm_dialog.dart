import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../buttons/button.dart';
import '../../../resources/color_res.dart';
import 'dart:math' as math;

import '../../../resources/edge_insets_res.dart';

class ConfirmDialog extends StatelessWidget {
  final String message;
  final String? buttonText;
  final VoidCallback? onCancel;
  final bool preventOnCancelDefault;
  final VoidCallback? onOkay;
  final bool preventOnOkayDefault;

  const ConfirmDialog({
    super.key,
    required this.message,
    this.buttonText,
    this.onOkay,
    this.onCancel,
    this.preventOnCancelDefault = false,
    this.preventOnOkayDefault = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsetsRes.ALL12,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                _buildCloseButton(context),
                const Center(
                  child: Icon(
                    Icons.info_outline,
                    size: 80.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsRes.V24.add(EdgeInsetsRes.B16),
              child: Text(message),
            ),
            Row(
              children: [
                Expanded(
                  child: Button(
                    borderColor: ColorRes.SLATE900,
                    filled: false,
                    backgroundColor: ColorRes.TRANSPARENT,
                    text: "Cancel",
                    onPressed: () {
                      if (!preventOnCancelDefault) {
                        Navigator.of(context).pop();
                      }
                      if (onCancel != null) onCancel!();
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Button(
                    text: buttonText ?? "Okay",
                    onPressed: () {
                      if (!preventOnOkayDefault) {
                        Navigator.of(context).pop();
                      }
                      if (onOkay != null) onOkay!();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Align _buildCloseButton(BuildContext context) {
    return Align(
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
    );
  }
}
