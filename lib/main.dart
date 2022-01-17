// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import './BoxWidgets.dart';
import './Places.dart';
import './globals.dart';
import './Itinerary.dart';

void main() => runApp(TravelApp());

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(fontFamily: 'SF'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> _sizeAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 0.75),
        weight: 100,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Trips',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  BoxWidgets(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.edit,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Active',
                style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                '1 trip',
                style: TextStyle(fontSize: 12, color: secColor),
              ),
              AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, _) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: GestureDetector(
                        onLongPress: () {
                          _controller.forward(from: 0.0);
                        },
                        onLongPressUp: () {
                          _controller.reverse(from: 1.0);
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Itinerary(
                                        image: 'images/paris.jpg',
                                        place: 'Paris',
                                        dates: '12 January - 25 January 2021',
                                        mediaHeight: size.height,
                                        mediaWidth: size.width,
                                      )));
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            children: [
                              Image.asset(
                                'images/paris.jpg',
                                height:
                                    0.41 * size.height * _sizeAnimation.value,
                                width: 0.85 * size.width * _sizeAnimation.value,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: (0.41 *
                                        size.height *
                                        _sizeAnimation.value) /
                                    10,
                                left: (0.41 *
                                        size.height *
                                        _sizeAnimation.value) /
                                    20,
                                child: Text(
                                  'Paris',
                                  style: TextStyle(
                                      color: triColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16 * _sizeAnimation.value),
                                ),
                              ),
                              Positioned(
                                bottom: (0.41 *
                                        size.height *
                                        _sizeAnimation.value) /
                                    30,
                                left: (0.41 *
                                        size.height *
                                        _sizeAnimation.value) /
                                    20,
                                child: Text(
                                  '12 January - 25 January 2021',
                                  style: TextStyle(
                                      color: triColor,
                                      fontSize: 14 * _sizeAnimation.value),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Past',
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '4 trips',
                          style: TextStyle(fontSize: 12, color: secColor),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width * 0.44),
                    Column(
                      children: [
                        Text(
                          'Upcoming',
                          style: TextStyle(
                              fontSize: 20,
                              color: mainColor,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '4 Trips',
                          style: TextStyle(fontSize: 12, color: secColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                physics: BouncingScrollPhysics(),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Places(
                      image: 'images/amsterdam.jpg',
                      place: 'Amsterdam',
                      mediaHeight: size.height,
                      mediaWidth: size.width,
                    ),
                    Places(
                      image: 'images/barcelona.jpg',
                      place: 'Barcelona',
                      mediaHeight: size.height,
                      mediaWidth: size.width,
                    ),
                    Places(
                      image: 'images/Delhi.png',
                      place: 'Delhi',
                      mediaHeight: size.height,
                      mediaWidth: size.width,
                    ),
                    Places(
                      image: 'images/dubai.jpg',
                      place: 'Dubai',
                      mediaHeight: size.height,
                      mediaWidth: size.width,
                    ),
                    Places(
                      image: 'images/manila.jpg',
                      place: 'Manila',
                      mediaHeight: size.height,
                      mediaWidth: size.width,
                    ),
                    Places(
                      image: 'images/johannesburg.jpg',
                      place: 'Johannesburg',
                      mediaHeight: size.height,
                      mediaWidth: size.width,
                    ),
                    Places(
                      image: 'images/singapore.jpg',
                      place: 'Singapore',
                      mediaHeight: size.height,
                      mediaWidth: size.width,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
