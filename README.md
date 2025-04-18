# Meow Status

Uma experiência de chat com IA desenvolvida em Flutter, projetada para expressar e refletir estados emocionais de forma lúdica e felina.

![Demonstração do Meow Status](assets/docs/gifs/meow_status_v0.gif)

---

## Visão Geral do Projeto

Meow Status é um app Flutter leve e expressivo que permite que usuários interajam com um Modelo de Linguagem (LLM) por meio de uma interface de chat com tema de gato. Serve como um espaço experimental para explorar conversas em fluxo contínuo, feedback em tempo real e reflexão emocional com IA generativa.

### Funcionalidades

- **Entrada de linguagem natural**: O usuário descreve como está se sentindo em linguagem cotidiana
- **Visualização inteligente de resposta**: Balões de mensagem dinâmicos exibem as respostas de forma clara
- **Integração com LLM**: Usa o Gemini para interpretar e responder com base no contexto
- **Mensagens em tempo real**: A resposta da IA aparece enquanto está sendo gerada
- **Histórico da conversa**: Toda a conversa fica disponível em rolagem contínua
- **Manutenção de contexto**: A sessão preserva o entendimento entre mensagens consecutivas
- **Experiência de entrada do usuário**: Campo de texto fluido com feedback visual
- **Indicador de resposta em andamento**: Placeholder visível enquanto o Meow "pensa"
- **Log visual**: Respostas brutas da IA são exibidas conforme são recebidas

---

## Arquitetura

Este é um aplicativo Flutter independente composto por componentes bem organizados:

```
lib/
└── firebase_options.dart
└── main.dart
├── models/
│   └── message.dart
├── providers/
│   └── chat_state_notifier.dart
│   └── chat_state_provider.dart
│   └── chat_state_provider.g.dart
│   └── gemini.dart
│   └── gemini.g.dart
│   └── system_prompt.dart
│   └── system_prompt.g.dart
├── services/
│   └── gemini_chat_service.dart
│   └── gemini_chat_service.g.dart
├── ui/
│   ├── screens/
│   │   └── main_screen.dart
│   │   └── meow_status_screen.dart
│   ├── widgets/
│   │   ├── chat/
│   │   │   └── chat_input.dart
│   │   │   └── message_bubble.dart
│   │   │   └── messages_list.dart
```

---

## Tecnologias Utilizadas

- **Framework**: Flutter / Dart
- **LLM**: Gemini via `firebase_vertexai`
- **Gerenciamento de Estado**: Riverpod
- **Geração de IDs**: `uuid`
- **Integração Firebase**: FlutterFire CLI
- **Layout Responsivo**: Design voltado para dispositivos móveis

---

## Suporte a Plataformas

- Android ✅
- iOS ✅
- Web (experimental) 🚧

---

## Comandos de Desenvolvimento

```bash
# Formatar o código
dart format lib test

# Gerar código (ex: Riverpod ou Freezed)
dart run build_runner build --delete-conflicting-outputs

# Rodar a app localmente em um emulador android ativo
flutter run -d emulator-5554      

# Analisar código
flutter analyze

# Executar testes
flutter test

# Testes com cobertura
flutter test --coverage

# Gerar relatório de cobertura
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## Fluxo de Uso

1. O usuário digita uma mensagem descrevendo seu estado (ex: "Hoje me sinto em paz")
2. O app envia a mensagem para o Gemini
3. O Gemini processa e retorna uma resposta por streaming
4. A mensagem aparece em tempo real enquanto é gerada
5. Toda a conversa pode ser revisitada pelo histórico

---

Criado com dedicação por humanos!
