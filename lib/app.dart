import 'package:flutter/material.dart';
import 'package:tictactoe/components/board.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Page(),
    );
  }
}

class Page extends StatefulWidget {
  Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  bool isStart = false;
  bool isEnded = false;
  String statusWinner = "";
  String turn = "X";
  int count = 0;
  List<List<int>> pattern = [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [1, 4, 7],
    [2, 4, 6],
    [2, 5, 8],
    [3, 4, 5],
    [6, 7, 8],
  ];
  List<String> point = ["", "", "", "", "", "", "", "", ""];

  void update(int index, String theText) => setState(() {
        point[index] = theText;

        for (List<int> val in pattern) {
          int index0 = val[0], index1 = val[1], index2 = val[2];

          if (point[index0] != "" &&
              point[index0] == point[index1] &&
              point[index0] == point[index2]) {
            isEnded = true;
            statusWinner = "$theText Winner";
          }
        }

        count++;
        if (count > 8) {
          isEnded = true;
          statusWinner = "Draw";
        }

        turn = turn == "X" ? "O" : "X";
      });

  void reset() => setState(() {
        point = ["", "", "", "", "", "", "", "", ""];
        isEnded = false;
        statusWinner = "";
        count = 0;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: isStart
          ? Board(
              turn,
              point,
              update,
              isEnded: isEnded,
              statusWinner: statusWinner,
              reset: reset,
            )
          : Greeter(),
    );
  }

  Widget Greeter() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30.0),
          Text(
            "Tictactoe",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.0, vertical: 18.0)),
            onPressed: () => setState(() => isStart = !isStart),
            child: Text("start"),
          ),
        ],
      );
}
