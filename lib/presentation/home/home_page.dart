import 'package:apple_market/presentation/home/widgets/product_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE9E2EF),
        centerTitle: false,
        title: Text('르탄동'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('알림 기능은 준비 중입니다.'),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        itemCount: 30,
        itemBuilder: (context, index) {
          return ProductItem();
        },
        separatorBuilder: (context, index) {
          return Divider(height: 30);
        },
      ),
    );
  }
}
