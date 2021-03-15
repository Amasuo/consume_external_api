import 'package:consume_external_api/views/flight/flight_list.dart';
import 'package:consume_external_api/views/hotel/hotel_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HotelsPage('LON'),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test External APIs'),
      ),
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Hotels Search'),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HotelsPage('LON')),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Flights Search'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlightsPage('SYD', 'BKK', '2021-11-01', '1')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

