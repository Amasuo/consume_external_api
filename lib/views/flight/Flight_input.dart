import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'flight_list.dart';

class FlightsInput extends StatefulWidget {
  @override
  _FlightsInputState createState() => _FlightsInputState();
}

class _FlightsInputState extends State<FlightsInput> {
  String origin="origin",destination="destination";
  DateTime date = DateTime.now();
  int adultsNumber=0;
  //Map<String,String> cities = {'SYD':'Sydney-Australia','BKK':'Bangkok-Thailand'};
  List<String>cities = ['SYD','BKK'];
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
                                  width: 4,
                                ),
                                top: BorderSide(
                                  color: Colors.orange[200],
                                  width: 4,
                                ),
                                right: BorderSide(
                                  color: Colors.orange[200],
                                  width: 4,
                                ),
                                bottom: BorderSide(
                                  color: Colors.orange[200],
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(width: Get.width/8,),
                                  DropdownButton(
                                    items: cities.map<DropdownMenuItem<String>>((String value){
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String value){
                                      setState(() {
                                        origin = value;
                                      });
                                    },
                                    hint: Text(origin),
                                  ),
                                  SizedBox(width: Get.width/6,),
                                  DropdownButton(
                                    items: cities.map<DropdownMenuItem<String>>((String value){
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String value){
                                      setState(() {
                                        destination = value;
                                      });
                                    },
                                    hint: Text(destination),
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
                                  width: 4,
                                ),
                                top: BorderSide(
                                  color: Colors.orange[200],
                                  width: 2,
                                ),
                                right: BorderSide(
                                  color: Colors.orange[200],
                                  width: 4,
                                ),
                                bottom: BorderSide(
                                  color: Colors.orange[200],
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Row(
                                children: [
                                  Icon(Icons.date_range_outlined),
                                  InkWell(
                                    onTap: () => _selectDate(context),
                                    child: Container(
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
                                  width: 4,
                                ),
                                top: BorderSide(
                                  color: Colors.orange[200],
                                  width: 2,
                                ),
                                right: BorderSide(
                                  color: Colors.orange[200],
                                  width: 4,
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
                                  width: 4,
                                ),
                                top: BorderSide(
                                  color: Colors.orange[200],
                                  width: 2,
                                ),
                                right: BorderSide(
                                  color: Colors.orange[200],
                                  width: 4,
                                ),
                                bottom: BorderSide(
                                  color: Colors.orange[200],
                                  width: 4,
                                ),
                              ),
                            ),
                            child: RaisedButton(
                              color: Color(0xffcd0714),
                              onPressed: (){
                                DateFormat dateformatter = DateFormat('yyyy-MM-dd');
                                String dateFormatted = dateformatter.format(date);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FlightsPage(origin, destination, dateFormatted, adultsNumber.toString())),
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
