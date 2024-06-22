import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class InternetOffPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 100.0,
              color: Colors.red,
            ),
            SizedBox(height: 20.0),
            Text(
              'No internet connection',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}