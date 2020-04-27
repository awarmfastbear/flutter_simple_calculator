import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'inputGiven.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String input1_str;
  String input2_str;
  String answer_str;
  int histIndex = 0;
  Map historyMap;
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  InputGiven _inputGiven;
  List history_list = [
    InputGiven(input1: null, input2: null, operator_sign: null, answer: null)
  ];

  @override
  void initState() {
    input1_str = '';
    input2_str = '';
    answer_str = '';
    history_list.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // take input1_str, input2_str, press a button, show answer

    printInputs<String>() {
      setState(() {
        print(input1_str);
        print(input2_str);
        print("boop");
      });
    }

    addToHistory(operator_sign) {
      setState(
        () {
          histIndex = histIndex + 1;
          history_list.add(
            InputGiven(
                input1: '$input1_str',
                operator_sign: operator_sign,
                input2: '$input2_str',
                answer: '$answer_str'),
          );
        },
      );
    }

    showAnswer<String>(answer_str, operator_sign) {
      //printInputs();
      addToHistory(operator_sign);
      setState(() {
        answer_str = answer_str;
      });
      return answer_str.toString();
    }

    minus_input(input1_str, input2_str) {
      var answer_int = double.parse(input1_str) - double.parse(input2_str);
      print(answer_int.toStringAsFixed(3));
      answer_str = answer_int.toStringAsFixed(3);
      showAnswer(answer_str, "-");
    }

    multiply_input(input1_str, input2_str) {
      var answer_int = double.parse(input1_str) * double.parse(input2_str);
      print(answer_int.toStringAsFixed(3));
      answer_str = answer_int.toStringAsFixed(3);
      showAnswer(answer_str, "*");
    }

    divide_input(input1_str, input2_str) {
      var answer_int = double.parse(input1_str) / double.parse(input2_str);
      print(answer_int.toStringAsFixed(3));
      answer_str = answer_int.toStringAsFixed(3);
      showAnswer(answer_str, "/");
    }

    add_input(input1_str, input2_str) {
      var answer_int = double.parse(input1_str) + double.parse(input2_str);
      print(answer_int.toStringAsFixed(3));
      answer_str = answer_int.toStringAsFixed(3);
      showAnswer(answer_str, "+");
      // return answer_str;
    }

    Widget titleSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
          child: Text(
            "Provide your input below and select your operator.",
            style: TextStyle(fontSize: 15),
          ),
        )
      ],
    );
    Widget inputSection = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Container(
            width: 80,
            height: 80,
            color: Colors.amber,
            child: TextField(
              textAlign: TextAlign.center,
              controller: _controller1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[ -,]'))],
              onChanged: (input) => {
                setState(() {
                  input1_str = input;
                })
              },
              //keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  helperText: '  Number 1',
                  helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  labelStyle: TextStyle(
                    fontSize: 19,
                  )),
            ),
          ),
        ),
        Flexible(
          child: Container(
            width: 80,
            height: 80,
            color: Colors.amber,
            child: TextField(
              textAlign: TextAlign.center,
              controller: _controller2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[ -,]'))],
              onChanged: (input) => {
                setState(() {
                  input2_str = input;
                })
              },
              decoration: InputDecoration(
                  helperText: '  Number 2',
                  helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  labelStyle: TextStyle(
                    fontSize: 19,
                  )),
            ),
          ),
        ),
        Column(children: <Widget>[
          Text("Clear Input:"),
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.snowplow,
                  textDirection: TextDirection.rtl,
                ),
                onPressed: () {
                  setState(() {
                    _controller1.clear();
                    _controller2.clear();
                  });
                }),
          ),
        ]),
      ],
    ));
    Widget divider = Divider(
      height: 20,
      thickness: 2,
    );
    Widget sizedBox = SizedBox(
      height: 0,
    );
    Widget functionSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: FaIcon(FontAwesomeIcons.plus),
              iconSize: 40,
              onPressed: () {
                add_input(input1_str, input2_str);
              }),
          IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: FaIcon(FontAwesomeIcons.minus),
              iconSize: 40,
              onPressed: () {
                minus_input(input1_str, input2_str);
              }),
          IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: FaIcon(FontAwesomeIcons.times),
              iconSize: 40,
              onPressed: () {
                multiply_input(input1_str, input2_str);
              }),
          IconButton(
              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
              icon: FaIcon(FontAwesomeIcons.divide),
              iconSize: 40,
              onPressed: () {
                divide_input(input1_str, input2_str);
              }),
        ],
      ),
    );
    Widget answerSection = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Answer:",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text(
                answer_str,
                style: TextStyle(fontSize: 25),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        )
      ],
    );
    Widget historySection = Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'History: ',
              ),
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
            ),
          ],
        ),
        Divider(
          thickness: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (history_list[index].answer != null) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                          )),
                          child: Row(children: [
                            Text('Input:',
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
                            Text(
                              '${history_list[index].input1} ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${history_list[index].operator_sign} ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${history_list[index].input2} ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' = ${history_list[index].answer}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ),
                        Divider(
                          thickness: 2,
                        )
                      ],
                    );
                  } else {
                    return Text('Waiting..');
                  }
                },
                itemCount: history_list.length,
              ),
            )
          ],
        ),
      ],
    );

    return MaterialApp(
      title: 'Simple Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple Calculator"),
          actions: <Widget>[
            IconButton(
              tooltip: "Clear: ",
              icon: Icon(Icons.clear),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: ListView(
            children: [
              titleSection,
              inputSection,
              divider,
              sizedBox,
              functionSection,
              answerSection,
              historySection,
            ],
          ),
        ),
      ),
    );
  }
}
