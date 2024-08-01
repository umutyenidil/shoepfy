import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../resources/color_res.dart';
import '../../../resources/edge_insets_res.dart';

class HugeIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;
  final IconData icon;
  final VoidCallback onTap;

  const HugeIconButton({
    super.key,
    this.backgroundColor,
    this.iconColor,
    required this.icon,
    required this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                )
              : BorderSide.none,
        ),
        padding: EdgeInsetsRes.ALL12,
        minimumSize: const Size(48, 48),
        shadowColor: ColorRes.TRANSPARENT,
        backgroundColor: backgroundColor ?? ColorRes.TRANSPARENT,
      ),
      onPressed: onTap,
      child: HugeIcon(
        icon: icon,
        color: iconColor ?? ColorRes.BLACK950,
      ),
    );
  }
}
