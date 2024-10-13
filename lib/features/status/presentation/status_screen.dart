import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'random_cat_provider.dart';
import 'random_quote_provider.dart'; // Importa o provider de frases fofas

class StatusScreen extends ConsumerWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catImage = ref.watch(catImageProvider);
    final catQuote =
        ref.watch(randomQuoteProvider); // Busca uma frase fofa aleatória

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meow Status'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (catImage != null)
              Image.network(catImage) // Exibe a imagem do gato
            else
              const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              catQuote, // Exibe a frase fofa de gato
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  ref.read(catImageProvider.notifier).fetchRandomCat(),
              child: const Text('Fetch a Cat!'),
            ),
          ],
        ),
      ),
    );
  }
}
