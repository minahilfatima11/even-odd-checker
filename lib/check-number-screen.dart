import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberCheckScreen(),
    );
  }
}

class NumberCheckScreen extends StatefulWidget {
  @override
  _NumberCheckScreenState createState() => _NumberCheckScreenState();
}

class _NumberCheckScreenState extends State<NumberCheckScreen> {
  final TextEditingController _controller = TextEditingController();
  String _message = '';

  void _checkNumber() {
    final inputText = _controller.text;
    if (inputText.isEmpty) {
      setState(() {
        _message = 'Please enter a number';
      });
      return;
    }
    final number = int.tryParse(inputText);
    if (number == null) {
      setState(() {
        _message = 'Please enter a valid number';
      });
      return;
    }
    setState(() {
      _message = (number % 2 == 0)
          ? '$number is an Even number'
          : '$number is an Odd number';
    });
  }

  void _reset() {
    setState(() {
      _controller.clear();
      _message = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA8E3DA),
        title: Text(
          'Even or Odd Checker',
          style: TextStyle(color: Color(0xFF00BFA6), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Color(0xFF00BFA6)),
            onPressed: _reset,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3FDFD),
              Color(0xFFCBF1F5),
              Color(0xFFA6E3E9),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter a number to check:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00BFA6),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter a number',
                    hintStyle: TextStyle(color: Colors.black54),
                    filled: true,

                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00BFA6), width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  style: TextStyle(color: Color(0xFF00BFA6)),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA8E3DA),
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Check Number',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00BFA6),
                  ),
                ),
              ),
              SizedBox(height: 20),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(16),
                width: 264,
                decoration: BoxDecoration(
                  color: Color(0xFFA8E3DA).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(2, 4),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Text(
                  _message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00BFA6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
