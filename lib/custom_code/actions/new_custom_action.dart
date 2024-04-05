// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future newCustomAction() async {
  // Hide buttons behind the Radio button.
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      bool _showButtons = false;
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Custom Action"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: _showButtons,
                      onChanged: (value) {
                        setState(() {
                          _showButtons = value;
                        });
                      },
                    ),
                    Text("Show Buttons"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: _showButtons,
                      onChanged: (value) {
                        setState(() {
                          _showButtons = value;
                        });
                      },
                    ),
                    Text("Hide Buttons"),
                  ],
                ),
                if (_showButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        child: Text("Button 1"),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        child: Text("Button 2"),
                        onPressed: () {},
                      ),
                    ],
                  ),
              ],
            ),
            actions: [
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
