import 'package:flutter/material.dart';
import 'package:my_chat_app/models/chat_message_entity.dart';
import 'package:my_chat_app/widgets/picker_body.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;

  const ChatInput({super.key, required this.onSubmit});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final messageController = TextEditingController();

  String _selectedImageUrl = '';

  void onSendButtonPressed() {
    final newChatMessage = ChatMessageEntity(
        id: '10023',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: messageController.text,
        author: Author(username: 'lomia')
    );

    if(_selectedImageUrl.isNotEmpty) {
      newChatMessage.imageUrl = _selectedImageUrl;
    }

    widget.onSubmit(newChatMessage);

    messageController.clear();
    _selectedImageUrl = '';

    setState(() {});
  }

  void onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return NetworkImagePickerBody(onImageSelected: onImagePicked);
                });
              },
            icon: const Icon(
                Icons.add,
                color: Colors.white
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
                ),
                if (_selectedImageUrl.isNotEmpty)
                  Image.network(_selectedImageUrl, height: 60,),
              ],
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
