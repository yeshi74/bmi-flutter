import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = '';
  String _finalResult = '';

  void _calculateBmi() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height*12;
      double weight = double.parse(_weightController.text);

      if((_ageController.text.isNotEmpty || age > 0)
        && ((_heightController.text.isNotEmpty || inches > 0)
          && (_weightController.text.isNotEmpty || weight > 0))) {
            result = weight / (inches * inches) * 703; //Our BMI

          if(double.parse(result.toStringAsFixed(1)) < 18.5) {
            _resultReading = 'Underweight';
            print(_resultReading);
          } else if (double.parse(result.toStringAsFixed(1)) >= 18.5
            && result < 25) {
              _resultReading = 'Great shape!';
            } else if (double.parse(result.toStringAsFixed(1)) >= 25.0
              && result < 30) {
                _resultReading = 'Overweight';
              } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
                _resultReading = 'Obese';
              }
          } else {
            result = 0.0;
          }
    });
    _finalResult = 'Your BMI: ${result.toStringAsFixed(1)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset(
              'images/bmilogo.png',
              height: 90.0,
            ),
            Container(
              margin: EdgeInsets.all(3.0),
              height: 255.0,
              width: 290.0,
              color: Colors.grey.shade300,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Age',
                      icon: Icon(Icons.person_outline),
                    ),
                  ),
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height in feet',
                      icon: Icon(Icons.insert_chart),
                    ),
                  ),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight in lb',
                      icon: Icon(Icons.line_weight),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.6),
                  ),
                  //calculate button
                  Container(
                    alignment: Alignment.topCenter,
                    child: RaisedButton(
                      onPressed: _calculateBmi,
                      color: Colors.pinkAccent,
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$_finalResult',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 19.9,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Text(
                  '$_resultReading',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 19.9,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
