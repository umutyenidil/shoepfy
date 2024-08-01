import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shoepfy/core/common/widgets/buttons/huge_icon_button.dart';
import 'package:shoepfy/core/extensions/build_context_ext.dart';
import 'package:shoepfy/core/extensions/widget_ext.dart';
import 'package:shoepfy/core/resources/border_radius_res.dart';
import 'package:shoepfy/core/resources/color_res.dart';
import 'package:shoepfy/core/resources/edge_insets_res.dart';
import 'package:shoepfy/features/home/data/data_sources/static/brands.dart';
import 'dart:math' as math;

part 'gallery.dart';

class ProductDetail extends StatelessWidget {
  static const String path = '/ProductDetail';

  static route({
    required StaticProductEntity product,
  }) =>
      MaterialPageRoute(
        builder: (_) => page(product: product),
      );

  static page({
    required StaticProductEntity product,
  }) =>
      ProductDetail(
        product: product,
      );

  final StaticProductEntity product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _Gallery(product).padding(bottom: 16.0),
            Padding(
              padding: EdgeInsetsRes.H24,
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: context.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: HugeIconButton(
                            icon: HugeIcons.strokeRoundedFavourite,
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      product.price,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1.0,
        color: ColorRes.WHITE,
        child: Row(
          children: [
            HugeIconButton(
              icon: HugeIcons.strokeRoundedBubbleChat,
              borderColor: ColorRes.GREEN600,
              iconColor: ColorRes.GREEN600,
              onTap: () {},
            ).padding(right: 4.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: ColorRes.GREEN600,
                  ),
                ),
                backgroundColor: ColorRes.TRANSPARENT,
                shadowColor: ColorRes.TRANSPARENT,
                minimumSize: const Size(0, 48),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedShoppingBasketAdd01,
                    color: ColorRes.GREEN600,
                  ).padding(right: 12.0),
                  Text(
                    "Add to Cart",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: ColorRes.GREEN600,
                    ),
                  ),
                ],
              ),
            ).padding(right: 4.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: ColorRes.GREEN600,
                  shadowColor: ColorRes.TRANSPARENT,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  "Buy Now",
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: ColorRes.WHITE,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
