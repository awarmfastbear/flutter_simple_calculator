import 'package:flutter/foundation.dart';

class InputGiven {
  final String answer;
  String input1;
  String input2;
  String operator_sign;

  InputGiven({
    @required this.input1,
    @required this.input2,
    @required this.operator_sign,
    @required this.answer,
  });
}
