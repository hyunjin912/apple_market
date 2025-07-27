import 'package:apple_market/core/formatter.dart';
import 'package:apple_market/presentation/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductBottomSheet extends ConsumerWidget {
  const ProductBottomSheet({
    super.key,
    required this.id,
    required this.isFavorite,
    required this.price,
    required this.toggleIsFavorite,
  });

  final String id;
  final bool isFavorite;
  final String price;
  final void Function() toggleIsFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: toggleIsFavorite,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Color(0xffFF3B30) : Color(0xff939393),
              ),
            ),
            Text(
              Formatter.formatPrice(int.parse(price)),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 100,
              height: 55,
              child: CustomButton(text: '채팅하기', onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
