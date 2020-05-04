import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import './inputGiven.dart';
import './widgets/main_screen_widgets.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String input1_str;
    String input2_str;
    int histIndex = 0;
    Map historyMap;
    TextEditingController _controller1 = new TextEditingController();
    TextEditingController _controller2 = new TextEditingController();
    List history_list = [
      InputGiven(input1: null, input2: null, operator_sign: null, answer: null)
    ]; //final _helperFunctions = Provider.of<HelperFunctions>(context);
    //final answerProvider = Provider.of<Answer>(context);

    updateInput1(input) {
      print(input);
      input1_str = input;
      // setState(() {
      //   // this.input1_str = input;
      // });
    }

    updateInput2(input) {
      print(input);
      input2_str = input;
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
              decoration: InputDecoration(
                  helperText: '  Number 1',
                  helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  labelStyle: TextStyle(
                    fontSize: 19,
                  )),
              textAlign: TextAlign.center,
              controller: _controller1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[ -,]'))],
              onChanged: (input) {
                updateInput1(input);
              },
            ),
          ),
        ),
        Flexible(
          child: Container(
            width: 80,
            height: 80,
            color: Colors.amber,
            child: TextField(
              decoration: InputDecoration(
                  helperText: '  Number 2',
                  helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  labelStyle: TextStyle(
                    fontSize: 19,
                  )),
              textAlign: TextAlign.center,
              controller: _controller2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [BlacklistingTextInputFormatter(new RegExp('[ -,]'))],
              onChanged: (input) {
                updateInput2(input);
              },
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
                  _controller1.clear();
                  _controller2.clear();
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
          Container(
            child: AddButton(
              input1_str,
              input2_str,
            ),
          ),
          IconButton(
            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            icon: FaIcon(FontAwesomeIcons.minus),
            iconSize: 40,
            onPressed: null,
          ),
          IconButton(
            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            icon: FaIcon(FontAwesomeIcons.times),
            iconSize: 40,
            onPressed: null,
          ),
          IconButton(
            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            icon: FaIcon(FontAwesomeIcons.divide),
            iconSize: 40,
            onPressed: null,
          ),
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
              child: Text('currentAnswer'),
              // child: Consumer<Answer>(
              //     builder: (_, answer, __) => Text(
              //         answer.answer), //Text(${_answerProvider.getAnswer()}, )
              // child: Text(
              //   _helperFunctions.answer_str,
              //   style: TextStyle(fontSize: 25),
              //   overflow: TextOverflow.fade,
              // ),
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
    return Scaffold(
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
    );
  }
}
