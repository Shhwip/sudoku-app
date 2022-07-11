import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Provide the model to all widgets within the app. We're using
    // ChangeNotifierProvider because that's a simple way to rebuild
    // widgets when a model changes. We could also just use
    // Provider, but then we would have to listen to Counter ourselves.
    //
    // Read Provider's docs to learn about all the available providers.
    ChangeNotifierProvider(
      // Initialize the model in the builder. That way, Provider
      // can own Counter's lifecycle, making sure to call `dispose`
      // when not needed anymore.
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight / 17),
          child: Table(
            border: TableBorder.all(
              color: Colors.black,
              width: 1,
            ),
            columnWidths: const <int, TableColumnWidth>{
              0: FlexColumnWidth(),
              1: FlexColumnWidth(),
              2: FlexColumnWidth(),
              3: FlexColumnWidth(),
              4: FlexColumnWidth(),
              5: FlexColumnWidth(),
              6: FlexColumnWidth(),
              7: FlexColumnWidth(),
              8: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '3'),
                  NumBox(displayNum: '3'),
                  NumBox(displayNum: '3'),
                  NumBox(displayNum: '3'),
                  NumBox(displayNum: '3'),
                  NumBox(displayNum: '3'),
                  NumBox(displayNum: '3'),
                  NumBox(displayNum: '3'),
                  NumBox(displayNum: '3'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                ],
              ),
              TableRow(
                children: <Widget>[
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                  NumBox(displayNum: '1'),
                ],
              ),
            ],
          ),
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
        // TODO figure this out later
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: height * 0.06,
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
            primary: Colors.black,
            textStyle: TextStyle(fontSize: height * 0.03),
          ),
          onPressed: _toggleFavorite,
          child: Text(widget.displayNum),
        ));
  }
}

class SudokuModel extends ChangeNotifier {
  final curSudoku = List<String>.filled(81, ' ');
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
