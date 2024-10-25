import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meow_status/features/status/data/cat_quotes.dart';
import 'features/status/presentation/status_screen.dart';

void main() async {
  // Inicializando o Hive
  await Hive.initFlutter();

  // Abrindo o box para frases fofas
  await Hive.openBox('cat_quotes');

  // Salvando as frases fofas no Hive, se ainda não estiverem salvas
  saveQuotesToHive();

  // Iniciando o aplicativo com o Riverpod ProviderScope
  runApp(const ProviderScope(child: MyApp()));
}

// Função para salvar as frases fofas no Hive
void saveQuotesToHive() async {
  final box = Hive.box('cat_quotes');

  // Verifica se as frases já estão salvas para evitar duplicações
  if (box.isEmpty) {
    for (var quote in catQuotes) {
      await box.add(quote);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meow Status',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          const StatusScreen(), // Definindo a StatusScreen como a tela inicial
    );
  }
}
