import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';
import '../models/message.dart';

class ChatStateNotifier extends StateNotifier<List<Message>> {
  ChatStateNotifier() : super([]);

  void addUserMessage(String text) {
    final message = Message(id: const Uuid().v4(), text: text, isUser: true);
    state = [...state, message];
  }

  Message createLlmMessage() {
    final message = Message(id: const Uuid().v4(), text: '', isUser: false);
    state = [...state, message];
    return message;
  }

  void appendToMessage(String id, String newText) {
    state = [
      for (final m in state)
        if (m.id == id)
          Message(id: m.id, text: m.text + newText, isUser: m.isUser)
        else
          m,
    ];
  }

  void clearMessages() {
    state = [];
  }
}

final chatProvider = StateNotifierProvider<ChatStateNotifier, List<Message>>((
  ref,
) {
  return ChatStateNotifier();
});
