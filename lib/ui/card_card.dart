import 'package:flutter/material.dart' hide Card;
import 'package:truko/core/card.dart';

class CardCard extends StatelessWidget {
  final bool hide;
  final Card value;
  final void Function()? onTap;
  final double? rotation;

  const CardCard(
    this.value, {
    super.key,
    this.hide = false,
    this.onTap,
    this.rotation,
  });

  @override
  Widget build(BuildContext context) {
    final card = InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: hide ? _back : _content,
        ),
      ),
    );

    if (rotation == null) {
      return card;
    }

    return Transform.rotate(angle: rotation!, child: card);
  }

  Widget get _content {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            '$value',
            style: TextStyle(
              color: value.suit.isRed ? Colors.red : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget get _back {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black),
          color: Colors.red[900],
        ),
      ),
    );
  }
}
