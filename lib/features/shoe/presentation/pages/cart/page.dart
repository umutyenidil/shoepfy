import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shoepfy/core/common/widgets/buttons/huge_icon_button.dart';
import 'package:shoepfy/core/resources/border_radius_res.dart';
import 'package:shoepfy/core/resources/color_res.dart';
import 'package:shoepfy/core/resources/edge_insets_res.dart';
import 'package:shoepfy/features/home/data/data_sources/static/brands.dart';

part 'app_bar.dart';

class Cart extends StatelessWidget {
  static const String path = '/Cart';

  static route() => MaterialPageRoute(
        builder: (_) => page(),
      );

  static page() => const Cart();

  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: ListView.separated(
        padding: EdgeInsetsRes.ALL24,
        itemBuilder: (context, index) {
          final product = products[index];
          return Row(
            children: [
              DecoratedBox(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusRes.CIRCULAR16,
                  ),
                  color: ColorRes.SLATE200,
                ),
                child: SizedBox.square(
                  dimension: 128,
                  child: Image.asset(
                    product.assetImage,
                    width: 128,
                    height: 128,
                  ),
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 12,
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
