import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class detailPage extends StatefulWidget {
  final String newsImage;
  final String newstitle;
  final String newsDescription;
  final String newsDate;
  final String newsAuthor;
  final String newstime;
  final String tag;

  const detailPage({
    super.key,
    required this.newsImage,
    required this.newstitle,
    required this.newsDescription,
    required this.newsDate,
    required this.newsAuthor,
    required this.newstime,
    required this.tag,
  });

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      )
          : CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            primary: true,
            floating: true,
            pinned: true,
            expandedHeight: 450,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.tag,
                child: ClipRRect(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.newsImage),
                        fit: BoxFit.fill,
                      ),
                    ),

                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        duration: Duration(milliseconds: 750),
                        child: Text(
                          widget.newstitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 750),
                        child: Text(
                          widget.newsDescription,
                          style: TextStyle(
                            color: Colors.black,
                            height: 1.4,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FadeInUp(
                            child: Text("- " + widget.newsAuthor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.newsDate),
                          Text(widget.newstime),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}
