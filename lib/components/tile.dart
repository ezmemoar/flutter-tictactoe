import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final List<String> side;
  final String text;

  const Tile(
    this.text, {
    Key? key,
    required this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BorderSide borderPreset = BorderSide(
      color: Colors.black,
      width: 1.0,
    );

    const BorderSide borderNull =
        BorderSide(width: 0, color: Colors.transparent);

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          border: Border(
            right: side.contains("right") ? borderPreset : borderNull,
            top: side.contains("top") ? borderPreset : borderNull,
            bottom: side.contains("bottom") ? borderPreset : borderNull,
            left: side.contains("left") ? borderPreset : borderNull,
          ),
        ),
        child: Text(text != "" ? text : ""),
      ),
    );
  }
}
