import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:simple_mobile_calculator_app/inputGiven.dart';
import 'package:simple_mobile_calculator_app/main_screen.dart';

import 'providers/math_provider.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MyMathProvider(),
        ),
      ],
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
