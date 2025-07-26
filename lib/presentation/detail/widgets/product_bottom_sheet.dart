import 'package:apple_market/core/formatter.dart';
import 'package:apple_market/presentation/common/custom_button.dart';
import 'package:flutter/material.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.favorite_border, color: Color(0xff939393)),
            ),
            Text(
              Formatter.formatPrice(50000),
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
