import 'package:flutter/material.dart';

import '../common/widgets/snack_bars/message_snack_bar.dart';

class SnackBarUtils {
  const SnackBarUtils._();

  static void message({
    required BuildContext context,
    required String message,
    MessageSnackBarType type = MessageSnackBarType.info,
  }) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        MessageSnackBar(
          message: message,
          type: type,
        ),
      );
  }
}
