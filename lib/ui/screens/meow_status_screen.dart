import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/gemini_chat_service.dart';
import '../../providers/chat_state_provider.dart';
import '../../models/message.dart';

class MeowStatusScreen extends ConsumerStatefulWidget {
  const MeowStatusScreen({super.key});

  @override
  ConsumerState<MeowStatusScreen> createState() => _MeowStatusScreenState();
}

class _MeowStatusScreenState extends ConsumerState<MeowStatusScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() async {
    final text = _controller.text.trim();
    print('[DEBUG] Texto digitado: $text');
    if (text.isEmpty) return;

    _controller.clear();

    final chatService = ref.read(geminiChatServiceProvider);
    try {
      await chatService.sendMessage(text);
      await Future.delayed(const Duration(milliseconds: 100));
      _scrollToBottom();
    } catch (e) {
      ref
          .read(chatStateNotifierProvider.notifier)
          .addUserMessage('Erro ao se comunicar com o Meow 😿');
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatStateNotifierProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F0),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade100,
        title: const Text('Meow Status 😺'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message.isUser;

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          isUser
                              ? Colors.deepPurple[100]
                              : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message.text,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 8,
              top: 4,
              bottom: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: InputDecoration(
                      hintText: 'Me conta como você tá hoje...',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.deepPurple),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
