import 'package:flutter/material.dart';
import 'package:my_chat_app/models/chat_message_entity.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({super.key, required this.onSubmit});

  final messageController = TextEditingController();
  void onSendButtonPressed() {
    final newChatMessage = ChatMessageEntity(
        id: '10023',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: messageController.text,
        author: Author(username: 'lomia')
    );

    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
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
    );
  }
}
