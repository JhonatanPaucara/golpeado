import 'package:flutter/material.dart';
import '../models/userData.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String loadingMsg = '';
  final _formKey = GlobalKey<FormState>();
  UserData _currentUser = new UserData();
  void _setMsg(text) {
    setState(() {
      loadingMsg = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("fondo.jpg"), fit: BoxFit.cover)),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("cartas.png"))),
              padding: EdgeInsets.all(10.0),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            labelText: 'Type your Name',
                            filled: true,
                            fillColor: Colors.white70),
                        validator: (name) {
                          if (name == '' || name == null) {
                            return 'You must enter your name';
                          }
                          _currentUser.name = name;
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            labelText: 'Type your last name',
                            filled: true,
                            fillColor: Colors.white70),
                        validator: (lastName) {
                          if (lastName == '' || lastName == null) {
                            return 'You must enter your last name';
                          }
                          _currentUser.lastName = lastName;
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            labelText: 'Input your age',
                            filled: true,
                            fillColor: Colors.white70),
                        keyboardType: TextInputType.number,
                        validator: (age) {
                          if (age == '' || age == null) {
                            return 'User must enter your age';
                          }
                          if (int.parse(age) < 6) {
                            return 'User must be more than 5 years old';
                          }
                          _currentUser.age = int.parse(age);
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            labelText: 'Input a UserName',
                            filled: true,
                            fillColor: Colors.white70),
                        validator: (userName) {
                          if (userName.length < 5 ||
                              userName == '' ||
                              userName == null) {
                            return 'User Name should have at least 5 characters';
                          }
                          _currentUser.userName = userName;
                          return null;
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                        color: _formKey.currentState == null
                            ? Colors.grey
                            : (_formKey.currentState.validate()
                                ? Colors.orange
                                : Colors.grey),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _setMsg('Welcome ' + _currentUser.userName);
                            print(
                                'Processing Data of ${_currentUser.userName}');
                          } else {
                            print('error XD');
                          }
                        },
                        child: Text('Submit')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
