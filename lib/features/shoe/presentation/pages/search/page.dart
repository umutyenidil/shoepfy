import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shoepfy/core/common/widgets/buttons/huge_icon_button.dart';
import 'package:shoepfy/core/extensions/widget_ext.dart';
import 'package:shoepfy/core/resources/color_res.dart';
import 'package:shoepfy/core/resources/edge_insets_res.dart';

class Search extends StatelessWidget {
  static const String path = '/Search';

  static route() => MaterialPageRoute(
        builder: (_) => page(),
      );

  static page() => const Search();

  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsRes.H16,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: HugeIconButton(
                      icon: HugeIcons.strokeRoundedSearch01,
                      onTap: () {},
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                    fillColor: ColorRes.SLATE200,
                    filled: true,
                    hintText: 'What are you looking for?'),
              ).padding(bottom: 8.0),
              const Expanded(
                child: Center(
                  child: Text("No items"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
