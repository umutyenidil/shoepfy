import 'package:flutter/material.dart';
import '../../../extensions/widget_ext.dart';

import '../../../resources/color_res.dart';

enum MessageSnackBarType {
  info,
  success,
  danger,
}

class MessageSnackBar extends SnackBar {
  final MessageSnackBarType type;

  MessageSnackBar({
    super.key,
    required String message,
    this.type = MessageSnackBarType.info,
  }) : super(
          content: Row(
            children: [
              Icon(
                type == MessageSnackBarType.success
                    ? Icons.check_circle_outline
                    : type == MessageSnackBarType.danger
                        ? Icons.cancel_outlined
                        : Icons.info_outline,
                color: type == MessageSnackBarType.success
                    ? ColorRes.GREEN700
                    : type == MessageSnackBarType.danger
                        ? ColorRes.RED700
                        : ColorRes.BLUE700,
                size: 40.0,
              ).padding(right: 8.0),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(12.0),
          behavior: SnackBarBehavior.floating,
          backgroundColor: type == MessageSnackBarType.success
              ? ColorRes.GREEN200
              : type == MessageSnackBarType.danger
                  ? ColorRes.RED200
                  : ColorRes.BLUE200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          showCloseIcon: true,
          closeIconColor: ColorRes.SLATE400,
        );
}
