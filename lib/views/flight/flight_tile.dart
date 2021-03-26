import 'package:flutter/material.dart';
import 'package:consume_external_api/models/flight_fromJSON.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


/*class FlightTile extends StatefulWidget {
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
}*/

class FlightTile extends StatefulWidget {
  final Datum flight;
  final List airlines;
  final List currencies;
  const FlightTile(this.flight,this.airlines,this.currencies);

  @override
  _FlightTileState createState() => _FlightTileState();
}

class _FlightTileState extends State<FlightTile> {
  int indAir;
  int indCurr;

  @override
  void initState() {
    indAir = widget.airlines.indexWhere((element) => element['iata'] == widget.flight.validatingAirlineCodes.first);
    indCurr = widget.currencies.indexWhere((element) {
      return element['cc'] == widget.flight.price.currency;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(indAir >0)
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Container(
        width: Get.width,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(14)
            )
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.airplanemode_on_rounded, color: Colors.orange,size: 32),
                SizedBox(width: 5),
                Container(
                  width: Get.width/2.7,
                  child:
                      Row(
                        children: [
                          Text(
                            widget.flight.validatingAirlineCodes.first,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Expanded(
                            child:Text(
                              widget.airlines[indAir]['name'],
                              style: TextStyle(fontSize: 19, fontWeight:FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                ),
                SizedBox(width: Get.width/8),
                Expanded(
                  child: Text(
                      widget.flight.price.total+' '+ widget.currencies[indCurr]['symbol'],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                ),
                Icon(Icons.trending_flat,color: Colors.black,size: 15)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _itemDepartment(widget.flight),
                _locationPlane(),
                _itemDepartment2(widget.flight)
              ],
            )
          ],
        ),
      ),
    );
    else
      return Container();
  }
}

Widget _itemDepartment(Datum flight){
  DateFormat dateformatter = DateFormat('Hm');
  String departure = dateformatter.format(flight.itineraries[0].segments[0].departure.at);
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Departure", style: TextStyle(color: Colors.black54)),
        SizedBox(height: 10),
        Text(departure, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        SizedBox(height: 1),
        Text(flight.itineraries[0].segments[0].departure.iataCode, style: TextStyle(color: Colors.black54)),
      ],
    ),
  );
}

Widget _itemDepartment2(Datum flight){
  DateFormat dateformatter = DateFormat('Hm');
  String arrival = dateformatter.format(flight.itineraries[0].segments[0].arrival.at);
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Arrival", style: TextStyle(color: Colors.black54)),
        SizedBox(height: 10),
        Text(arrival, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        SizedBox(height: 1),
        Text(flight.itineraries[0].segments[0].arrival.iataCode, style: TextStyle(color: Colors.black54)),
      ],
    ),
  );
}

Widget _locationPlane(){
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.flight_takeoff, color: Colors.blue,size: 21),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.location_on, color: Colors.blue,size: 21),
          ],
        ),
      ],
    ),
  );
}