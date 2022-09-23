import 'package:flutter/material.dart';
import 'package:tictactoe/components/tile.dart';

class Board extends StatelessWidget {
  final String turn;
  final List<String> data;
  final void Function(int index, String theText) onTap;
  final void Function() reset;
  final bool isEnded;
  final String statusWinner;

  const Board(
    this.turn,
    this.data,
    this.onTap, {
    Key? key,
    required this.isEnded,
    required this.statusWinner,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isEnded
            ? StatusReturn()
            : Text(
                "Current Turn: $turn",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(0, turn),
              child: Tile(data[0], side: const ["right", "bottom"]),
            ),
            GestureDetector(
              onTap: () => onTap(1, turn),
              child: Tile(data[1], side: const ["left", "right", "bottom"]),
            ),
            GestureDetector(
              onTap: () => onTap(2, turn),
              child: Tile(data[2], side: const ["left", "bottom"]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(3, turn),
              child: Tile(data[3], side: const ["top", "right", "bottom"]),
            ),
            GestureDetector(
              onTap: () => onTap(4, turn),
              child:
                  Tile(data[4], side: const ["left", "top", "right", "bottom"]),
            ),
            GestureDetector(
              onTap: () => onTap(5, turn),
              child: Tile(data[5], side: const ["left", "top", "bottom"]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onTap(6, turn),
              child: Tile(data[6], side: const ["top", "right"]),
            ),
            GestureDetector(
              onTap: () => onTap(7, turn),
              child: Tile(data[7], side: const ["left", "top", "right"]),
            ),
            GestureDetector(
              onTap: () => onTap(8, turn),
              child: Tile(data[8], side: const ["left", "top"]),
            ),
          ],
        ),
      ],
    );
  }

  Widget StatusReturn() => Column(
        children: [
          Text(
            "Match Ended. Status: $statusWinner",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          ElevatedButton(
            onPressed: reset,
            child: Text("Reset"),
          ),
        ],
      );
}
