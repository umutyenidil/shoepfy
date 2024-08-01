import 'package:shoepfy/core/resources/image_res.dart';
import 'package:shoepfy/core/resources/vector_res.dart';

class StaticBrandEntity {
  final String assetVector;
  final String id;

  const StaticBrandEntity({
    required this.id,
    required this.assetVector,
  });
}

List<StaticBrandEntity> brands = [
  const StaticBrandEntity(
    id: "1",
    assetVector: VectorRes.NIKE,
  ),
  const StaticBrandEntity(
    id: "2",
    assetVector: VectorRes.ADIDAS,
  ),
  const StaticBrandEntity(
    id: "3",
    assetVector: VectorRes.PUMA,
  ),
  const StaticBrandEntity(
    id: "9",
    assetVector: VectorRes.JORDAN,
  ),
];

class StaticBannerEntity {
  final String assetImage;

  const StaticBannerEntity({
    required this.assetImage,
  });
}

List<StaticBannerEntity> banners = [
  const StaticBannerEntity(assetImage: ImageRes.BANNER1),
  const StaticBannerEntity(assetImage: ImageRes.BANNER2),
  const StaticBannerEntity(assetImage: ImageRes.BANNER3),
];

class StaticProductEntity {
  final String assetImage;
  final String name;
  final String price;

  const StaticProductEntity({
    required this.assetImage,
    required this.name,
    required this.price,
  });
}

List<StaticProductEntity> products = [
  const StaticProductEntity(
    assetImage: ImageRes.ADIDAS_BY_STELLA_MCCARTNEY_SPORTSWEAR_AYAKKABI_MOR_IG5968_01_STANDARD_REMOVEBG_PREVIEW,
    name: 'ADIDAS BY STELLA MCCARTNEY',
    price: '4999\$',
  ),
  const StaticProductEntity(
    assetImage: ImageRes.ADIZERO_SELECT_2_0_SIYAH_IG6619_01_STANDARD_REMOVEBG_PREVIEW,
    name: 'ADIZERO SELECT 2.0',
    price: '1999\$',
  ),
  const StaticProductEntity(
    assetImage: ImageRes.GAMECOURT_2_0_TENIS_AYAKKABISI_BEYAZ_IG9568_01_STANDARD_REMOVEBG_PREVIEW,
    name: 'GAMECOURT 2.0',
    price: '3999\$',
  ),
  const StaticProductEntity(
    assetImage: ImageRes.OZELLE_CLOUDFOAM_AYAKKABI_KAHVERENGI_IG5984_01_STANDARD_REMOVEBG_PREVIEW,
    name: 'OZELLE CLOUDFOAM',
    price: '8999\$',
  ),
  const StaticProductEntity(
    assetImage: ImageRes.ADIDAS_BY_STELLA_MCCARTNEY_SPORTSWEAR_AYAKKABI_MOR_IG5968_01_STANDARD_REMOVEBG_PREVIEW,
    name: 'ADIDAS BY STELLA MCCARTNEY',
    price: '4999\$',
  ),
  const StaticProductEntity(
    assetImage: ImageRes.ADIZERO_SELECT_2_0_SIYAH_IG6619_01_STANDARD_REMOVEBG_PREVIEW,
    name: 'ADIZERO SELECT 2.0',
    price: '1999\$',
  ),
  const StaticProductEntity(
    assetImage: ImageRes.GAMECOURT_2_0_TENIS_AYAKKABISI_BEYAZ_IG9568_01_STANDARD_REMOVEBG_PREVIEW,
    name: 'GAMECOURT 2.0',
    price: '3999\$',
  ),
  const StaticProductEntity(
    assetImage: ImageRes.OZELLE_CLOUDFOAM_AYAKKABI_KAHVERENGI_IG5984_01_STANDARD_REMOVEBG_PREVIEW,
    name: 'OZELLE CLOUDFOAM',
    price: '8999\$',
  ),
];
