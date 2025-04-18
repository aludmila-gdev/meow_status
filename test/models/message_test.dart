import 'package:flutter_test/flutter_test.dart';
import 'package:meow_status/models/message.dart';

void main() {
  group('Message', () {
    test('should create a valid instance with correct values', () {
      const id = '123';
      const text = 'Hello!';
      const isUser = true;

      final message = Message(id: id, text: text, isUser: isUser);

      expect(message.id, equals(id));
      expect(message.text, equals(text));
      expect(message.isUser, isTrue);
    });

    test('should create a user message and a bot message', () {
      final userMessage = Message(id: 'u1', text: 'Hi', isUser: true);
      final botMessage = Message(id: 'b1', text: 'Hello human', isUser: false);

      expect(userMessage.isUser, isTrue);
      expect(botMessage.isUser, isFalse);
    });
  });
}
