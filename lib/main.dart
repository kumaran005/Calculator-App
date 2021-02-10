import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.orange, brightness: Brightness.dark),
      home: Calculator(title: "Flutter Calculator"),
    );
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";

  String output2 = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPress(String buttonvalues) {
    if (buttonvalues == "Clear") {
      output2 = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonvalues == "+" ||
        buttonvalues == "-" ||
        buttonvalues == "x" ||
        buttonvalues == "/" ||
        buttonvalues == "%") {
      num1 = double.parse(output);
      operand = buttonvalues;
      output2 = "0";
    } else if (buttonvalues == ".") {
      if (output2.contains(".")) {
        print("Already decimal occured");
        return;
      } else {
        output2 = output2 + buttonvalues;
      }
    } else if (buttonvalues == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        output2 = (num1 + num2).toString();
      }
      if (operand == "-") {
        output2 = (num1 + num2).toString();
      }
      if (operand == "/") {
        output2 = (num1 / num2).toString();
      }
      if (operand == "x") {
        output2 = (num1 * num2).toString();
      }
      if (operand == "%") {
        output2 = (num1 % num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      output2 = output2 + buttonvalues;
    }
    print(output2);

    setState(() {
      output = double.parse(output2).toStringAsFixed(2);
    });
  }

  Widget buttons(String buttonvalues) {
    return Expanded(
      child: OutlineButton(
        hoverColor: Colors.black12,
        padding: EdgeInsets.all(24.0),
        child: Text(
          buttonvalues,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
        onPressed: () {
          buttonPress(buttonvalues);
        },
        textColor: Colors.blueAccent,
        splashColor: Colors.deepOrangeAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 24.0,
                ),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            Expanded(
                child: Divider(
              color: Colors.black12,
            )),
            Column(
              children: [
                Row(
                  children: [
                    buttons("7"),
                    buttons("8"),
                    buttons("9"),
                    buttons("-"),
                  ],
                ),
                Row(
                  children: [
                    buttons("4"),
                    buttons("5"),
                    buttons("6"),
                    buttons("+"),
                  ],
                ),
                Row(
                  children: [
                    buttons("1"),
                    buttons("2"),
                    buttons("3"),
                    buttons("x"),
                  ],
                ),
                Row(
                  children: [
                    buttons("."),
                    buttons("0"),
                    buttons("%"),
                    buttons("/"),
                  ],
                ),
                Row(
                  children: [
                    buttons("CLEAR"),
                    buttons("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
