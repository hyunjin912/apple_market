import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/provider/home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    return fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    // 로딩이 너무 짧으면 오류인 것처럼 보이므로 일부러 딜레이 추가
    await Future.delayed(const Duration(seconds: 2));
    final fetchProductsUseCase = ref.read(fetchProductUsecaseProvider);

    return fetchProductsUseCase.execute();
  }
}
