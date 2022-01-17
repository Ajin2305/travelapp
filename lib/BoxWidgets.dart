import 'package:flutter/material.dart';

class BoxWidgets extends StatelessWidget {
  final Widget child;
  final double width, height;

  const BoxWidgets(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}
