import 'package:flutter/cupertino.dart';

class MyMathProvider extends ChangeNotifier {
  int answer = 0;

  void addInputs(input1, input2) {
    print("addInputs called!");
    print("Input1: " + input1.toString());
    print("Input2: " + input2.toString());
    // answer = input1 + input2;
    // print("answer: " + answer.toString());
    notifyListeners();
  }

  getanswer() => answer;
}
