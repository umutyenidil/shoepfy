import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shoepfy/core/extensions/build_context_ext.dart';

import 'dart:math' as math;

import '../../../resources/edge_insets_res.dart';

class BottomSheetScaffold extends StatelessWidget {
  final String title;
  final Widget? body;

  const BottomSheetScaffold({
    super.key,
    required this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsRes.V8,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      title,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Transform.rotate(
                            angle: 45 * math.pi / 180,
                            child: const Icon(
                              HugeIcons.strokeRoundedAdobeIllustrator,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
