import 'package:truko/core/card.dart';

class Deck {
  static List<Card> initial() {
    final cards = <Card>[];

    for (final suit in Suit.values) {
      for (final value in Value.values) {
        final card = Card(suit, value);
        cards.add(card);
      }
    }

    return cards;
  }
}
