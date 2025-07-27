import 'package:apple_market/data/dtos/product_dto.dart';

abstract interface class ProductDataSource {
  Future<List<ProductDto>> fetchProducts();
  Future<void> updateFavorite(String id);
}
