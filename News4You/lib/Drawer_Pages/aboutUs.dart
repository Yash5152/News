import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
}

Widget buildPortrait() {
  final String appVersion = '1.0.0'; // App version

  return SingleChildScrollView(
    child: Center(
      child: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              InstaImageViewer(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.black,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/app_image.png',
                      fit: BoxFit.cover,
                      width: 160.0,
                      height: 160.0,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0),
              Text.rich(
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
              ),
              SizedBox(height: 10.0),
              Text(
                "Version: $appVersion",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Welcome to NEWS4U, your source for real-time news and in-depth stories. Enjoy personalized feeds and multimedia experiences on politics, business, tech, health, and more. Stay informed and connected with us every day.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, height: 1.25),
              ),
              SizedBox(height: 20.0),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(height: 10.0),
              Text(
                'Contact us',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "patharyash368@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildLandscape() {
  final String appVersion = '1.0.0'; // App version

  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InstaImageViewer(
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.black,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/app_image.png',
                          fit: BoxFit.cover,
                          width: 160.0,
                          height: 160.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text.rich(
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
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Version: $appVersion",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to NEWS4U, your source for real-time news and in-depth stories. Enjoy personalized feeds and multimedia experiences on politics, business, tech, health, and more. Stay informed and connected with us every day.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, height: 1.25),
                  ),
                  SizedBox(height: 20.0),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Contact us',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "patharyash368@gmail.com",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
