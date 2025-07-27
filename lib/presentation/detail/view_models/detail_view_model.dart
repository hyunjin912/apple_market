import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/provider/home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailViewModel extends AutoDisposeFamilyNotifier<Product, Product> {
  @override
  Product build(Product arg) {
    return arg;
  }

  void toggleIsFavorite() {
    state = state.copyWith(isFavorite: !state.isFavorite);
    ref.read(homeViewModelProvider.notifier).toggleIsFavorite(arg.id);
  }
}
