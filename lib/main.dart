import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sudoku_puzzle.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SudokuModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: SelectedNum(),
          ),
          ChangeNotifierProvider.value(
            value: SelectedMode(),
          )
        ],
        child: MaterialApp(
          title: _title,
          home: Scaffold(
            body: const MyStatelessWidget(),
          ),
        ));
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Sudoku sudoku = Sudoku(Difficulty.hard);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight / 17),
          child: SudokuTable(sudoku: sudoku),
        ),
        Table(
          border: const TableBorder(
              top: BorderSide(color: Colors.blue, width: 5),
              horizontalInside: BorderSide(color: Colors.black, width: 1),
              verticalInside: BorderSide(color: Colors.black, width: 1),
              bottom: BorderSide(color: Colors.blue, width: 5)),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                NumBarButton(displayNum: '1'),
                NumBarButton(displayNum: '2'),
                NumBarButton(displayNum: '3'),
              ],
            ),
            TableRow(
              children: <Widget>[
                NumBarButton(displayNum: '4'),
                NumBarButton(displayNum: '5'),
                NumBarButton(displayNum: '6'),
              ],
            ),
            TableRow(
              children: <Widget>[
                NumBarButton(displayNum: '7'),
                NumBarButton(displayNum: '8'),
                NumBarButton(displayNum: '9'),
              ],
            ),
          ],
        ),
        Row(children: <Widget>[
          Expanded(
              child:
                  ModeButton(buttonMode: Mode.edit, displayIcon: Icons.edit)),
          Expanded(
            child: ModeButton(buttonMode: Mode.note, displayIcon: Icons.note),
          ),
          Expanded(
            child:
                ModeButton(buttonMode: Mode.delete, displayIcon: Icons.delete),
          )
        ])
      ],
    );
  }
}

class SudokuTable extends StatelessWidget {
  final Sudoku sudoku;
  const SudokuTable({Key? key, required this.sudoku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Colors.black,
        width: 1,
      ),
      defaultColumnWidth: FixedColumnWidth(SizeConfig.screenWidth / 9),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[0][0].toString()),
            NumBox(displayNum: sudoku.clues[0][1].toString()),
            NumBox(displayNum: sudoku.clues[0][2].toString()),
            NumBox(displayNum: sudoku.clues[0][3].toString()),
            NumBox(displayNum: sudoku.clues[0][4].toString()),
            NumBox(displayNum: sudoku.clues[0][5].toString()),
            NumBox(displayNum: sudoku.clues[0][6].toString()),
            NumBox(displayNum: sudoku.clues[0][7].toString()),
            NumBox(displayNum: sudoku.clues[0][8].toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[1][0].toString()),
            NumBox(displayNum: sudoku.clues[1][1].toString()),
            NumBox(displayNum: sudoku.clues[1][2].toString()),
            NumBox(displayNum: sudoku.clues[1][3].toString()),
            NumBox(displayNum: sudoku.clues[1][4].toString()),
            NumBox(displayNum: sudoku.clues[1][5].toString()),
            NumBox(displayNum: sudoku.clues[1][6].toString()),
            NumBox(displayNum: sudoku.clues[1][7].toString()),
            NumBox(displayNum: sudoku.clues[1][8].toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[2][0].toString()),
            NumBox(displayNum: sudoku.clues[2][1].toString()),
            NumBox(displayNum: sudoku.clues[2][2].toString()),
            NumBox(displayNum: sudoku.clues[2][3].toString()),
            NumBox(displayNum: sudoku.clues[2][4].toString()),
            NumBox(displayNum: sudoku.clues[2][5].toString()),
            NumBox(displayNum: sudoku.clues[2][6].toString()),
            NumBox(displayNum: sudoku.clues[2][7].toString()),
            NumBox(displayNum: sudoku.clues[2][8].toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[3][0].toString()),
            NumBox(displayNum: sudoku.clues[3][1].toString()),
            NumBox(displayNum: sudoku.clues[3][2].toString()),
            NumBox(displayNum: sudoku.clues[3][3].toString()),
            NumBox(displayNum: sudoku.clues[3][4].toString()),
            NumBox(displayNum: sudoku.clues[3][5].toString()),
            NumBox(displayNum: sudoku.clues[3][6].toString()),
            NumBox(displayNum: sudoku.clues[3][7].toString()),
            NumBox(displayNum: sudoku.clues[3][8].toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[4][0].toString()),
            NumBox(displayNum: sudoku.clues[4][1].toString()),
            NumBox(displayNum: sudoku.clues[4][2].toString()),
            NumBox(displayNum: sudoku.clues[4][3].toString()),
            NumBox(displayNum: sudoku.clues[4][4].toString()),
            NumBox(displayNum: sudoku.clues[4][5].toString()),
            NumBox(displayNum: sudoku.clues[4][6].toString()),
            NumBox(displayNum: sudoku.clues[4][7].toString()),
            NumBox(displayNum: sudoku.clues[4][8].toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[5][0].toString()),
            NumBox(displayNum: sudoku.clues[5][1].toString()),
            NumBox(displayNum: sudoku.clues[5][2].toString()),
            NumBox(displayNum: sudoku.clues[5][3].toString()),
            NumBox(displayNum: sudoku.clues[5][4].toString()),
            NumBox(displayNum: sudoku.clues[5][5].toString()),
            NumBox(displayNum: sudoku.clues[5][6].toString()),
            NumBox(displayNum: sudoku.clues[5][7].toString()),
            NumBox(displayNum: sudoku.clues[5][8].toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[6][0].toString()),
            NumBox(displayNum: sudoku.clues[6][1].toString()),
            NumBox(displayNum: sudoku.clues[6][2].toString()),
            NumBox(displayNum: sudoku.clues[6][3].toString()),
            NumBox(displayNum: sudoku.clues[6][4].toString()),
            NumBox(displayNum: sudoku.clues[6][5].toString()),
            NumBox(displayNum: sudoku.clues[6][6].toString()),
            NumBox(displayNum: sudoku.clues[6][7].toString()),
            NumBox(displayNum: sudoku.clues[6][8].toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[7][0].toString()),
            NumBox(displayNum: sudoku.clues[7][1].toString()),
            NumBox(displayNum: sudoku.clues[7][2].toString()),
            NumBox(displayNum: sudoku.clues[7][3].toString()),
            NumBox(displayNum: sudoku.clues[7][4].toString()),
            NumBox(displayNum: sudoku.clues[7][5].toString()),
            NumBox(displayNum: sudoku.clues[7][6].toString()),
            NumBox(displayNum: sudoku.clues[7][7].toString()),
            NumBox(displayNum: sudoku.clues[7][8].toString()),
          ],
        ),
        TableRow(
          children: <Widget>[
            NumBox(displayNum: sudoku.clues[8][0].toString()),
            NumBox(displayNum: sudoku.clues[8][1].toString()),
            NumBox(displayNum: sudoku.clues[8][2].toString()),
            NumBox(displayNum: sudoku.clues[8][3].toString()),
            NumBox(displayNum: sudoku.clues[8][4].toString()),
            NumBox(displayNum: sudoku.clues[8][5].toString()),
            NumBox(displayNum: sudoku.clues[8][6].toString()),
            NumBox(displayNum: sudoku.clues[8][7].toString()),
            NumBox(displayNum: sudoku.clues[8][8].toString()),
          ],
        ),
      ],
    );
  }
}

enum Mode { edit, note, delete }

class SelectedMode extends ChangeNotifier {
  Mode selectedMode = Mode.edit;
  void setMode(Mode mode) {
    selectedMode = mode;
    notifyListeners();
  }

  Mode getMode() {
    return selectedMode;
  }
}

class ModeButton extends StatefulWidget {
  Mode buttonMode;
  IconData displayIcon;
  ModeButton({
    Key? key,
    required this.buttonMode,
    required this.displayIcon,
  }) : super(key: key);

  @override
  _ModeButtonState createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton> {
  bool isFocused = false;

  void _selectMode() {
    setState(() {
      Provider.of<SelectedMode>(context, listen: false)
          .setMode(widget.buttonMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    isFocused =
        (Provider.of<SelectedMode>(context).getMode() == widget.buttonMode);
    if (isFocused) {
      return IconButton(
        icon: Icon(widget.displayIcon),
        onPressed: null,
      );
    } else {
      return IconButton(
        icon: Icon(widget.displayIcon),
        onPressed: _selectMode,
      );
    }
  }
}

class SelectedNum extends ChangeNotifier {
  int curNum = 0;

  void setNum(int newNum) {
    curNum = newNum;
    notifyListeners();
  }

  int getNum() {
    return curNum;
  }
}

class NumBarButton extends StatefulWidget {
  String displayNum;
  NumBarButton({Key? key, required this.displayNum}) : super(key: key);

  @override
  _NumBarButtonState createState() => _NumBarButtonState();
}

class _NumBarButtonState extends State<NumBarButton> {
  bool isFocused = false;

  void _selectNum() {
    setState(() {
      Provider.of<SelectedNum>(context, listen: false)
          .setNum(int.parse(widget.displayNum));
    });
  }

  @override
  Widget build(BuildContext context) {
    isFocused = (Provider.of<SelectedNum>(context).getNum().toString() ==
        widget.displayNum);
    if (isFocused) {
      return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          primary: Colors
              .blueGrey, // as long as onPressed is null it will actually just be grey
          textStyle:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05),
        ),
        onPressed: null,
        child: Text(widget.displayNum),
      );
    } else {
      return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          primary: Colors.black,
          textStyle:
              TextStyle(fontSize: MediaQuery.of(context).size.height * 0.04),
        ),
        onPressed: _selectNum,
        child: Text(widget.displayNum),
      );
    }
  }
}

class NumBox extends StatefulWidget {
  String displayNum;
  NumBox({Key? key, required this.displayNum}) : super(key: key);

  @override
  _NumBoxState createState() => _NumBoxState();
}

class _NumBoxState extends State<NumBox> {
  void _toggleFavorite() {
    setState(() {
      Mode mode = Provider.of<SelectedMode>(context, listen: false).getMode();
      if (mode == Mode.edit) {
        widget.displayNum = Provider.of<SelectedNum>(context, listen: false)
            .getNum()
            .toString();
      } else if (mode == Mode.delete) {
        widget.displayNum = ' ';
      } else if (mode == Mode.note) {
        // TODO convert button into 3x3 table to note possible numbers
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.displayNum == '0') {
      widget.displayNum = ' ';
    }
    double height = MediaQuery.of(context).size.height;
    final selectedNum = Provider.of<SelectedNum>(context, listen: true).curNum;
    Color backColor, fontColor;
    FontWeight fontWeight;
    if (widget.displayNum == selectedNum.toString()) {
      backColor = Colors.black;
      fontColor = Colors.white;
      fontWeight = FontWeight.bold;
    } else {
      backColor = Colors.white;
      fontColor = Colors.black;
      fontWeight = FontWeight.normal;
    }
    return Container(
        height: height * 0.06,
        color: backColor,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: fontColor,
            textStyle:
                TextStyle(fontSize: height * 0.03, fontWeight: fontWeight),
          ),
          onPressed: _toggleFavorite,
          child: Text(widget.displayNum),
        ));
  }
}

class SudokuModel extends ChangeNotifier {
  Sudoku curSudoku = Sudoku(Difficulty.impossible);
}

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;

  void init(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
