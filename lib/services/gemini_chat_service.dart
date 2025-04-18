import 'dart:async';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/gemini.dart';
import '../providers/chat_state_provider.dart';

part 'gemini_chat_service.g.dart';

class GeminiChatService {
  GeminiChatService(this.ref);
  final Ref ref;

  Future<void> sendMessage(String message) async {
    print('[SERVICE] Entrando no sendMessage');

    final chatSession = await ref.read(chatSessionProvider.future);
    final chatStateNotifier = ref.read(chatStateNotifierProvider.notifier);

    chatStateNotifier.addUserMessage(message);
    final llmMessage = chatStateNotifier.createLlmMessage();

    try {
      print('[SERVICE] Enviando para Gemini...');
      final response = await chatSession.sendMessage(Content.text(message));

      for (final candidate in response.candidates) {
        for (final part in candidate.content.parts) {
          print('[DEBUG] Part type: ${part.runtimeType}');
          if (part is TextPart) {
            print('[DEBUG] Text part: ${part.text}');
            chatStateNotifier.appendToMessage(llmMessage.id, part.text);
          }
        }
      }
    } catch (e, st) {
      print('[SERVICE ERROR] Erro ao enviar mensagem: $e');
      print('[SERVICE ERROR] Stacktrace:\n$st');
      chatStateNotifier.appendToMessage(
        llmMessage.id,
        "\nMeowww... Algo deu errado! 😿",
      );
    } finally {
      chatStateNotifier.finalizeMessage(llmMessage.id);
      print('[SERVICE] Mensagem finalizada');
    }
  }
}

@riverpod
GeminiChatService geminiChatService(Ref ref) => GeminiChatService(ref);
