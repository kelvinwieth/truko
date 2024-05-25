import 'package:equatable/equatable.dart';
import 'package:truko/core/card.dart';
import 'package:truko/core/deck.dart';

class GameState extends Equatable {
  final List<Card> table;
  final List<Card> player1;
  final List<Card> player2;
  final int nextPlayer;

  const GameState({
    required this.table,
    required this.player1,
    required this.player2,
    required this.nextPlayer,
  });

  factory GameState.initial() {
    final cards = Deck.initial()
      ..shuffle()
      ..take(6);

    return GameState(
      table: const [],
      player1: cards.take(3).toList(),
      player2: cards.skip(3).take(3).toList(),
      nextPlayer: 1,
    );
  }

  List<Card> get nextPlayerCards =>
      nextPlayer == 1 ? player1.toList() : player2.toList();

  GameState copyWith({
    List<Card>? table,
    List<Card>? player1,
    List<Card>? player2,
    int? nextPlayer,
  }) {
    return GameState(
      table: table ?? this.table,
      player1: player1 ?? this.player1,
      player2: player2 ?? this.player2,
      nextPlayer: nextPlayer ?? this.nextPlayer,
    );
  }

  @override
  List<Object?> get props => [table, player1, player2, nextPlayer];
}
