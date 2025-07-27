import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageName});

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Image.asset('assets/images/$imageName.png', fit: BoxFit.cover),
    );
  }
}
