import 'package:flutter/foundation.dart';

class MathFunctions with ChangeNotifier {
  String input1_str;
  String input2_str;
  String answer_str;
  String operator_sign;

  MathFunctions({
    @required this.input1_str,
    @required this.input2_str,
    @required this.answer_str,
  });

  Future<String> minus_input(input1_str, input2_str) async {
    var answer_int = double.parse(input1_str) - double.parse(input2_str);
    print(answer_int.toStringAsFixed(3));
    answer_str = answer_int.toStringAsFixed(3);

    // showAnswer(answer_str, "-");
    print("Answer: " + answer_str + "Operator: -");

    notifyListeners();
    //return answer_str;
    //notifyListeners();
  }

  multiply_input(input1_str, input2_str) {
    var answer_int = double.parse(input1_str) * double.parse(input2_str);
    print(answer_int.toStringAsFixed(3));
    answer_str = answer_int.toStringAsFixed(3);
    // showAnswer(answer_str, "*");
  }

  divide_input(input1_str, input2_str) {
    var answer_int = double.parse(input1_str) / double.parse(input2_str);
    print(answer_int.toStringAsFixed(3));
    answer_str = answer_int.toStringAsFixed(3);
    // showAnswer(answer_str, "/");
  }

  add_input(input1_str, input2_str) {
    var answer_int = double.parse(input1_str) + double.parse(input2_str);
    print(answer_int.toStringAsFixed(3));
    answer_str = answer_int.toStringAsFixed(3);
    // showAnswer(answer_str, "+");
    // return answer_str;
  }
}
