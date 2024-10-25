import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'dart:math';

// Criando o provider para acessar o banco de frases
final randomQuoteProvider = Provider<String>((ref) {
  // Acessa o box do Hive
  final box = Hive.box('cat_quotes');

  // Verifica se o box contém frases
  if (box.isEmpty) {
    return 'Nenhuma frase disponível';
  }

  // Obtém todas as frases como uma lista
  final quotes = box.values.toList();

  // Seleciona uma frase aleatória
  final randomIndex = Random().nextInt(quotes.length);
  return quotes[randomIndex] as String;
});
