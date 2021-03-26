import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'flight_list.dart';
import 'package:consume_external_api/services/remote_services.dart' as service;
import 'package:requests/requests.dart';

class FlightsInput extends StatefulWidget {
  static String origin = "origin";
  static String destination = "destination";
  static String checkInDate = "checkInDate";
  @override
  _FlightsInputState createState() => _FlightsInputState();
}

class _FlightsInputState extends State<FlightsInput> {
  String origin="origin",destination="destination";
  DateTime date = DateTime.now();
  int adultsNumber=0;
  List<String>cities = ['london-united kingdom','madrid-spain'];

  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  var uuid= new Uuid();
  String _sessionToken;
  List<dynamic>_placeListOrigin = [];
  List<dynamic>_placeListDestination = [];

  String kGoogleApiKey = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadGoogleApiKey();
    DateFormat dateformatter = DateFormat('yyyy-MM-dd');
    String dateFormatted = dateformatter.format(date);
    FlightsInput.checkInDate = dateFormatted;

    print(FlightsInput.checkInDate);

    originController.addListener(() {
      _onChangedOrigin();
    });

    destinationController.addListener(() {
      _onChangedDestination();
    });
  }

  loadGoogleApiKey() async{
    String data = await rootBundle.loadString('assets/keys.json');
    List jsonResult = json.decode(data);
    kGoogleApiKey = jsonResult[0]["GoogleApi"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: Colors.grey[200],
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: ListView(
              children: [
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top:10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back!',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('Fill the form please.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 15,top: 20,right: 15,bottom: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Get.height/12,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        top: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        right: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.orange[200],
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: originController,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          hintText: "origin",
                                          filled: true,
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.search)
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _placeListOrigin.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () async {
                                          origin = _placeListOrigin[index]["structured_formatting"]["main_text"] + "-" + _placeListOrigin[index]["structured_formatting"]["secondary_text"];
                                          originController.text = origin;
                                          /*setState(() {
                                            _placeListOrigin=[];
                                          });*/
                                          var orig = await service.RemoteServices.getCityCode(origin);
                                          setState(() {
                                            _placeListOrigin=[];
                                            FlightsInput.origin = orig;
                                          });
                                          FocusScope.of(context).unfocus();
                                        },
                                        title: Text(_placeListOrigin[index]["description"]),
                                      );
                                    },
                                  ),
                                  Container(
                                    height: Get.height/12,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        top: BorderSide(
                                          color: Colors.orange[200],
                                          width: 1,
                                        ),
                                        right: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.orange[200],
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      controller: destinationController,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          hintText: "destination",
                                          filled: true,
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.search)
                                      ),
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _placeListDestination.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () async {
                                          destination = _placeListDestination[index]["structured_formatting"]["main_text"] + "-" + _placeListDestination[index]["structured_formatting"]["secondary_text"];
                                          destinationController.text = destination;
                                          /*setState(() {
                                            _placeListDestination=[];
                                          });*/
                                          var orig = await service.RemoteServices.getCityCode(destination);
                                          setState(() {
                                            _placeListDestination=[];
                                            FlightsInput.destination = orig;
                                          });
                                          FocusScope.of(context).unfocus();
                                        },
                                        title: Text(_placeListDestination[index]["description"]),
                                      );
                                    },
                                  ),
                                  Container(
                                    height: Get.height/12,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        top: BorderSide(
                                          color: Colors.orange[200],
                                          width: 1,
                                        ),
                                        right: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.orange[200],
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              _selectDate(context);
                                              DateFormat dateformatter = DateFormat('yyyy-MM-dd');
                                              String dateFormatted = dateformatter.format(date);
                                              FlightsInput.checkInDate = dateFormatted;
                                              },
                                            child: Row(
                                              children: [
                                                SizedBox(width: 10,),
                                                Icon(Icons.date_range_outlined,color: Colors.grey,),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: Get.width/3.8,),
                                                      Text(
                                                        date.day.toString()+'-'+date.month.toString()+'-'+date.year.toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: Get.height/12,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        top: BorderSide(
                                          color: Colors.orange[200],
                                          width: 1,
                                        ),
                                        right: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.orange[200],
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10,),
                                        Icon(Icons.person_outline,color: Colors.grey,),
                                        SizedBox(width: Get.width/4.5,),
                                        Row(
                                          children: [
                                            IconButton(
                                                icon: Icon(Icons.remove),
                                                onPressed: (){
                                                  if(adultsNumber>0)
                                                    setState(() {
                                                      adultsNumber--;
                                                    });
                                                }
                                            ),
                                            Text(adultsNumber.toString()),
                                            IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: (){
                                                  setState(() {
                                                    adultsNumber++;
                                                  });
                                                }
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: Get.width,
                                    height: Get.height/12,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        top: BorderSide(
                                          color: Colors.orange[200],
                                          width: 1,
                                        ),
                                        right: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.orange[200],
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: RaisedButton(
                                      color: Color(0xffcd0714),
                                      onPressed: () async{
                                        DateFormat dateformatter = DateFormat('yyyy-MM-dd');
                                        String dateFormatted = dateformatter.format(date);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => FlightsPage(FlightsInput.origin, FlightsInput.destination, dateFormatted, adultsNumber.toString())),
                                        );
                                      },
                                      child: Text(
                                        'Search',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    )
                ),
                /*SizedBox(height: 10,),
                Container(
                  color: Colors.white,
                  height: Get.height/6,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top:10),
                    child: Text(
                      'Offers of the day',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        )
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != date)
      setState(() {
        date = picked;
        DateFormat dateformatter = DateFormat('yyyy-MM-dd');
        String dateFormatted = dateformatter.format(date);
        FlightsInput.checkInDate = dateFormatted;
      });
  }

  void _onChangedOrigin() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestionOrigin(originController.text);
  }

  void _onChangedDestination() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestionDestination(destinationController.text);
  }

  void getSuggestionOrigin(String input) async {
    _placeListDestination = [];
    String kPLACES_API_KEY = kGoogleApiKey;
    String type = '(regions)';
    String url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken";
    var response = await Requests.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _placeListOrigin = json.decode(response.content())['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }
  void getSuggestionDestination(String input) async {
    _placeListOrigin = [];
    String kPLACES_API_KEY = kGoogleApiKey;
    String type = '(regions)';
    String url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken";
    var response = await Requests.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _placeListDestination = json.decode(response.content())['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

}
