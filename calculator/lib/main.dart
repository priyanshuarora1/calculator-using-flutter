import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int fnum;
  int snum;
  String display = "";
  String res;
  String operators;
  void btnclk(String val) {
    if (val == "C") {
      display = "";
      fnum = 0;
      snum = 0;
      res = "";
    } else if (val == "+" || val == "-" || val == "*" || val == "/") {
      fnum = int.parse(display);
      res = "";
      operators = val;
    } else if (val == "=") {
      snum = int.parse(display);
      if (operators == "+") {
        res = (fnum + snum).toString();
      }
      if (operators == "-") {
        res = (fnum - snum).toString();
      }
      if (operators == "*") {
        res = (fnum * snum).toString();
      }
      if (operators == "/") {
        res = (fnum ~/ snum).toString();
      }
    } else {
      res = int.parse(display + val).toString();
    }
    setState(() {
      display = res;
    });
  }

  Widget custombutton(String val) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(20.0),
      onPressed: () => btnclk(val),
      child: Text(
        "$val",
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(
                  "$display",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton("9"),
                custombutton("8"),
                custombutton("7"),
                custombutton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
