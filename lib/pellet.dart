import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:space_travel/globals.dart';

class Pellet extends StatelessWidget {
  final String text;
  final double width, height;

  const Pellet(
      {Key? key, required this.text, this.width = 120.0, this.height = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: triColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
