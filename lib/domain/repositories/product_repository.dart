import 'package:apple_market/domain/entities/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> fetchProducts();
}
