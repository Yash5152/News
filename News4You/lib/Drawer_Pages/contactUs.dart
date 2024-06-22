import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class contactUs extends StatelessWidget {
  const contactUs({super.key});

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
          ),
        ),
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "If you have any inquiries get in touch with us. We'll be happy to help you.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Email (required)",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Phone Number (required)",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  cursorColor: Colors.blue,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: Icon(Icons.call),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Social media",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 300,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                        child: Container(
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/images/facebook.png",
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Facebook",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Drop us a message any time.",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                        child: Container(
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/images/x.png",
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Twitter",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Mention Us or DM for queries.",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                        child: Container(
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  "assets/images/linkedinn.png",
                                  fit: BoxFit.fitHeight,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "LinkedIn",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "Drop us a message any time.",
                                    style: TextStyle(
                                      color: Colors.grey,
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLandscape() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "       If you have any inquires get in touch with us. we'll be happy to help you.",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Email(required)",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Phone Number (required)",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5),
                    TextField(
                      cursorColor: Colors.blue,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: Icon(Icons.call),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Social media",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: Container(
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/images/facebook.png",
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Facebook",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Drop us a message any time.",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: Container(
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/images/x.png",
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Twitter",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Mention Us or DM for quaries.",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                    child: Container(
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/images/linkedinn.png",
                              fit: BoxFit.fitHeight,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Linkedin",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Drop us a message any time.",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 50.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
