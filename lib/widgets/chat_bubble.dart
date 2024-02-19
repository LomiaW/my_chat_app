import 'package:flutter/material.dart';
import 'package:my_chat_app/models/chat_message_entity.dart';
import 'package:my_chat_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({super.key, required this.entity, required this.alignment});

  @override
  Widget build(BuildContext context) {
    bool isUser =
        entity.author.username == context.read<AuthService>().getUserName();

    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: isUser ? Theme.of(context).primaryColor : Colors.grey,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(entity.text,
                style: const TextStyle(fontSize: 16, color: Colors.white)),
            if (entity.imageUrl != null)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(entity.imageUrl!)),
                ),
              )
          ],
        ),
      ),
    );
  }
}
