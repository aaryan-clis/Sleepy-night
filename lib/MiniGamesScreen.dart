import 'package:flutter/material.dart';

class MiniGamesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('U can Play this game '),
      ),
      body: Center(
        child: SudokuGame(),
      ),
    );
  }
}

class SudokuGame extends StatefulWidget {
  @override
  _SudokuGameState createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {
  late List<List<int>> _board;
  late List<List<int>> _originalBoard;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    // Replace this with your Sudoku board generation logic
    _originalBoard = [
      [2, 0, 3, 0],
      [0, 3, 0, 2],
      [0, 2, 0, 3],
      [3, 0, 2, 0],
    ];

    _board = List<List<int>>.generate(4, (row) => List<int>.generate(4, (col) => _originalBoard[row][col]));
  }

  Widget _buildCell(int value, int row, int col) {
    return GestureDetector(
      onTap: () {
        if (_originalBoard[row][col] == 0) {
          // Toggle the cell value on tap
          setState(() {
            _board[row][col] = (_board[row][col] % 4) + 1;
          });
        }
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 14, 38, 194)),
        ),
        child: Center(
          child: Text(
            value == 0 ? '' : value.toString(),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(int row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (col) => _buildCell(_board[row][col], row, col)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (row) => _buildRow(row)),
    );
  }
}
