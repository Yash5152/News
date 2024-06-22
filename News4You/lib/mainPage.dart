import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:badges/badges.dart' as badges;
import 'package:news4you/Drawer_Pages/aboutUs.dart';
import 'package:news4you/Drawer_Pages/contactUs.dart';
import 'package:news4you/Drawer_Pages/feedback.dart';
import 'package:news4you/Drawer_Pages/logOut.dart';
import 'package:news4you/Drawer_Pages/myProfile.dart';
import 'package:news4you/Drawer_Pages/seting.dart';
import 'package:news4you/Pages/notification.dart';
import 'package:news4you/detailsPage.dart';

class Newsapp extends StatefulWidget {
  const Newsapp({Key? key}) : super(key: key);

  @override
  State<Newsapp> createState() => _NewsappState();
}

class _NewsappState extends State<Newsapp> {
  String data = "";
  var newsdata;
  bool isLoading = true;
  String category = "National"; // Initialize with default category

  @override
  void initState() {
    super.initState();
    getData("national"); // Initially fetch national news
  }

  Future<void> getData(String category) async {
    setState(() {
      isLoading = true;
      this.category = category; // Update the category state
    });

    http.Response response = await http.get(
      Uri.parse("https://inshortsapi.vercel.app/news?category=$category"),
    );

    if (response.statusCode == 200) {
      data = response.body;
      setState(() {
        newsdata = jsonDecode(data)["data"];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Handle error
      print("Failed to fetch data. Status code: ${response.statusCode}");
    }
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  int _current = 2;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog(context) ?? false;
      },
      child: DefaultTabController(
        length: 11,
        child: Scaffold(
          key: _key,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 48.0),
            child: ClipRRect(
              child: AppBar(
                centerTitle: true,
                titleSpacing: 0.0,
                bottom: TabBar(
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'National'),
                    Tab(text: 'Business'),
                    Tab(text: 'Sports'),
                    Tab(text: 'World'),
                    Tab(text: 'Politics'),
                    Tab(text: 'Technology'),
                    Tab(text: 'Startup'),
                    Tab(text: 'Entertainment'),
                    Tab(text: 'Miscellaneous'),
                    Tab(text: 'Hatke'),
                    Tab(text: 'Science'),
                  ],
                  onTap: (index) {
                    String category = [
                      'national',
                      'business',
                      'sports',
                      'world',
                      'politics',
                      'technology',
                      'startup',
                      'entertainment',
                      'miscellaneous',
                      'hatke',
                      'science',
                    ][index];
                    getData(category);
                  },
                ),
                flexibleSpace: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                elevation: 0,
                backgroundColor: Colors.white.withAlpha(100),
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
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: badges.Badge(
                      position:
                      badges.BadgePosition.bottomEnd(bottom: 10, end: -10),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.blue,
                      ),
                      badgeContent: Text(
                        '7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationPage()),
                          );
                        },
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: _buildDrawer(),
          body: isLoading
              ? Center(
            child: SpinKitSpinningLines(
              color: Colors.blue,
              size: 50.0,
            ),
          )
              : RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            color: Colors.blue,
            onRefresh: () => getData(category),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Expanded(
                              child: TextField(
                                cursorColor: Colors.blue,
                                decoration: InputDecoration(
                                  focusColor: Colors.blue,
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.blue,
                                  ),
                                  hintText: 'Search Latest News',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                            height: 200,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 3,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 4),
                            autoPlayAnimationDuration:
                            Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          items: newsdata.map<Widget>((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: width,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 7.5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(20.0),
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        Image.network(
                                          item["imageUrl"],
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black12
                                                    .withOpacity(0),
                                                Colors.black,
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                              vertical: 5),
                                          child: Text(
                                            item["title"],
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          List.generate(newsdata.length, (index) {
                            return GestureDetector(
                              onTap: () =>
                                  _controller.animateToPage(index),
                              child: Container(
                                width: width / 30,
                                height: 5.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Colors.white
                                      : Colors.blue)
                                      .withOpacity(
                                      _current == index ? 0.9 : 0.4),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${category[0].toUpperCase()}${category.substring(1)} News",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: newsdata == null ? 0 : newsdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detailPage(
                                  newsImage: newsdata[index]["imageUrl"],
                                  newstitle: newsdata[index]["title"],
                                  newsDescription: newsdata[index]
                                  ["content"],
                                  newsDate: newsdata[index]["date"],
                                  newsAuthor: newsdata[index]["author"],
                                  newstime: newsdata[index]["time"],
                                  tag: "newsImage$index",
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: EdgeInsets.only(
                                top: 8.0,
                                left: 7.5,
                                bottom: 6.0,
                                right: 7.5),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Hero(
                                      tag: "newsImage$index",
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                        ),
                                        child: Image.network(
                                          newsdata[index]["imageUrl"],
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 175,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.0,
                                            top: 0,
                                            right: 0.0,
                                            bottom: 5.0),
                                        child: Text(
                                          newsdata[index]["author"],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 0.0,
                                            top: 0,
                                            right: 5.0,
                                            bottom: 5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(50.0),
                                          child: Container(
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 7.5,
                                                  top: 3.0,
                                                  right: 7.5,
                                                  bottom:
                                                  3.0), // Adjust padding as needed
                                              child: Text(
                                                newsdata[index]["date"],
                                                style: TextStyle(
                                                  color:
                                                  Color(0xff000000),
                                                  fontWeight:
                                                  FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 0, right: 0.0),
                                  child: Text(
                                    newsdata[index]["title"],
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 0, right: 10.0),
                                  child: Text(
                                    newsdata[index]["content"],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 0, right: 0.0),
                                  child: Text(
                                    newsdata[index]["time"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildDrawer() {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return ClipPath(
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: isPortrait
                ? BorderRadius.only(
              topRight: Radius.circular(50.0),
              bottomRight: Radius.circular(500.0),
            )
                : BorderRadius.only(
              topRight: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0), // Removed extra 0
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
              ),
            ],
          ),
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                InstaImageViewer(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(45),
                      child: Image.asset(
                        "assets/images/Deadpool.jpg",
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Yash",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "patharyash368@gmail.com",
                  style: TextStyle(color: active, fontSize: 16.0),
                ),
                SizedBox(height: 30.0),
                InkWell(
                  onTap: () {
                    _key.currentState!.closeDrawer();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(children: [
                      Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "Home",
                        style: TextStyle(color: Colors.black),
                      ),
                    ]),
                  ),
                ),
                _buildDivider(),
                _buildRow(Icons.manage_accounts, "My Profile", myProfile()),
                _buildDivider(),
                _buildRow(Icons.feedback, "Feedback", FeedbackScreen()),
                _buildDivider(),
                _buildRow(Icons.contact_mail, "Contact Us", contactUs()),
                _buildDivider(),
                _buildRow(Icons.settings, "Setting", setting()),
                _buildDivider(),
                _buildRow(Icons.account_balance, "About Us", aboutUs()),
                _buildDivider(),
                _buildRow(Icons.exit_to_app, "Exit",  logOut()),
                _buildDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title, Widget page,
      {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(children: [
          Icon(
            icon,
            color: active,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
        ]),
      ),
    );
  }
}

Future<bool?> _showExitConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Exit Confirmation'),
      content: Text('Are you sure you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No',style: TextStyle(color: Colors.blue),),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes',style: TextStyle(color: Colors.blue),),
        ),
      ],
    ),
  );
}
