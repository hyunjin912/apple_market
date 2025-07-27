import 'package:flutter/material.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({
    super.key,
    required this.productName,
    required this.productContent,
  });

  final String productName;
  final String productContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 18, left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 18),
          Text(productContent, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
