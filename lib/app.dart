import 'package:flutter/material.dart';
import 'package:truko/core/game.dart';
import 'package:truko/ui/game_screen.dart';

class TrukoApp extends StatefulWidget {
  const TrukoApp({super.key});

  @override
  State<TrukoApp> createState() => _TrukoAppState();
}

class _TrukoAppState extends State<TrukoApp> {
  late final Game game;

  @override
  void initState() {
    super.initState();
    game = Game();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(game: game),
    );
  }
}
