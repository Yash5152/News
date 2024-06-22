import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Handle the form submission logic here
      print('Form submitted: ${_textController.text}');
    }
  }

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
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Center(
              child: Container(
                child: LottieBuilder.asset(
                  "assets/images/Animation - 1717078793190.json",
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Please rate your experience",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20),
            EmojiFeedback(
              emojiPreset: classicEmojiPreset,
              initialRating: 3,
              animDuration: const Duration(milliseconds: 300),
              curve: Curves.bounceOut,
              inactiveElementScale: .5,
            ),
            SizedBox(height: 20),
            Text(
              "Additional Comment",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _textController,
              maxLines: 3,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Text field is blank';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _handleSubmit,
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
          ],
        ),
      ),
    );
  }

  Widget buildLandscape() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  child: LottieBuilder.asset(
                    "assets/images/Animation - 1717078793190.json",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Please rate your experience",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                        EmojiFeedback(
                          emojiPreset: classicEmojiPreset,
                          initialRating: 3,
                          animDuration: const Duration(milliseconds: 300),
                          curve: Curves.bounceOut,
                          inactiveElementScale: .5,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Additional Comment",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _textController,
                          maxLines: 3,
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.0,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Text field is blank';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: _handleSubmit,
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
                      ],
                    ),
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
