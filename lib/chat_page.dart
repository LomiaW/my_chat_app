import 'package:flutter/material.dart';
import 'package:my_chat_app/models/chat_message_entity.dart';
import 'package:my_chat_app/widgets/chat_bubble.dart';
import 'package:my_chat_app/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $username!'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ChatBubble(
                  entity: ChatMessageEntity(
                    id: '1234',
                    text: 'Hello this is Mia123.',
                    createdAt: DateTime.now().millisecondsSinceEpoch,
                    author: Author(username: 'Mia123'),
                  ),
                  alignment: index % 2 == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight
                );
            }),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
