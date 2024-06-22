import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(
                    Icons.supervisor_account_sharp,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Divider(),
              // SizedBox(height: 30),
              Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Change Password",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Contant Setting",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Social",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Language",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Privacy and Security",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Icon(
                    Icons.notifications_active_rounded,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Notification",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Divider(),
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New For You",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        CupertinoSwitch(
                          value: _lights,
                          onChanged: (bool value) {
                            setState(() {
                              _lights = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Account Activity",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        CupertinoSwitch(
                          value: _lights,
                          onChanged: (bool value) {
                            setState(() {
                              _lights = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Opportunity",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        CupertinoSwitch(
                          value: _lights,
                          onChanged: (bool value) {
                            setState(() {
                              _lights = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
                padding: EdgeInsets.symmetric(vertical: 6.5, horizontal: 50.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: Colors.black,
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
}