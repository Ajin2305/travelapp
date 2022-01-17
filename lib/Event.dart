import 'package:flutter/material.dart';
import 'package:space_travel/BoxWidgets.dart';
import 'package:space_travel/globals.dart';
import 'package:space_travel/main.dart';

class Event extends StatelessWidget {
  final String arrivalTime;
  final String timeSpent;
  final String sight;
  final String location;
  final String sightImage;
  final IconData eventType;

  const Event(
      {Key? key,
      required this.arrivalTime,
      required this.timeSpent,
      required this.sight,
      required this.location,
      required this.sightImage,
      required this.eventType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Row(
        children: [
          Column(
            children: [
              Text(
                arrivalTime,
                style: TextStyle(
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              Text(
                timeSpent,
                style: TextStyle(
                  color: secColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.5),
            child: SizedBox(
              width: 30,
              child: Icon(
                eventType,
                color: secColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.5),
            child: SizedBox(
              height: 75,
              width: 75,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(1, 4),
                    ),
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    sightImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              width: size.width * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sight,
                    style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    location,
                    style: TextStyle(color: secColor),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
