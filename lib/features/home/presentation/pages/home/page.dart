import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shoepfy/core/common/widgets/buttons/huge_icon_button.dart';
import 'package:shoepfy/core/extensions/build_context_ext.dart';
import 'package:shoepfy/core/extensions/widget_ext.dart';
import 'package:shoepfy/core/resources/border_radius_res.dart';
import 'package:shoepfy/core/resources/color_res.dart';
import 'package:shoepfy/core/resources/edge_insets_res.dart';
import 'package:shoepfy/core/resources/image_res.dart';
import 'package:shoepfy/features/home/data/data_sources/static/brands.dart';
import 'package:shoepfy/features/home/presentation/pages/product_list/page.dart';

import '../../widgets/product_card.dart';

part 'app_bar.dart';

part 'brand_list.dart';

part 'carousel.dart';

part 'bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  static const String path = '/HomePage';

  static route() => MaterialPageRoute(
        builder: (_) => page(),
      );

  static page() => const HomePage();

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      extendBody: true,
      body: Column(
        children: [
          const _BrandList().padding(top: 16.0, bottom: 16.0),
          const _Carousel().padding(bottom: 16.0),
          Padding(
            padding: EdgeInsetsRes.H24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrival",
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "see all",
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorRes.GREEN600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsetsRes.H24.add(EdgeInsetsRes.B48),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 24.0);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
    );
  }
}
