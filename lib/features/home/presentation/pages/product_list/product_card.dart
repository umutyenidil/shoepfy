
part of 'page.dart';
class _ProductCard extends StatelessWidget {
  const _ProductCard({
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
                Image.asset(
                  product.assetImage,
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
