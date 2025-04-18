import 'package:flutter_test/flutter_test.dart';
import 'package:meow_status/providers/chat_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('ChatStateNotifier', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
      addTearDown(container.dispose);
    });

    test('initial state should be empty', () {
      final state = container.read(chatProvider);
      expect(state, isEmpty);
    });

    test('should add a user message', () {
      final notifier = container.read(chatProvider.notifier);
      notifier.addUserMessage('Hello');

      final state = container.read(chatProvider);
      expect(state.length, 1);
      expect(state.first.text, 'Hello');
      expect(state.first.isUser, isTrue);
    });

    test('should create a LLM message with empty text and isUser = false', () {
      final notifier = container.read(chatProvider.notifier);
      final message = notifier.createLlmMessage();

      final state = container.read(chatProvider);
      expect(state.contains(message), isTrue);
      expect(message.text, isEmpty);
      expect(message.isUser, isFalse);
    });

    test('should append text to an existing message by id', () {
      final notifier = container.read(chatProvider.notifier);
      final message = notifier.createLlmMessage();
      notifier.appendToMessage(message.id, 'partial');
      notifier.appendToMessage(message.id, ' response');

      final updatedMessage = container
          .read(chatProvider)
          .firstWhere((m) => m.id == message.id);

      expect(updatedMessage.text, 'partial response');
    });
  });
}
