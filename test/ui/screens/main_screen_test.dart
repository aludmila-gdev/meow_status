import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meow_status/ui/screens/main_screen.dart';
import 'package:meow_status/ui/widgets/chat/chat_input.dart';
import 'package:meow_status/ui/widgets/chat/messages_list.dart';

void main() {
  testWidgets('MainScreen renders correctly with expected widgets', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: MainScreen())),
    );

    expect(find.text('Meow Status 🐱'), findsOneWidget);

    expect(find.byType(MessagesList), findsOneWidget);

    expect(find.byType(ChatInput), findsOneWidget);
  });
}
