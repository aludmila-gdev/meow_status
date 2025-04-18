import 'package:flutter/material.dart';
import '../widgets/chat/chat_input.dart';
import '../widgets/chat/messages_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meow Status 🐱')),
      body: Column(
        children: const [
          Expanded(child: MessagesList()),
          Padding(padding: EdgeInsets.all(8.0), child: ChatInput()),
        ],
      ),
    );
  }
}
