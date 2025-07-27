import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
    required this.isPressed,
    required this.isScrollTop,
    required this.scrollToTop,
    required this.toggleIsPressed,
  });

  final bool isPressed;
  final bool isScrollTop;
  final Future<void> Function() scrollToTop;
  final void Function() toggleIsPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isScrollTop ? 0 : 1,
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTapUp: (details) async {
          await scrollToTop();
          toggleIsPressed();
        },
        onTapDown: (details) {
          toggleIsPressed();
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isPressed ? Colors.blueAccent : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Icon(Icons.arrow_upward),
        ),
      ),
    );
  }
}
