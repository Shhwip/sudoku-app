import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

enum Difficulty { easy, medium, hard, seventeen, impossible }

class Sudoku {
  final difficulties = {
    Difficulty.easy: '25',
    Difficulty.medium: '40',
    Difficulty.hard: '55',
    Difficulty.seventeen: 'assets/puzzles2_17_clue.solution',
    Difficulty.impossible: 'assets/puzzles6_forum_hardest_1106.solution',
  };
  List<List<int>> clues = [];
  List<List<int>> solution = [];

  Sudoku(Difficulty difficulty) {
    int emptySquares = 0;
    if (difficulty == Difficulty.easy ||
        difficulty == Difficulty.medium ||
        difficulty == Difficulty.hard) {
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
            emptySquares = 55;
            break;
          }
      }
      var generated = SudokuGenerator(emptySquares: emptySquares);
      clues = generated.newSudoku;
      solution = generated.newSudokuSolved;
      return;
    }
    String fileLink;
    int linesInFile = 0;
    int headerLines = 0;
    if (difficulty == Difficulty.seventeen) {
      fileLink = 'assets/puzzles2_17_clue.solution';
    } else if (difficulty == Difficulty.impossible) {
      fileLink = 'assets/puzzles6_forum_hardest_1106.solution';
      linesInFile = 376;
      headerLines = 2;
    }
  }
  String fetch(String link, int lines, int headerLines) {
    return '';
  }

  int split(String line) {
    var sudoku = List<int>.filled(163, 0);
    for (int i = 0; i < 9 * 9 + 9 * 9 + 1; ++i) {
/*    if (i == 9 * 9) {
      // skip the colon. Compiler optimizes this
      continue; // this doesn't work for some reason ???
    }*/
      sudoku[i] = int.tryParse(line[i]) ?? 0;
    }
    return 0;
  }

  List<int> shuffle(List<int> sudoku) {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    numbers.shuffle();
    for (int num in sudoku) {
      if (num == 0) {
        continue;
      }
      num = numbers[num - 1];
    }
    // TODO shuffle columns and rows that don't cross box boundaries
    // TODO 90/270 degree rotations
    // https://ljkrakauer.com/Sudoku/transformations.htm
    return sudoku;
  }
}

void main() async {
  const linesInFile = 376;
  const headerLines = 2;
  var lineNum = Random().nextInt(373) + headerLines;

  final file =
      File('assets/puzzles6_forum_hardest_1106.solution').readAsStringSync();
  const splitter = LineSplitter();
  final string = splitter.convert(file);
  // final sudokuString = split(string[lineNum]);
}
