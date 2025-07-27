import 'package:apple_market/core/formatter.dart';
import 'package:apple_market/domain/entities/product.dart';
import 'package:apple_market/presentation/detail/detail_page.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;
  final double borderRadius = 10;
  final double leftBoxWidth = 116;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(product: product);
            },
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: leftBoxWidth,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(
                  'assets/images/${product.imageName}.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: leftBoxWidth),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.address,
                          style: TextStyle(color: Color(0xffACA6AD)),
                        ),
                        SizedBox(height: 8),
                        Text(
                          Formatter.formatPrice(int.parse(product.price)),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Icon(Icons.chat_bubble_outline),
                            Text(product.chat.toString()),
                            SizedBox(width: 9),
                            Icon(Icons.favorite_border),
                            Text(product.favorite.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
