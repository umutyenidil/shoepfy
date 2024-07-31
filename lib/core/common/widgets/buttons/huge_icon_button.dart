import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../resources/color_res.dart';
import '../../../resources/edge_insets_res.dart';

class HugeIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData icon;
  final VoidCallback onTap;

  const HugeIconButton({
    super.key,
    this.backgroundColor,
    this.iconColor,
    required this.icon, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsetsRes.ALL12,
        // minimumSize: const Size(48 ,48),
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
