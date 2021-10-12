import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<int>? _characterCount;

  int? _stringIndex;
  static const List<String> _kStrings = const <String>['Kumar\nSunil'];
  String get _currentString =>
      _kStrings[(_stringIndex ?? 0) % _kStrings.length];
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    setState(() {
      _stringIndex = _stringIndex == null ? 0 : (_stringIndex ?? 0) + 1;
      _characterCount = new StepTween(begin: 0, end: _currentString.length)
          .animate(
              new CurvedAnimation(parent: controller, curve: Curves.easeIn));
    });
    controller.forward();
    //controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    child: Container(),
                  ),
                  if (_characterCount != null)
                    AnimatedBuilder(
                      animation: _characterCount!,
                      builder: (BuildContext context, Widget? child) {
                        String text =
                            _currentString.substring(0, _characterCount!.value);
                        return Text(text,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 5.0));
                      },
                    ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Text(
                    '19-year old hybrid developer from Bhubaneswar with\n2+ years of work experience in Mobile and Web.',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white60,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.0),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 3,
            child: Center(
                child: Hero(
              tag: 'dp',
              child: Image.asset(
                'assets/images/dp.png',
              ),
            )),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
