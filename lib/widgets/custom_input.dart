
///
/// Project name : Umenoki
/// Description : The class is defined the custom input field for setting page.
/// Author : Xiao
/// Date : 2020-04-26
///

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;

  InputField({this.label, this.content = ''});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(top:5, bottom: 5),
          child: Row(
            children: <Widget>[
            Container(
              child: Text(
                "$label",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 40.0,
              child: TextField(
                style: TextStyle(
                  fontSize: 17.0,
                ),
              
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(35.0),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                  filled: false,
                  hintText: "$content",
                ),
              ),
            ),
          ],
          ),
        );
      },
    );
  }
}
