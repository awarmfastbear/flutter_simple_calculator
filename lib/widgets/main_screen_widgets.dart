import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_mobile_calculator_app/providers/math_provider.dart';

class AddButton extends StatelessWidget {
  final String _input1Str;
  final String _input2Str;

  AddButton(this._input1Str, this._input2Str);

  get input1Str => _input1Str;

  get input2Str => _input2Str;

  @override
  Widget build(BuildContext context) {
    final math_provider = Provider.of<MyMathProvider>(context);
    var tmp1 = _input1Str;
    var tmp2 = _input2Str;
    return IconButton(
        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
        icon: FaIcon(FontAwesomeIcons.plus),
        iconSize: 40,
        onPressed: () {
          math_provider.addInputs(tmp1, tmp2);
        });
  }
}
