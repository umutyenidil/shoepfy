part of 'page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HugeIconButton(
            icon: HugeIcons.strokeRoundedMenu11,
            backgroundColor: ColorRes.SLATE200,
            onTap: () {},
          ),
          RichText(
            text: TextSpan(
              text: 'Shoe',
              style: context.textTheme.headlineLarge!.copyWith(
                color: ColorRes.SLATE400,
              ),
              children: [
                TextSpan(
                  text: 'pfy',
                  style: context.textTheme.headlineLarge!.copyWith(
                    color: ColorRes.GREEN400,
                  ),
                ),
              ],
            ),
          ),
          HugeIconButton(
            icon: HugeIcons.strokeRoundedShoppingBasket01,
            backgroundColor: ColorRes.SLATE200,
            onTap: () {
              Navigator.of(context).push(Cart.route());
            },
          ),
        ],
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Padding(
          padding: EdgeInsetsRes.H24.add(EdgeInsetsRes.T16),
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
              Row(
                children: [
                  const HugeIcon(
                    icon: HugeIcons.strokeRoundedLocation01,
                    color: ColorRes.GREEN700,
                  ).padding(right: 4.0),
                  Text(
                    "Ship to: ",
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: ColorRes.GREEN700,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "1600 Amphitheatre Parkway Mountain View, CA 94043 United States",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50 + 16 + 24 + 8);
}
