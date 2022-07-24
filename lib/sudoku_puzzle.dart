import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:math';

void main() async {
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  numbers.shuffle();
  var lineNum = Random().nextInt(373) + 3;

  final file = File('assets/puzzles6_forum_hardest_1106.solution');
  Stream<String> lines = file
      .openRead()
      .transform(utf8.decoder) // Decode bytes to UTF-8.
      .transform(LineSplitter()); // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      print('$line: ${line.length} characters');
    }
    print('File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
}
