import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/gemini.dart';
import 'ui/screens/meow_status_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelAsync = ref.watch(geminiModelProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: modelAsync.when(
        data: (_) => const MeowStatusScreen(),
        loading: () => const LoadingScreen(message: 'Iniciando o Meow...'),
        error: (err, _) => ErrorScreen(error: err),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  final String message;
  const LoadingScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F0),
      body: Center(child: Text(message, style: const TextStyle(fontSize: 18))),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final Object error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F0),
      body: Center(
        child: Text(
          'Erro ao iniciar o Meow 😿\n\n$error',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
