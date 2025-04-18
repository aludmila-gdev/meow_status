import 'package:flutter_test/flutter_test.dart';
import 'package:meow_status/providers/chat_state_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';

void main() {
  group('ChatStateNotifier (TextPart-based)', () {
    late ProviderContainer container;
    late ChatStateNotifier notifier;

    setUp(() {
      container = ProviderContainer();
      notifier = container.read(chatStateNotifierProvider.notifier);
      addTearDown(container.dispose);
    });

    test('initial state should be empty', () {
      final state = container.read(chatStateNotifierProvider);
      expect(state, isEmpty);
    });

    test('should add a user message with text', () {
      notifier.addUserMessage('meow?');

      final messages = container.read(chatStateNotifierProvider);
      expect(messages.length, 1);
      expect(messages.first.isUser, isTrue);
      expect(messages.first.text, 'meow?');
    });

    test('should create an LLM message with empty content', () {
      final llmMsg = notifier.createLlmMessage();

      final messages = container.read(chatStateNotifierProvider);
      expect(messages.contains(llmMsg), isTrue);
      expect(llmMsg.role, 'assistant');
      expect(llmMsg.content, isEmpty);
    });

    test('should append to an existing message', () {
      final msg = notifier.createLlmMessage();
      notifier.appendToMessage(msg.id, 'Hello');
      notifier.appendToMessage(msg.id, ', world!');

      final updatedMsg = container
          .read(chatStateNotifierProvider)
          .firstWhere((m) => m.id == msg.id);

      expect(updatedMsg.text, 'Hello, world!');
    });

    test('text getter should fallback to empty when no TextPart', () {
      final message = ChatMessage(id: '1', role: 'user', content: []);
      expect(message.text, '');
    });
  });
}
