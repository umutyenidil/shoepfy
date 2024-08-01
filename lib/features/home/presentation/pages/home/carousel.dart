part of 'page.dart';

class _Carousel extends StatelessWidget {
  const _Carousel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CarouselSlider.builder(
        itemCount: banners.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          final banner = banners[itemIndex];
          return ClipRRect(
            borderRadius: BorderRadiusRes.CIRCULAR16,
            child: Image.asset(
              banner.assetImage,
            ),
          );
        },
        options: CarouselOptions(
          height: 150,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
