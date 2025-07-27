import 'package:apple_market/core/formatter.dart';
import 'package:apple_market/presentation/common/custom_button.dart';
import 'package:apple_market/provider/detail_provider.dart';
import 'package:apple_market/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductBottomSheet extends ConsumerStatefulWidget {
  const ProductBottomSheet({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ProductBottomSheet> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends ConsumerState<ProductBottomSheet> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(isFavoriteProvider);

    return Container(
      color: Colors.white,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                ref.read(isFavoriteProvider.notifier).state = !isFavorite;
                print(isFavorite);
                // ref
                //     .read(homeViewModelProvider.notifier)
                //     .toggleFavorite(widget.id, isFavorite);
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Color(0xffFF3B30) : Color(0xff939393),
              ),
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
