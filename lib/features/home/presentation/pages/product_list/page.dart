import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shoepfy/core/common/widgets/buttons/huge_icon_button.dart';
import 'package:shoepfy/core/extensions/build_context_ext.dart';
import 'package:shoepfy/core/extensions/widget_ext.dart';
import 'package:shoepfy/core/resources/border_radius_res.dart';
import 'package:shoepfy/core/resources/color_res.dart';
import 'package:shoepfy/core/resources/edge_insets_res.dart';
import 'package:shoepfy/features/home/data/data_sources/static/brands.dart';

part 'product_card.dart';

class ProductListPage extends StatelessWidget {
  static const String path = '/ProductListPage';

  static route({
    required String assetVector,
  }) =>
      MaterialPageRoute(
        builder: (_) => page(
          assetVector: assetVector,
        ),
      );

  static page({
    required String assetVector,
  }) =>
      ProductListPage(
        assetVector: assetVector,
      );

  final String assetVector;

  const ProductListPage({
    super.key,
    required this.assetVector,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.SLATE200,
        title: Hero(
          tag: assetVector,
          child: SizedBox.square(
            dimension: 40,
            child: SvgPicture.asset(
              assetVector,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsetsRes.H24.add(EdgeInsetsRes.T16),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          mainAxisExtent: 210,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return _ProductCard(product: product);
        },
      ),
    );
  }
}


