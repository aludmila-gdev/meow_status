import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meow_status/ui/widgets/chat/chat_input.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meow_status/providers/chat_state_notifier.dart';
import 'package:mocktail/mocktail.dart';

class MockChatStateNotifier extends Mock implements ChatStateNotifier {}

void main() {
  late MockChatStateNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockChatStateNotifier();
  });

  testWidgets('ChatInput sends message on submit and clears input', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [chatProvider.overrideWith((ref) => mockNotifier)],
        child: const MaterialApp(home: Scaffold(body: ChatInput())),
      ),
    );

    final textFieldFinder = find.byType(TextField);
    final iconButtonFinder = find.byIcon(Icons.send);

    await tester.enterText(textFieldFinder, 'Hello Meow!');
    expect(find.text('Hello Meow!'), findsOneWidget);

    await tester.tap(iconButtonFinder);
    await tester.pumpAndSettle();

    verify(() => mockNotifier.addUserMessage('Hello Meow!')).called(1);

    expect(find.text('Hello Meow!'), findsNothing);
  });
}
