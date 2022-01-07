import 'package:flutter/material.dart';
import 'package:greenproject/Screens/Login/login_page.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return welcomePageState();
  }
}

// ignore: camel_case_types
class welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              //Background

              child: Stack(
                children: [
                  const AnimatedGradient(),
                  const Positioned(
                      child: Align(
                          alignment: FractionalOffset(0.5, 0.0),
                          child: animation_1())),
                  //Introduction Message
                  Positioned(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Align(
                              child: Container(
                                  width: 300,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 3.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                  ),
                                  alignment: const FractionalOffset(0.5, 0.5),
                                  child: const Text(
                                      'Welcome to Green View, the place for the latest environmental information!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)))))),

                  //"Get Started" elevated button
                  Positioned(
                    child: Align(
                      alignment: const FractionalOffset(0.5, 0.8),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                              textStyle: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                              fixedSize: const Size(240.0, 80.0),
                              side: const BorderSide(
                                  width: 3.0, color: Colors.black),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0))),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const loginScreen();
                            }));
                          },
                          child: const Text('Get Started!',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 25))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Logo Slide Animation
class animation_1 extends StatefulWidget {
  const animation_1({Key? key}) : super(key: key);

  @override
  animation_1State createState() => animation_1State();
}

class animation_1State extends State<animation_1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        //Repeats Animation and makes it reverse after after completed duration.
        ..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0, 0.03),
  ).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _animation,
        child: Image.asset('assets/images/green view MATT-01.png'));
  }
}

//Animated Background
class AnimatedGradient extends StatefulWidget {
  const AnimatedGradient({Key? key}) : super(key: key);

  @override
  _AnimatedGradientState createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
  List<Color> colorList = [
    Colors.yellow[200]!,
    Colors.green[200]!,
    Colors.lightGreen,
    Colors.lightBlueAccent,
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.lightBlueAccent;
  Color topColor = Colors.yellow[200]!;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        bottomColor = colorList[index % colorList.length];
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            onEnd: () {
              setState(() {
                index = index + 1;
                bottomColor = colorList[index % colorList.length];
                topColor = colorList[(index + 1) % colorList.length];
              });
            },
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: begin, end: end, colors: [bottomColor, topColor])),
          ),
        ],
      ),
    );
  }
}
