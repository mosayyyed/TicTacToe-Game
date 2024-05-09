import 'dart:io';

import 'TicTacToe.dart';

void main() {
  TicTacToe game = TicTacToe();

  while (true) {
    game.printBoard();
    print("Player ${game.currentPlayer}, enter your move (1-9): ");
    var input = stdin.readLineSync();
    var position = int.tryParse(input ?? "");

    if (position != null && position >= 1 && position <= 9) {
      if (game.makeMove(position - 1)) {
        if (game.checkWinner()) {
          game.printBoard();
          print("Player ${game.currentPlayer} wins! Congratulations!");
          break;
        } else if (game.isBoardFull()) {
          game.printBoard();
          print("It\'s a draw! The board is full.");
          break;
        }
      }
    } else {
      print("Invalid input. Please enter a number between 1 and 9.");
    }
  }
}
