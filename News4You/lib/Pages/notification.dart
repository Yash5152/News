import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "NEWS",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: "4",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  TextSpan(
                    text: "U",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildPortrait()
              : buildLandscape();
        },
      ),
    );
  }

  Widget buildPortrait() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LottieBuilder.asset(
              "assets/images/no_notification.json",
            ),
            SizedBox(height: 20),
            const Text(
              "No Notification Yet",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              "Your notification will appear here once you've received them.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              "Missing Notification?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.5,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Go To Historical Notification",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget buildLandscape() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: LottieBuilder.asset(
                "assets/images/no_notification.json",
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "No Notification Yet",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Your notification will appear here once you've received them.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Missing Notification?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Go To Historical Notification",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
