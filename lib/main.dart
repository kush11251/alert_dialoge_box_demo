// ignore_for_file: prefer_const_constructors, avoid_print, prefer_adjacent_string_concatenation, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  var selected = ['', '', ''];
  var name = "Profile Name";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation AlertDialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final Future<ConfirmAction?> action =
                    await _asyncConfirmDialog(context, name, selected);
                print("Confirm Action $action");
              },
              child: const Text(
                "Show Alert",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ConfirmAction { Cancel, Accept }
Future<Future<ConfirmAction?>> _asyncConfirmDialog(
    BuildContext context, String name, List<String> selected) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        //title: Text('Delete This Contact?'),

        title: Image.asset(
          'assets/images/tick.png',
          height: 50,
          width: 50,
        ),
        content: Text('The request has been sent successfully to ${name}' +
            '\n\nHelp requested for: \n' +
            selected.join("\n")),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel Request'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          ElevatedButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
