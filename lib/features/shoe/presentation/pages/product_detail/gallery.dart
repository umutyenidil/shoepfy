part of 'page.dart';

class _Gallery extends StatelessWidget {
  final StaticProductEntity product;

  const _Gallery(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsRes.H24.add(EdgeInsetsRes.B16),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusRes.CIRCULAR16,
                  color: ColorRes.SLATE200,
                ),
                child: Hero(
                  tag: product.assetImage,

                  child: Image.asset(
                    product.assetImage,
                  ),
                ),
              ),
              Positioned(
                left: 4,
                right: 4,
                top: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 0.9,
                      child: HugeIconButton(
                        icon: HugeIcons.strokeRoundedArrowLeft01,
                        borderColor: ColorRes.SLATE300,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Transform.scale(
                      scale: 0.9,
                      child: HugeIconButton(
                        icon: HugeIcons.strokeRoundedMenu09,
                        borderColor: ColorRes.SLATE300,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 80,
          child: ListView.separated(
            padding: EdgeInsetsRes.H24,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final selected = index == 0;
              return SizedBox.square(
                dimension: 80.0,
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    color: ColorRes.SLATE200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusRes.CIRCULAR12,
                      side: selected
                          ? const BorderSide(
                              color: ColorRes.GREEN600,
                            )
                          : BorderSide.none,
                    ),
                  ),
                  child: Image.asset(product.assetImage),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 16.0,
              );
            },
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
