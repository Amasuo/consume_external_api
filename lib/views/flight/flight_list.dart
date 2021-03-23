import 'dart:convert';

import 'package:consume_external_api/controllers/flight_controller.dart';
import 'package:consume_external_api/views/flight/flight_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FlightsPage extends StatefulWidget {
  String originLocationCode, destinationLocationCode, departureDate, adults;
  FlightsPage(this.originLocationCode, this.destinationLocationCode, this.departureDate, this.adults);


  @override
  _FlightsPageState createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage> {
  FlightController flightController;
  List airlines;

  Future<String> loadAirlines() async {
    var jsonText = await rootBundle.loadString('assets/airlines');
    setState(() {
      airlines = json.decode(jsonText);
      return 'success' ;
    });
  }

  @override
  void initState() {
    this.loadAirlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16,36,16,0),
              child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Flights List',
                        style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 32,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                    IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
                  ],
                ),
              ),
            Expanded(
                child: GetBuilder<FlightController>(
                  init: Get.put(FlightController()),
                  initState: (_) => FlightController.to.fetchFlights(widget.originLocationCode, widget.destinationLocationCode, widget.departureDate, widget.adults),
                  builder: (controller) {
                    if (controller.isLoading)
                      return Center(child: CircularProgressIndicator());
                    else
                      return ListView.builder(
                          itemCount: controller.flightList.length,
                          itemBuilder: (context, index) {
                            return FlightTile(controller.flightList[index],airlines);
                          }
                      );
                  },
                )
            )
          ],
        ),
      )
    );
  }
}

