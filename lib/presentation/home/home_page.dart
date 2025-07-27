import 'package:apple_market/presentation/home/widgets/floating_button.dart';
import 'package:apple_market/presentation/home/widgets/product_item.dart';
import 'package:apple_market/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool isPressed = false;
  bool isScrollTop = true;
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncHomeState = ref.watch(homeViewModelProvider);

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
      body: asyncHomeState.when(
        data: (products) {
          return NotificationListener(
            onNotification: (notification) {
              if (notification is ScrollNotification) {
                _toggleIsScrollTop(notification);
              }

              return false;
            },
            child: ListView.separated(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  key: ValueKey(products[index].id),
                  product: products[index],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 30);
              },
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text(error.toString().replaceAll('Exception: ', ''))),
      ),
      floatingActionButton: FloatingButton(
        isPressed: isPressed,
        isScrollTop: isScrollTop,
        scrollToTop: _scrollToTop,
        toggleIsPressed: _toggleIsPressed,
      ),
    );
  }

  void _toggleIsPressed() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  void _toggleIsScrollTop(ScrollNotification notification) {
    if (notification.metrics.pixels <= 0) {
      setState(() {
        isScrollTop = true;
      });
    } else {
      setState(() {
        isScrollTop = false;
      });
    }
  }

  Future<void> _scrollToTop() async {
    await scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
