import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'flight_list.dart';
import 'package:consume_external_api/services/remote_services.dart' as service;

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
                            child: Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(width: Get.width/9,),
                                  Container(
                                    width: Get.width/2,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      items: cities.map<DropdownMenuItem<String>>((String value){
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String value) async {
                                        setState(() {
                                          origin = value;
                                        });
                                        var orig = await service.RemoteServices.getCityCode(value);
                                        setState(() {
                                          FlightsInput.origin = orig;
                                        });
                                      },
                                      hint: Center(child: Text(origin),),
                                    ),
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
                                  Container(
                                    width: Get.width/2,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      items: cities.map<DropdownMenuItem<String>>((String value){
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String value) async{
                                        setState(() {
                                          destination = value;
                                        });
                                        var dest = await service.RemoteServices.getCityCode(value);
                                        setState(() {
                                          FlightsInput.destination = dest;
                                        });
                                      },
                                      hint: Center(child: Text(destination),),
                                    ),
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
