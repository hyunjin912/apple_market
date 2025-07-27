import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/domain/repositories/product_repository.dart';

class FetchProductsUseCase {
  final ProductRepository repository;

  FetchProductsUseCase(this.repository);

  Future<List<Product>> execute() async {
    return await repository.fetchProducts();
  }
}
