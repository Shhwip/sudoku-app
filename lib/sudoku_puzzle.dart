import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

enum Difficulty { easy, medium, hard, seventeen, impossible }

class Sudoku {
  List<List<int>> clues = [];
  List<List<int>> solution = [];

  Sudoku(Difficulty difficulty) {
    if (difficulty == Difficulty.easy ||
        difficulty == Difficulty.medium ||
        difficulty == Difficulty.hard) {
      int emptySquares = 0;
      switch (difficulty) {
        case Difficulty.easy:
          {
            emptySquares = 25;
            break;
          }
        case Difficulty.medium:
          {
            emptySquares = 40;
            break;
          }
        case Difficulty.hard:
          {
            emptySquares = 54;
            break;
          }
      }
      var generated = SudokuGenerator(emptySquares: emptySquares);
      clues = generated.newSudoku;
      solution = generated.newSudokuSolved;
      return;
    }
    clues = List<List<int>>.filled(9, List<int>.filled(9, 0));
    solution = List<List<int>>.filled(9, List<int>.filled(9, 0));
    String fileLink = '';
    int linesInFile = 0;
    int headerLines = 0;
    if (difficulty == Difficulty.seventeen) {
      fileLink = 'assets/puzzles2_17_clue.solution';
      linesInFile = 49161;
      headerLines = 3;
    } else if (difficulty == Difficulty.impossible) {
      fileLink = 'assets/puzzles6_forum_hardest_1106.solution';
      linesInFile = 377;
      headerLines = 2;
    }
    split(fetch(fileLink, linesInFile, headerLines));
    shuffle();
  }

  String fetch(String link, int lines, int headerLines) {
    var lineNum = Random().nextInt(lines - headerLines) + headerLines;
    final file = File(link).readAsStringSync();
    const splitter = LineSplitter();
    final string = splitter.convert(file);
    return (string[lineNum]);
  }

  int split(String line) {
    int charNumber = 0;
    for (int row = 0; row < 9; ++row) {
      for (int column = 0; column < 9; ++column) {
        clues[row][column] = int.tryParse(line[charNumber++]) ?? -1;
      }
    }
    for (int row = 0; row < 9; ++row) {
      for (int column = 0; column < 9; ++column) {
        solution[row][column] =
            int.tryParse(line[++charNumber]) ?? -1; // prefix skips the colon
      }
    }
    return 0;
  }

  int shuffle() {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();
    shuffleNumbers(clues, numbers);
    shuffleNumbers(solution, numbers);
    // TODO shuffle columns and rows that don't cross box boundaries
    // TODO 90/270 degree rotations
    // https://ljkrakauer.com/Sudoku/transformations.htm
    return 0;
  }

  int shuffleNumbers(List<List<int>> sudoku, List<int> numbers) {
    for (int list = 0; list < 9; ++list) {
      for (int num in sudoku[list]) {
        if (num == 0) {
          continue;
        }
        num = numbers[num - 1];
      }
    }
    return 0;
  }
}

void main() async {}
