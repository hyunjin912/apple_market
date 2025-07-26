import 'package:flutter/material.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 18, left: 18, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '프라다 복조리백',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 18),
          Text('까임 오염없고 상태 깨끗합니다\n정품여부모름', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
