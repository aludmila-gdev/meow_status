import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meow_status/ui/widgets/chat/message_bubble.dart';
import 'package:meow_status/models/message.dart';

void main() {
  group('MessageBubble', () {
    testWidgets('renders user message with blue alignment right', (
      WidgetTester tester,
    ) async {
      final message = Message(id: '1', text: 'Hello from user', isUser: true);

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: MessageBubble(message: message))),
      );

      expect(find.text('Hello from user'), findsOneWidget);

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.centerRight);

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.blue[200]));
    });

    testWidgets('renders assistant message with grey alignment left', (
      WidgetTester tester,
    ) async {
      final message = Message(id: '2', text: 'Hello human', isUser: false);

      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: MessageBubble(message: message))),
      );

      expect(find.text('Hello human'), findsOneWidget);

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.centerLeft);

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, equals(Colors.grey[300]));
    });
  });
}
