import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/presentation/detail/view_models/detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailViewModelProvider = NotifierProvider.autoDispose
    .family<DetailViewModel, Product, Product>(() => DetailViewModel());
