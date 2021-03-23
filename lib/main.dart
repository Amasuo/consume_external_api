import 'package:consume_external_api/views/hotel/hotel_list.dart';
import 'package:flutter/material.dart';
import 'package:consume_external_api/views/flight/flight_input.dart';
//import 'package:consume_external_api/views/flight/test_flight_input.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: const Color(0xffcd0714)),
      ),
    );
  }
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffcd0714),
            bottom: TabBar(
              indicatorColor: Colors.orange,
              tabs: [
                Tab(
                  icon: Icon(Icons.airplanemode_on_rounded),
                  text: 'Flights',
                ),
                Tab(
                  icon: Icon(Icons.hotel_outlined),
                  text: 'Hotels',
                )
              ],
            ),
            title: Center(
              child: Text('Test APIs'),
            ),
          ),
          body: TabBarView(
            children: [
              FlightsInput(),
              HotelsPage()
            ],
          ),
        ),
      ),
    );
  }
}
