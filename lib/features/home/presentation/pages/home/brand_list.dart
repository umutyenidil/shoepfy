part of 'page.dart';


class _BrandList extends StatelessWidget {
  const _BrandList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: EdgeInsetsRes.H24,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return Hero(
            tag: brand.assetVector,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(ProductListPage.route(
                  assetVector: brand.assetVector,
                ),);
              },
              child: DecoratedBox(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: ColorRes.SLATE200,
                ),
                child: SizedBox.square(
                  dimension: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      brand.assetVector,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(width: 24.0);
        },
        itemCount: brands.length,
      ),
    );
  }
}
