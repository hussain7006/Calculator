import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";
  clear() {
    setState(() {
      result = "";
    });
  }

  compile() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  Widget button(text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          result += text;
        });
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 20),
        minimumSize: Size(80.0, 80.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            width: 8,
            color: Colors.green,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              display(result),
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: clear,
                  child: Text("CLEAR"),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20),
                    // minimumSize: Size(335.0, 80.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button("7"),
                  button("8"),
                  button("9"),
                  button("+"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button("4"),
                  button("5"),
                  button("6"),
                  button("-"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button("1"),
                  button("2"),
                  button("3"),
                  button("*"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button("."),
                  button("0"),
                  ElevatedButton(
                    onPressed: compile,
                    child: Text("="),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      minimumSize: Size(80.0, 80.0),
                    ),
                  ),
                  button("/"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget display(result) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      border: Border.all(
        width: 8,
        color: Colors.black,
      ),
    ),
    child: Text(
      result,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.clip,
    ),
  );
}
