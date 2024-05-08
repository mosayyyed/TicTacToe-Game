import 'dart:io';

class TicTacToe {
  List<String> board = List.filled(9, " ");
  String currentPlayer = "X";

  void printBoard() {
    for (int i = 0; i < 9; i += 3) {
      print(" ${board[i]} | ${board[i + 1]} | ${board[i + 2]} ");
      if (i < 6) print("---|---|---");
    }
    print('\n');
  }

  bool makeMove(int position) {
    if (board[position] == " ") {
      board[position] = currentPlayer;
      switchPlayer();
      return true;
    } else {
      print("Invalid move. The position is already taken. Try again.");
      return false;
    }
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == "X") ? "O" : "X";
  }

  bool checkWinner() {
    for (int i = 0; i < 3; i++) {
      if (board[i] != " " &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) return true;

      if (board[i * 3] != " " &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3] == board[i * 3 + 2]) return true;
    }

    if (board[0] != " " && board[0] == board[4] && board[0] == board[8])
      return true;
    if (board[2] != " " && board[2] == board[4] && board[2] == board[6])
      return true;

    return false;
  }

  bool isBoardFull() {
    return !board.contains(" ");
  }
}

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