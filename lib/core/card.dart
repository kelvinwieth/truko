import 'package:equatable/equatable.dart';

enum Suit {
  diamonds,
  spades,
  hearts,
  clubs;

  @override
  String toString() {
    return switch (this) {
      diamonds => '♦',
      spades => '♠',
      hearts => '♥',
      clubs => '♣',
    };
  }

  bool get isBlack => this == spades || this == clubs;
  bool get isRed => !isBlack;
}

enum Value {
  four,
  five,
  six,
  seven,
  ten,
  eleven,
  twelve,
  ace,
  two,
  three;

  @override
  String toString() {
    return switch (this) {
      four => '4',
      five => '5',
      six => '6',
      seven => '7',
      ten => 'Q',
      eleven => 'J',
      twelve => 'K',
      ace => 'A',
      two => '2',
      three => '3',
    };
  }
}

class Card extends Equatable {
  final Suit suit;
  final Value value;

  const Card(this.suit, this.value);

  @override
  List<Object?> get props => [suit, value];

  @override
  String toString() => '$value$suit';
}
