import 'package:flutter_test/flutter_test.dart';
import 'package:truko/core/game.dart';

void main() {
  test('initial state', () {
    // Arrange
    // Act
    final game = Game();

    // Assert
    final state = game.state;
    expect(state.table, hasLength(0));
    expect(state.player1, hasLength(3));
    expect(state.player2, hasLength(3));
    expect(state.nextPlayer, 1);
  });

  test('after 1st play', () {
    // Arrange
    final game = Game();
    final p1 = game.state.player1.toList();
    final p2 = game.state.player2.toList();

    // Act
    game.play(0);

    // Assert
    final state = game.state;
    expect(state.table, [p1[0]]);
    expect(state.player1, [p1[1], p1[2]]);
    expect(state.player2, p2);
    expect(state.nextPlayer, 2);
  });

  test('after 2nd play', () {
    // Arrange
    final game = Game();
    final p1 = game.state.player1.toList();
    final p2 = game.state.player2.toList();

    // Act
    game.play(0);
    game.play(1);

    // Assert
    final state = game.state;
    expect(state.table, [p1[0], p2[1]]);
    expect(state.player1, [p1[1], p1[2]]);
    expect(state.player2, [p2[0], p2[2]]);
    expect(state.nextPlayer, 1);
  });

  test('after 3rd play', () {
    // Arrange
    final game = Game();
    final p1 = game.state.player1.toList();
    final p2 = game.state.player2.toList();

    // Act
    game.play(0);
    game.play(1);
    game.play(1);

    // Assert
    final state = game.state;
    expect(state.table, [p1[0], p2[1], p1[2]]);
    expect(state.player1, [p1[1]]);
    expect(state.player2, [p2[0], p2[2]]);
    expect(state.nextPlayer, 2);
  });

  test('after 4th play', () {
    // Arrange
    final game = Game();
    final p1 = game.state.player1.toList();
    final p2 = game.state.player2.toList();

    // Act
    game.play(0);
    game.play(1);
    game.play(1);
    game.play(0);

    // Assert
    final state = game.state;
    expect(state.table, [p1[0], p2[1], p1[2], p2[0]]);
    expect(state.player1, [p1[1]]);
    expect(state.player2, [p2[2]]);
    expect(state.nextPlayer, 1);
  });

  test('after 5th play', () {
    // Arrange
    final game = Game();
    final p1 = game.state.player1.toList();
    final p2 = game.state.player2.toList();

    // Act
    game.play(0);
    game.play(1);
    game.play(1);
    game.play(0);
    game.play(0);

    // Assert
    final state = game.state;
    expect(state.table, [p1[0], p2[1], p1[2], p2[0], p1[1]]);
    expect(state.player1, []);
    expect(state.player2, [p2[2]]);
    expect(state.nextPlayer, 2);
  });

  test('after 6th play', () {
    // Arrange
    final game = Game();
    final p1 = game.state.player1.toList();
    final p2 = game.state.player2.toList();

    // Act
    game.play(0);
    game.play(1);
    game.play(1);
    game.play(0);
    game.play(0);
    game.play(0);

    // Assert
    final state = game.state;
    expect(state.table, [p1[0], p2[1], p1[2], p2[0], p1[1], p2[2]]);
    expect(state.player1, []);
    expect(state.player2, []);
    expect(state.nextPlayer, 0);
  });
}
