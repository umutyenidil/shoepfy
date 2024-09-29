part of 'page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HugeIconButton(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            backgroundColor: ColorRes.SLATE200,
            onTap: () {},
          ),
          const Text('Cart',),
          HugeIconButton(
            icon: HugeIcons.strokeRoundedMenu11,
            backgroundColor: ColorRes.SLATE200,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
