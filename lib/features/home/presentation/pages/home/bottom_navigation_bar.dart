part of 'page.dart';

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar();

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 85,
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: 85,
          child: DecoratedBox(
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              color: ColorRes.BLACK950,
            ),
            child: Padding(
              padding: EdgeInsetsRes.H8,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildIconButton(0, HugeIcons.strokeRoundedHome01),
                  _buildIconButton(1, HugeIcons.strokeRoundedSearch01),
                  _buildIconButton(2, HugeIcons.strokeRoundedFavourite),
                  _buildIconButton(3, HugeIcons.strokeRoundedUser),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(int index, IconData icon) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: Durations.short4,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? ColorRes.GREEN400 : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: HugeIconButton(
          icon: icon,
          iconColor: ColorRes.WHITE,
          backgroundColor: Colors.transparent,
          onTap: () => _onItemTapped(index),
        ),
      ),
    );
  }
}