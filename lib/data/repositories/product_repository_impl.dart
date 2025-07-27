import 'package:apple_market/data/data_sources/product_data_source.dart';
import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl(this.dataSource);

  @override
  Future<List<Product>> fetchProducts() async {
    final productDtoList = await dataSource.fetchProducts();
    return productDtoList
        .map(
          (dto) => Product(
            id: dto.id,
            imageName: dto.imageName,
            productName: dto.productName,
            productContent: dto.productContent,
            seller: dto.seller,
            price: dto.price,
            address: dto.address,
            favorite: dto.favorite,
            chat: dto.chat,
          ),
        )
        .toList();
  }
}
