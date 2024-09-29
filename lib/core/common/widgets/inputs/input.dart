import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../utils/regexes.dart';

class Input extends StatefulWidget {
  final TextEditingController? controller;
  final int maxLines;
  final TextInputType? type;
  final String? hint;
  final bool obscure;
  final bool isRequired;
  final Function(String? value)? validator;
  final Color? backgroundColor;

  const Input({
    super.key,
    this.controller,
    this.type,
    this.hint,
    this.obscure = false,
    this.isRequired = true,
    this.validator,
    this.backgroundColor,
    this.maxLines = 1,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: widget.obscure && obscure,
      validator: (value) {
        if (widget.isRequired) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          } else if (widget.type == TextInputType.emailAddress) {
            if (!emailRegex.hasMatch(value)) {
              return "Please provide a valid email address";
            }
          }
        }

        return widget.validator?.call(value);
      },
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        filled: widget.backgroundColor != null,
        fillColor: widget.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: widget.hint,
        suffixIcon: !widget.obscure
            ? null
            : IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: Icon(
                  obscure ? HugeIcons.strokeRoundedEye : HugeIcons.strokeRoundedTextItalicSlash,
                ),
              ),
      ),
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
