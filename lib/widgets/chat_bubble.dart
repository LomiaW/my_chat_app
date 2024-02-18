import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final Alignment alignment;
  const ChatBubble({super.key, required this.message, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                message,
                style: const TextStyle(fontSize: 20, color: Colors.white)
            ),
            Image.asset(
              'assets/login_image.jpg',
              height: 100,
            )
          ],
        ),
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            )
        ),
      ),
    );
  }
}
