// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(142, 170, 251, 1),
      body: Column(
        children: [
          Container(
            width: 344,
            margin: EdgeInsets.fromLTRB(20, 80, 10, 160),
            child: Text(
              'Get Started',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 100),
            child: IntlPhoneField(
              keyboardType: TextInputType.phone,
              inputFormatters: [],
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(244, 245, 255, 0.4),
                hintText: '(123) 123-1234',
                border: null,
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 300),
            width: 50,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _hasBeenPressed
                    ? Colors.white
                    : Color.fromRGBO(244, 245, 255, 0.4),
                padding: EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                print('123');
                setState(() {
                  _hasBeenPressed = !_hasBeenPressed;
                });
              },
              child: Container(
                child: Icon(
                  Icons.arrow_forward,
                  color: _hasBeenPressed
                      ? Color.fromRGBO(89, 76, 116, 1)
                      : Color.fromRGBO(120, 134, 184, 1),
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
