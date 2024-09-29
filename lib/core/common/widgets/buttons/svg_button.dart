import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;

  const SvgButton({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        splashFactory: InkSplash.splashFactory,
        shadowColor: backgroundColor == null ? Colors.transparent : null,
        backgroundColor: backgroundColor ?? Colors.transparent,
        // padding: const EdgeInsets.all(8.0),
      ),
      child: SizedBox.square(
        dimension: 20,
        child: FittedBox(
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              iconColor ?? Theme.of(context).textTheme.bodyMedium!.color ?? Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
