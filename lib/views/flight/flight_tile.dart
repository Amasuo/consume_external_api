import 'package:flutter/material.dart';
import 'package:consume_external_api/models/flight_fromJSON.dart';
import 'package:get/get.dart';

class FlightTile extends StatelessWidget {
  final Datum flight;

  const FlightTile(this.flight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: Get.height/6,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                flight.itineraries[0].segments[0].departure.at.day.toString()+'-'+flight.itineraries[0].segments[0].departure.at.month.toString()+'-'+flight.itineraries[0].segments[0].departure.at.year.toString()+' - '+ flight.itineraries[0].segments[0].arrival.at.day.toString()+'-'+flight.itineraries[0].segments[0].arrival.at.month.toString()+'-'+flight.itineraries[0].segments[0].arrival.at.year.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                flight.numberOfBookableSeats.toString()+' Seat(s)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              if(flight.oneWay)
                              Text(
                                'one way',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                              else
                                Text(
                                  'Round-trip',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            flight.price.total+' '+flight.price.currency,
                            style: TextStyle(
                              color: Color(0xffcd0714),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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

