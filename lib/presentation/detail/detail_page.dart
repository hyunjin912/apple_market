import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/presentation/detail/widgets/product_bottom_sheet.dart';
import 'package:apple_market/presentation/detail/widgets/product_content.dart';
import 'package:apple_market/presentation/detail/widgets/product_image.dart';
import 'package:apple_market/presentation/detail/widgets/user_info.dart';
import 'package:apple_market/provider/detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailViewModelProvider(product));
    final detailViewModel = ref.watch(
      detailViewModelProvider(product).notifier,
    );

    return Scaffold(
      backgroundColor: Color(0xffFFF7FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text('상품 상세'),
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductImage(imageName: detailState.imageName),
                    UserInfo(
                      seller: detailState.seller,
                      address: detailState.address,
                    ),
                    ProductContent(
                      productName: detailState.productName,
                      productContent: detailState.productContent,
                    ),
                  ],
                ),
              ),
            ),
            ProductBottomSheet(
              id: detailState.id,
              isFavorite: detailState.isFavorite,
              price: detailState.price,
              toggleIsFavorite: detailViewModel.toggleIsFavorite,
            ),
          ],
        ),
      ),
    );
  }
}
