import 'dart:io';

import 'package:flutter/material.dart';
import './globals.dart';

class Places extends StatefulWidget {
  final String image;
  final String place;
  final String dates;
  final double mediaHeight;
  final double mediaWidth;

  const Places(
      {Key? key,
      required this.image,
      required this.place,
      this.dates = '',
      required this.mediaHeight,
      required this.mediaWidth})
      : super(key: key);

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> with TickerProviderStateMixin {
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
        tween: Tween<double>(
            begin: widget.mediaWidth * 0.44,
            end: widget.mediaWidth * 0.44 * 0.8),
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
    return AnimatedBuilder(
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(1, 4))
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  borderOnForeground: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.image,
                        height: _sizeAnimation.value,
                        width: _sizeAnimation.value,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: _sizeAnimation.value / 10,
                        left: _sizeAnimation.value / 20,
                        child: Text(
                          widget.place,
                          style: TextStyle(
                              color: triColor,
                              fontWeight: FontWeight.bold,
                              fontSize: _sizeAnimation.value / 10),
                        ),
                      ),
                      Positioned(
                        bottom: _sizeAnimation.value / 30,
                        left: _sizeAnimation.value / 20,
                        child: Text(
                          widget.dates,
                          style: TextStyle(color: triColor, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
