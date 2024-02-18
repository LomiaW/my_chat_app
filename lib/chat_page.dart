import 'package:flutter/material.dart';
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
              itemCount: 5,
              itemBuilder: (context, index) {
                return ChatBubble(
                  message: 'Your message',
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