import 'package:flutter/material.dart';
import '../../../extensions/build_context_ext.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final bool filled;
  final String text;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.filled = true,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 0),
        padding: const EdgeInsets.all(16),
        shadowColor: filled ? null: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                )
              : BorderSide.none,
        ),
        elevation: filled ? null : 0,
        backgroundColor: filled ? backgroundColor ?? Theme.of(context).colorScheme.primary : Colors.transparent,
      ),
      onPressed: () {
        if (!isLoading) onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          !isLoading
              ? Text(
                  text,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: textColor,
                  ),
                )
              : SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    strokeWidth: 3.0,
                    color: textColor,
                  ),
                ),
        ],
      ),
    );
  }
}
