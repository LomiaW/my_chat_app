import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  final messageController = TextEditingController();
  void onSendButtonPressed() {
    print('Chat message: ${messageController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
                Icons.add,
                color: Colors.white
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              minLines: 1,
              controller: messageController,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.grey),
              ),
          )),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: const Icon(
                Icons.send,
                color: Colors.white
            ),
          ),
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }
}
