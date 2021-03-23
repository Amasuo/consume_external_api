import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'flight_list.dart';
import 'package:consume_external_api/services/remote_services.dart' as service;
import 'package:requests/requests.dart';

class FlightsInput extends StatefulWidget {
  static String origin = "origin";
  static String destination = "destination";
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

  String kGoogleApiKey = "AIzaSyD6ijb43zMaxEZCfGP_XF7Cc4NgIByAGS0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    originController.addListener(() {
      _onChangedOrigin();
    });

    destinationController.addListener(() {
      _onChangedDestination();
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
    String kPLACES_API_KEY = kGoogleApiKey;
    String type = '(regions)';
    String url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken";
    var response = await Requests.get(url);
    if (response.statusCode == 200) {
    setState(() {
    _placeListOrigin = json.decode(response.content())['predictions'];
    print(_placeListOrigin);
    });
    } else {
    throw Exception('Failed to load predictions');
    }
  }
  void getSuggestionDestination(String input) async {
    String kPLACES_API_KEY = kGoogleApiKey;
    String type = '(regions)';
    String url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken";
    var response = await Requests.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _placeListDestination = json.decode(response.content())['predictions'];
        print(_placeListDestination);
      });
    } else {
      throw Exception('Failed to load predictions');
    }
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
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _placeListOrigin.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () async {
                                  origin = _placeListOrigin[index]["structured_formatting"]["main_text"] + "-" + _placeListOrigin[index]["structured_formatting"]["secondary_text"];
                                  originController.text = origin;

                                  var orig = await service.RemoteServices.getCityCode(originController.text);
                                  setState(() {
                                    FlightsInput.origin = orig;
                                  });

                                  setState(() {
                                    _placeListOrigin=[];
                                    print(origin);
                                  });
                                },
                                title: Text(_placeListOrigin[index]["description"]),
                              );
                            },
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _placeListDestination.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () async {
                                  destination = _placeListDestination[index]["structured_formatting"]["main_text"] + "-" + _placeListDestination[index]["structured_formatting"]["secondary_text"];
                                  destinationController.text = destination;

                                  var orig = await service.RemoteServices.getCityCode(destinationController.text);
                                  setState(() {
                                    FlightsInput.destination = orig;
                                  });

                                  setState(() {
                                    _placeListDestination=[];
                                    print(destination);
                                  });
                                },
                                title: Text(_placeListDestination[index]["description"]),
                              );
                            },
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
                                    child: Row(
                                      children: [
                                        Icon(Icons.search),
                                        SizedBox(width: Get.width/9,),
                                        Expanded(
                                          child: TextField(
                                            controller: originController,
                                            decoration: InputDecoration(
                                              hintText: origin,
                                              filled: true,
                                            ),
                                          ),
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
                                    child: Row(
                                      children: [
                                        Icon(Icons.search),
                                        SizedBox(width: Get.width/9,),
                                        Expanded(
                                          child: TextField(
                                            controller: destinationController,
                                            decoration: InputDecoration(
                                              hintText: destination,
                                              filled: true,
                                            ),
                                          ),
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
                                        InkWell(
                                            onTap: () => _selectDate(context),
                                            child: Row(
                                              children: [
                                                Icon(Icons.date_range_outlined),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 13,),
                                                      SizedBox(width: Get.width/5,),
                                                      Text(
                                                        date.day.toString()+'-'+date.month.toString()+'-'+date.year.toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                      SizedBox(width: Get.width/4,),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                        )
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
                                        Icon(Icons.person_outline),
                                        SizedBox(width: Get.width/5,),
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
                SizedBox(height: 10,),
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
                ),
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
      });
  }
}
