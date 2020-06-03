

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umenoki/main.dart';
import 'package:umenoki/src/app_theme.dart';
import 'package:umenoki/src/pages/register_page.dart';
import 'package:umenoki/src/models/validator.dart';
import 'package:umenoki/src/models/auth.dart';

class SignPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _SignPageState();
}

class _SignPageState extends State<SignPage>{
  final _formKey = new GlobalKey<FormState>();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  bool _autoValidate = false;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          showForm(),
        ],
      )
    );
  }

  Widget showForm() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            showEmailInput(),
            showPasswordInput(),
            showLoginButton(),
            showRegisterLabel(),
          ],
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: AppTheme.nearlyRed,
          )
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter your email';
          } else if (!Validator.validateEmail(value)) {
            return 'The email is invalid';
          }
          return null;
        },
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        controller: _passwordController,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: AppTheme.nearlyRed,
          )
        ),
        validator: (String value) {
          if (value.isEmpty){
            return 'Please enter your password';
          } else if (value.length < 6) {
            return 'Password has to be more than 6 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget showLoginButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 45.0, 5.0, 0.0),
      child: SizedBox(
        height: 45.0,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: AppTheme.nearlyRed,
          child: Text('Log In',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
            )
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              Auth().signIn(_emailController.text, _passwordController.text).then((value) {
                scakey.currentState.onSetting('my_baby', 0);
              });
            }
          },
        ),
      )
    );
  }

  Widget showRegisterLabel() {
    return InkWell(
      onTap: () {
        scakey.currentState.onSetting('register', 0);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
                style: TextStyle(
                color: AppTheme.nearlyRed,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      ),
    );
  }
}