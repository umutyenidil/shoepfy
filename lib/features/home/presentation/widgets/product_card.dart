import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shoepfy/core/common/widgets/buttons/huge_icon_button.dart';
import 'package:shoepfy/core/extensions/build_context_ext.dart';
import 'package:shoepfy/core/extensions/widget_ext.dart';
import 'package:shoepfy/core/resources/border_radius_res.dart';
import 'package:shoepfy/core/resources/color_res.dart';
import 'package:shoepfy/features/home/data/data_sources/static/brands.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final StaticProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          DecoratedBox(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusRes.CIRCULAR16,
              ),
              color: ColorRes.SLATE200,
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    product.assetImage,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: -2,
                  child: Transform.scale(
                    scale: 0.75,
                    child: HugeIconButton(
                      icon: HugeIcons.strokeRoundedFavourite,
                      iconColor: ColorRes.RED500,
                      backgroundColor: ColorRes.WHITE,
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ).padding(bottom: 4.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodySmall,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              product.price,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
