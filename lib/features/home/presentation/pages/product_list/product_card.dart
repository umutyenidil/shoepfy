part of 'page.dart';

class _ProductCard extends StatefulWidget {
  const _ProductCard({
    required this.product,
  });

  final StaticProductEntity product;

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _heroEnabled = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _heroEnabled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
     onPopInvoked: (_){
       setState(() {
         _heroEnabled = false;
       });
     },
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(ProductDetail.route(product: widget.product));
        },
        child: SizedBox(
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
                    HeroMode(
                      enabled: _heroEnabled,
                      child: Hero(
                        tag: widget.product.assetImage,
                        child: Image.asset(
                          widget.product.assetImage,
                        ),
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
                  widget.product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.product.price,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
