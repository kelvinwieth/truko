import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:truko/core/card.dart';
import 'package:truko/core/game.dart';
import 'package:truko/ui/card_card.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  const GameScreen({
    super.key,
    required this.game,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Game game;

  @override
  void initState() {
    super.initState();
    game = widget.game;
    game.addListener(updateScreen);
  }

  @override
  void dispose() {
    game.removeListener(updateScreen);
    super.dispose();
  }

  void updateScreen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: PlayerView(
                player: widget.game.state.player2,
                hide: true,
                onPlay: game.state.nextPlayer == 2
                    ? (index) => game.play(index)
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: TableView(table: widget.game.state.table),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.2,
              child: PlayerView(
                player: widget.game.state.player1,
                hide: false,
                onPlay: game.state.nextPlayer == 1
                    ? (index) => game.play(index)
                    : null,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: game.restart,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class TableView extends StatelessWidget {
  final List<Card> table;

  const TableView({
    super.key,
    required this.table,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: table
            .mapIndexed(
                (i, c) => CardCard(c, rotation: 0.131 * (i.isEven ? 1 : -1)))
            .toList(),
      ),
    );
  }
}

class PlayerView extends StatelessWidget {
  final List<Card> player;
  final bool hide;
  final void Function(int index)? onPlay;

  const PlayerView({
    super.key,
    required this.player,
    this.hide = false,
    this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: player
          .mapIndexed(
              (i, p) => CardCard(p, hide: hide, onTap: () => onPlay?.call(i)))
          .expand((e) => [e, const SizedBox(width: 4)])
          .removeLastIfNotEmpty(),
    );
  }
}

extension IterableHelper<T> on Iterable<T> {
  List<T> removeLastIfNotEmpty() {
    if (isEmpty) {
      return toList();
    }

    return toList()..removeLast();
  }
}
