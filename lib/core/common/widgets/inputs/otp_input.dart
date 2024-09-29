import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../extensions/build_context_ext.dart';
import '../../../resources/border_radius_res.dart';
import '../../../utils/typedefs.dart';
import '../../../resources/color_res.dart';

class OtpInput extends StatefulWidget {
  final ValueCallback<String?> onChange;

  const OtpInput({
    super.key,
    required this.onChange,
  });

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final FocusNode _node1 = FocusNode();
  final FocusNode _node2 = FocusNode();
  final FocusNode _node3 = FocusNode();
  final FocusNode _node4 = FocusNode();
  final FocusNode _node5 = FocusNode();
  final FocusNode _node6 = FocusNode();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  @override
  void dispose() {
    _node1.dispose();
    _node2.dispose();
    _node3.dispose();
    _node4.dispose();
    _node5.dispose();
    _node6.dispose();

    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    _controller6.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _cell(
          node: _node1,
          next: _node2,
          controller: _controller1,
        ),
        _cell(
          prev: _node1,
          node: _node2,
          next: _node3,
          controller: _controller2,
        ),
        _cell(
          prev: _node2,
          node: _node3,
          next: _node4,
          controller: _controller3,
        ),
        _cell(
          prev: _node3,
          node: _node4,
          next: _node5,
          controller: _controller4,
        ),
        _cell(
          prev: _node4,
          node: _node5,
          next: _node6,
          controller: _controller5,
        ),
        _cell(
          last: true,
          prev: _node5,
          node: _node6,
          controller: _controller6,
        ),
      ],
    );
  }

  Widget _cell(
      {bool last = false,
      required FocusNode node,
      FocusNode? prev,
      FocusNode? next,
      required TextEditingController controller}) {
    return SizedBox.square(
      dimension: 50,
      child: TextField(
        focusNode: node,
        controller: controller,
        inputFormatters: [
          LengthLimitingTextInputFormatter(2),
        ],
        onChanged: (value) {
          if (value.length > 1) {
            controller.text = controller.text[1];
          }

          if (_code.length == 6) {
            widget.onChange(_code);
          } else {
            widget.onChange(null);
          }

          if (last) {
            node.unfocus();
          }

          if (value.isNotEmpty) {
            next?.requestFocus();
          }

          if (value.isEmpty) {
            prev?.requestFocus();
          }
        },
        keyboardType: TextInputType.number,
        style: context.textTheme.titleLarge!.copyWith(color: ColorRes.WHITE),
        cursorColor: ColorRes.TRANSPARENT,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counter: null,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadiusRes.CIRCULAR12,
          ),
        ),
      ),
    );
  }

  String get _code {
    return _controller1.text +
        _controller2.text +
        _controller3.text +
        _controller4.text +
        _controller5.text +
        _controller6.text;
  }
}
