import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String? hint;
  final bool isRequired;
  final Function(String? value)? validator;
  final Color? backgroundColor;

  const DateInput({
    super.key,
    this.controller,
    this.type,
    this.hint,
    this.isRequired = true,
    this.validator,
    this.backgroundColor,
  });

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _node = FocusNode();

  @override
  void initState() {
    if (widget.controller != null) {
      _inputController.text = widget.controller!.text;
    }

    super.initState();

    _node.addListener(() async {
      if (_node.hasFocus) {
        DateTime? date = await showDatePicker(
          context: context,
          firstDate: DateTime(0),
          lastDate: DateTime.now(),
        );
        _node.unfocus();

        if (date != null) {
          setState(() {
            _inputController.text = DateFormat.yMd().format(date);
          });
          if (widget.controller != null) {
            widget.controller!.text = date.toIso8601String();
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _node,
      readOnly: true,
      controller: _inputController,
      keyboardType: widget.type,
      validator: (value) {
        if (widget.isRequired) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
        }

        return widget.validator?.call(value);
      },
      maxLines: 1,
      decoration: InputDecoration(
        filled: widget.backgroundColor != null,
        fillColor: widget.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: widget.hint,
        suffixIcon: _inputController.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _inputController.text = '';
                  });
                  if (widget.controller != null) widget.controller!.text = '';
                },
                icon: Transform.rotate(
                  angle: 45 * math.pi / 180,
                  child: const Icon(
                    HugeIcons.strokeRoundedCabinet01,
                  ),
                ),
              )
            : null,
      ),
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
