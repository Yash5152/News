import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class logOut extends StatelessWidget {
  const logOut({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exit Confirmation'),
      content: Text('Are you sure you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'No',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text(
            'Yes',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
