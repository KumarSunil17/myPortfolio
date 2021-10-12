import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late PageController _pageController;
  double? width;
  double? height;
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _pageController.addListener(() {
      setState(() {
        scrollOffset = _pageController.offset.roundToDouble();
        scrollOffset =
            (scrollOffset * 100 / ((width ?? 1) * 3)) / 100.roundToDouble();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  animateToPage(int page) {
    _pageController.animateToPage(page,
        curve: Curves.easeInOut, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () async {
            if (await canLaunch(COMPANY_URL)) {
              await launch(COMPANY_URL);
            } else {
              throw 'Could not launch $COMPANY_URL';
            }
          },
          child: Image.asset('assets/images/logo.png',
              width: 100, fit: BoxFit.cover),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              if (await canLaunch(FACEBOOK_URL)) {
                await launch(FACEBOOK_URL);
              } else {
                throw 'Could not launch $FACEBOOK_URL';
              }
            },
            icon: Image.asset('assets/images/fb_logo.png'),
          ),
          IconButton(
            onPressed: () async {
              if (await canLaunch(LINKEDIN_URL)) {
                await launch(LINKEDIN_URL);
              } else {
                throw 'Could not launch $LINKEDIN_URL';
              }
            },
            icon: Image.asset('assets/images/linkedin_logo.png'),
          ),
          IconButton(
            onPressed: () async {
              if (await canLaunch(TWITTER_URL)) {
                await launch(TWITTER_URL);
              } else {
                throw 'Could not launch $TWITTER_URL';
              }
            },
            icon: Image.asset('assets/images/twitter_logo.png'),
          ),
        ],
      ),
      body: PageView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        pageSnapping: true,
        children: <Widget>[
          HomePage(),
          AboutPage(),
          Container(
              width: width,
              height: height,
              child: Center(
                child: Text(
                  'Works',
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Container(
              width: width,
              height: height,
              child: Center(
                child: Text(
                  'Social',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        // color: Colors.blueAccent.withOpacity(0.3),
        height: 50.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 20,
              left: 12,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        animateToPage(0);
                      },
                      child: Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      )),
                  GestureDetector(
                      onTap: () {
                        animateToPage(1);
                      },
                      child: Text(
                        'About',
                        style: TextStyle(color: Colors.white),
                      )),
                  GestureDetector(
                      onTap: () {
                        animateToPage(2);
                      },
                      child: Text(
                        'Works',
                        style: TextStyle(color: Colors.white),
                      )),
                  GestureDetector(
                      onTap: () {
                        animateToPage(3);
                      },
                      child: Text(
                        'Social',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
            Positioned(
              left: 10.0,
              right: 10.0,
              height: 5,
              bottom: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: LinearProgressIndicator(
                  value: scrollOffset,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
