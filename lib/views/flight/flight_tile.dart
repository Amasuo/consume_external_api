import 'package:flutter/material.dart';
import 'package:consume_external_api/models/flight_fromJSON.dart';
import 'package:get/get.dart';


class FlightTile extends StatefulWidget {
  final Datum flight;
  final List airlines;
  const FlightTile(this.flight,this.airlines);

  @override
  _FlightTileState createState() => _FlightTileState();
}

class _FlightTileState extends State<FlightTile> {
  int ind;

  @override
  void initState() {
    ind = widget.airlines.indexWhere((element) => element['iata'] == widget.flight.validatingAirlineCodes.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(ind >0)
    return Container(
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: Get.height/5,
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
                                widget.flight.itineraries[0].segments[0].departure.at.day.toString()+'/'+widget.flight.itineraries[0].segments[0].departure.at.month.toString()+' '+widget.flight.itineraries[0].segments[0].departure.at.hour.toString()+':'+widget.flight.itineraries[0].segments[0].departure.at.minute.toString()+' - '+ widget.flight.itineraries[0].segments[0].arrival.at.day.toString()+'/'+widget.flight.itineraries[0].segments[0].arrival.at.month.toString()+' '+widget.flight.itineraries[0].segments[0].arrival.at.hour.toString()+':'+widget.flight.itineraries[0].segments[0].arrival.at.minute.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                widget.flight.numberOfBookableSeats.toString()+' Seat(s)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              if(widget.flight.oneWay)
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
                              SizedBox(height: 10,),
                              Container(
                                width: Get.width/2,
                                child: Text(
                                  //'Airline: '+widget.flight.validatingAirlineCodes.first,
                                  'Airline: '+ widget.airlines[ind]['name'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            widget.flight.price.total+' '+widget.flight.price.currency,
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
    else
      return Container();
  }
}

