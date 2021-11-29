import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './widgets/green_flat_button.dart';
import './widgets/red_flat_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizler',
      home: MyHomePage(title: 'Quizler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> _questionBank = const [
    {
      'question':
          'Is Yoriichi Tsugikuni the most powerful character in Demon Slayer?',
      'answer': 'Yes',
    },
    {
      'question': 'Does Zenitsu follow the water breathing style?',
      'answer': 'No',
    },
    {
      'question': 'Gyomei Himejima is the strongest demon slayer alive?',
      'answer': 'Yes',
    },
  ];

  var _index = 0;

  var _score = 0;

  List<Icon> _listOfIcons = [];

  void _submitAnswer(String givenAnswer) {
    if (_questionBank[_index]['answer'] == givenAnswer) {
      _score++;

      setState(() {
        _listOfIcons.add(Icon(
          Icons.check_sharp,
          color: Colors.green,
        ));
        if (_index < _questionBank.length - 1) {
          _index++;
        } else {
          _showEndingAlert();
          _restart();
        }
      });
    } else {
      setState(() {
        _listOfIcons.add(Icon(
          Icons.clear_sharp,
          color: Colors.red,
        ));
        if (_index < _questionBank.length - 1) {
          _index++;
        } else {
          _showEndingAlert();
          _restart();
        }
      });
    }
  }

  void _showEndingAlert() {
    Alert(context: context, title: "End of quiz", desc: "Score- $_score")
        .show();
  }

  void _restart() {
    setState(() {
      _listOfIcons = [];
      _index = 0;
      _score = 0;
    });
  }

  // bool _checkAnswer(String givenAnswer) {

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                _questionBank[_index]['question'],
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: GreenFlatBtn(_submitAnswer),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: RedFlatBtn(_submitAnswer),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            // color: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: Row(
              children: _listOfIcons,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
