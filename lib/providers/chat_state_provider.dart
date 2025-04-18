import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'chat_state_provider.g.dart';

class ChatMessage {
  final String id;
  final String role;
  final List<Part> content;

  ChatMessage({required this.id, required this.role, required this.content});

  bool get isUser => role == 'user';

  String get text {
    final part = content.firstWhere(
      (e) => e is TextPart,
      orElse: () => TextPart(''),
    );
    return (part as TextPart).text;
  }
}

@riverpod
class ChatStateNotifier extends _$ChatStateNotifier {
  @override
  List<ChatMessage> build() => [];

  void addUserMessage(String text) {
    final message = ChatMessage(
      id: const Uuid().v4(),
      role: 'user',
      content: [TextPart(text)],
    );
    state = [...state, message];
  }

  ChatMessage createLlmMessage() {
    final msg = ChatMessage(
      id: const Uuid().v4(),
      role: 'assistant',
      content: [],
    );
    state = [...state, msg];
    return msg;
  }

  void appendToMessage(String id, String text) {
    state = [
      for (final m in state)
        if (m.id == id)
          ChatMessage(
            id: m.id,
            role: m.role,
            content: [TextPart(m.text + text)],
          )
        else
          m,
    ];
  }

  void finalizeMessage(String id) {
    // Optional: mark message as complete, if you add that support later
  }
}
