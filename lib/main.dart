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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Table(
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
        )
      ],
    );
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
      return Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF0D47A1),
                  Color(0xFF1976D2),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: null,
            child: Text(widget.displayNum),
          ),
        ],
      );
    } else {
      return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 16),
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
  bool _isFavorited = true;
  int _favoriteCount = 1;

  void _toggleFavorite() {
    setState(() {
      if (widget.displayNum != ' ') {
        _favoriteCount = int.parse(widget.displayNum) + 1;
        widget.displayNum = _favoriteCount.toString();
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
