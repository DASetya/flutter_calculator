import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "0";
  String _result = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String temp = "";

  Column keyPadFun() {
    List col = [
      ['7', '8', '9', 'X'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['C', '0', '.', '=']
    ];
    return Column(
      children: List.generate(
        col.length,
            (index) => _numberRow(col[index]),
      ),
    );
  }

  Widget _numberRow(List<String> button) {
    return Row(
      children: List.generate(
          button.length, (index) => _buttonBuilder(button[index])),
    );
  }

  Widget _buttonBuilder(String button) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      child: MaterialButton(
        onPressed: () => buttonPressed(button),
        child: Text(button,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        color: Colors.amber[100],
        height: 75.0,
        elevation: 20, //elevationSize ?? 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.blue)),
      ),
    );
  }

  buttonPressed(String button) {
    if(button == "C"){

      _result = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      temp = "";

    } else if (button == "+" || button == "-" || button == "/" || button == "X"){

      num1 = double.parse(result);

      operand = button;

      _result = "0";
      temp = num1.toString()+operand;
    } else if(button == "."){

      if(_result.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _result = _result + button;
      }

    } else if (button == "="){

      num2 = double.parse(result);

      if(operand == "+"){
        _result = (num1 + num2).toString();
      }
      if(operand == "-"){
        _result = (num1 - num2).toString();
      }
      if(operand == "X"){
        _result = (num1 * num2).toString();
      }
      if(operand == "/"){
        _result = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _result = _result + button;
      temp = temp + button;
    }

    print(_result);

    setState(() {

      result = double.parse(_result).toString();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 230, 30, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(result,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    Text(temp,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                keyPadFun(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
