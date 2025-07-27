import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/presentation/detail/widgets/product_bottom_sheet.dart';
import 'package:apple_market/presentation/detail/widgets/product_content.dart';
import 'package:apple_market/presentation/detail/widgets/product_image.dart';
import 'package:apple_market/presentation/detail/widgets/user_info.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
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
                    ProductImage(imageName: product.imageName),
                    UserInfo(seller: product.seller, address: product.address),
                    ProductContent(
                      productName: product.productName,
                      productContent: product.productContent,
                    ),
                  ],
                ),
              ),
            ),
            ProductBottomSheet(id: product.id),
          ],
        ),
      ),
    );
  }
}
