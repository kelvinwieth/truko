import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:truko/core/state.dart';

class Game with ChangeNotifier {
  final List<GameState> _states;

  Game() : _states = [GameState.initial()];

  GameState get state => _states.last;

  void _add(GameState state) {
    _states.add(state);
    notifyListeners();
  }

  void play(int cardIndex) {
    final card = state.nextPlayerCards.elementAtOrNull(cardIndex);
    if (card == null) {
      return;
    }

    final p1 = state.nextPlayer == 1
        ? state.player1.whereNot((c) => c == card).toList()
        : null;
    final p2 = state.nextPlayer == 2
        ? state.player2.whereNot((c) => c == card).toList()
        : null;
    final next = state.nextPlayer == 1 ? 2 : 1;

    final newState = state.copyWith(
      table: state.table.toList()..add(card),
      player1: p1,
      player2: p2,
      nextPlayer: next,
    );

    if (newState.player1.isEmpty && newState.player2.isEmpty) {
      final newestState = newState.copyWith(nextPlayer: 0);
      _add(newestState);
      return;
    }

    _add(newState);
  }

  void restart() {
    _states.clear();
    _add(GameState.initial());
  }
}
