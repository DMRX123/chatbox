import 'package:flutter/material.dart';
import 'package:chatbox/widgets/common/bottom_nav_bar.dart';
import 'package:chatbox/widgets/chat/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ChatBubble(
            message: 'Sample message \$index',
            isMe: index % 2 == 0,
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}