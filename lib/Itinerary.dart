import 'package:flutter/material.dart';
import 'package:space_travel/main.dart';
import 'package:space_travel/pellet.dart';
import 'package:space_travel/Event.dart';

import './globals.dart';
import './BoxWidgets.dart';
import './pellet.dart';

class Itinerary extends StatefulWidget {
  final String image;
  final String place;
  final String dates;
  final double mediaWidth;
  final double mediaHeight;

  const Itinerary(
      {Key? key,
      required this.image,
      required this.place,
      this.dates = '',
      required this.mediaWidth,
      required this.mediaHeight})
      : super(key: key);

  @override
  _ItineraryState createState() => _ItineraryState();
}

class _ItineraryState extends State<Itinerary> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SF'),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: triColor,
          body: Container(
            width: widget.mediaWidth,
            height: widget.mediaHeight,
            child: Column(
              children: [
                Stack(
                  children: [
                    Material(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          },
                          child: BoxWidgets(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: triColor,
                            ),
                            height: 50,
                            width: 50,
                          ),
                        ),
                        BoxWidgets(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.edit,
                            color: triColor,
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 15,
                      top: 50,
                      child: Text(
                        widget.place,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: triColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 15,
                      child: Text(
                        widget.dates,
                        style: TextStyle(color: triColor, fontSize: 16),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      top: 140,
                      right: 15,
                      bottom: 0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: const [
                            Pellet(text: 'Paris 12.01'),
                            Pellet(text: 'Paris 13.01'),
                            Pellet(text: 'Paris 14.01'),
                            Pellet(text: 'Paris 15.01'),
                            Pellet(text: 'Paris 16.01'),
                            Pellet(text: 'Paris 17.01'),
                            Pellet(text: 'Paris 18.01'),
                            Pellet(text: 'Paris 19.01'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.only(left: 15),
                        clipBehavior: Clip.hardEdge,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: const [
                          SizedBox(height: 20),
                          Event(
                            arrivalTime: '6:00',
                            location: '95700 Roissy-en-France, France',
                            sight: 'Paris Charles de Gaulle Airport',
                            sightImage: 'images/Paris/airport.jpg',
                            timeSpent: '1h 00m',
                            eventType: Icons.train,
                          ),
                          SizedBox(height: 20),
                          Event(
                              arrivalTime: '7:00',
                              timeSpent: '3h 00m',
                              sight: 'Hôtel R de Paris - Boutique Hotel',
                              location: '41 Rue de Clichy, 75009 Paris, France',
                              sightImage: 'images/Paris/hotelRparis.jpg',
                              eventType: Icons.hotel),
                          SizedBox(height: 20),
                          Event(
                              arrivalTime: '10:00',
                              timeSpent: '1h 30m',
                              sight: 'Musée d\'Orsay',
                              location:
                                  '1 Rue de la Légion d\'Honneur, 75007 Paris, France',
                              sightImage: 'images/Paris/Museed.jpg',
                              eventType: Icons.museum),
                          SizedBox(height: 20),
                          Event(
                              arrivalTime: '11:30',
                              timeSpent: '1h 30m',
                              sight: 'Cathédrale Notre-Dame de Paris',
                              location:
                                  '6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France',
                              sightImage: 'images/Paris/norte.jpg',
                              eventType: Icons.place),
                          SizedBox(height: 20),
                          Event(
                              arrivalTime: '13.00',
                              timeSpent: '2h 00m',
                              sight: 'Eiffel Tower',
                              location: 'Paris, France',
                              sightImage: 'images/Paris/eiffel.jpg',
                              eventType: Icons.place),
                          SizedBox(height: 20),
                          Event(
                              arrivalTime: '15:00',
                              timeSpent: '2h 00m',
                              sight: 'Louvre Museum',
                              location: 'Rue de Rivoli, 75001 Paris, France',
                              sightImage: 'images/Paris/louvre.jpg',
                              eventType: Icons.museum),
                          SizedBox(height: 20),
                          Event(
                              arrivalTime: '17:00',
                              timeSpent: '2h 00m',
                              sight: 'Boutary',
                              location: '25 Rue Mazarine, 75006 Paris, France',
                              sightImage: 'images/Paris/boutary.jpg',
                              eventType: Icons.restaurant)
                        ],
                      ),
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: FloatingActionButton(
                          onPressed: () => {},
                          child: Icon(Icons.add),
                          backgroundColor: mainColor,
                          clipBehavior: Clip.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
