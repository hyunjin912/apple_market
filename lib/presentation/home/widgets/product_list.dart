import 'package:apple_market/core/formatter.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductItemState();
  }
}

class _ProductItemState extends State<ProductItem> {
  double borderRadius = 10;
  GlobalKey rightBoxKey = GlobalKey();
  double? leftBoxHeight;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final rightBoxContext = rightBoxKey.currentContext;
      final rightBoxRenderBox = rightBoxContext?.findRenderObject();

      setState(() {
        leftBoxHeight = rightBoxRenderBox is RenderBox
            ? rightBoxRenderBox.size.height
            : null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO : 디테일페이지 완성 후 적용하기
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return DetailPage();
        //     },
        //   ),
        // );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 116,
              height: leftBoxHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(
                  'assets/images/sample2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              key: rightBoxKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '김치냉장고',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '인천 계양구 귤현동',
                      style: TextStyle(color: Color(0xffACA6AD)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      Formatter.formatPrice(20000),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Icon(Icons.chat_bubble_outline),
                        Text('2'),
                        SizedBox(width: 9),
                        Icon(Icons.favorite_border),
                        Text('8'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
