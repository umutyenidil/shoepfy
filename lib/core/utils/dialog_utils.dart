import 'package:flutter/material.dart';
import '../common/widgets/dialogs/confirm_dialog.dart';
import '../common/widgets/dialogs/message_dialog.dart';

class DialogUtils {
  DialogUtils._();

  static Future<R> loading<R>({
    required BuildContext context,
    required Future<R> future,
  }) async {
    // Show the loading dialog
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents the user from dismissing the dialog by tapping outside
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Wait for the future to complete
    final result = await future;

    // Dismiss the loading dialog
    Navigator.of(context, rootNavigator: true).pop();

    // Return the result
    return result;
  }

  static void message({
    required BuildContext context,
    required String message,
    String? buttonText,
    VoidCallback? onOkay,
  }) {
    showDialog(
      context: context,
      builder: (context) => MessageDialog(
        message: message,
        buttonText: buttonText,
        onOkay: onOkay,
      ),
    );
  }

  static void confirm({
    required BuildContext context,
    required String message,
    String? buttonText,
    VoidCallback? onCancel,
    VoidCallback? onOkay,
    bool preventOnCancelDefault = false,
    bool preventOnOkayDefault = true,
    VoidCallback? onDismiss,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        onCancel: onCancel,
        preventOnCancelDefault: preventOnCancelDefault,
        preventOnOkayDefault: preventOnOkayDefault,
        message: message,
        buttonText: buttonText,
        onOkay: onOkay,
      ),
    );
    if (onDismiss != null) onDismiss();
  }
}
