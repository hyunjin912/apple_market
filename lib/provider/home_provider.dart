import 'package:apple_market/data/data_sources/product_data_source.dart';
import 'package:apple_market/data/data_sources/product_data_source_impl.dart';
import 'package:apple_market/data/repositories/product_repository_impl.dart';
import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/domain/repositories/product_repository.dart';
import 'package:apple_market/domain/use_cases/fetch_products_use_case.dart';
import 'package:apple_market/presentation/home/view_models/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataSourceProvider = Provider<ProductDataSource>(
  (ref) => ProductDataSourceImpl(),
);
final repositoryProvider = Provider<ProductRepository>(
  (ref) => ProductRepositoryImpl(ref.read(dataSourceProvider)),
);
final fetchProductUsecaseProvider = Provider(
  (ref) => FetchProductsUseCase(ref.read(repositoryProvider)),
);
final homeViewModelProvider =
    AsyncNotifierProvider<HomeViewModel, List<Product>>(() => HomeViewModel());
