import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token ='';
  List hotelOffers=[];

  void getToken() async{
    try {
      String url = "https://test.api.amadeus.com/v1/security/oauth2/token";
      Map<String, String> body = {"client_id": "Jf3tV1WPHh73BsZShbxCUI3qnu5SNU91", "client_secret": "0X4dK2JI8I3U7VU2", "grant_type": "client_credentials"};
      Map<String, String> headers = {"content-Type": "application/x-www-form-urlencoded"};
      var response = await http.post(url,body: body, headers: headers);
      final responseJson = jsonDecode(response.body);
      setState(() {
        token = responseJson["access_token"];
        print(token);
      });
    } catch(e) {
        print(e);
    }
  }

  void getHotelOffers() async {
    try{
      String url = "https://test.api.amadeus.com/v2/shopping/hotel-offers?cityCode=LON";
      Map<String, String> headers = {"Authorization": "Bearer "+token, };
      var response = await http.get(url,headers: headers);
      final responseJson = jsonDecode(response.body);
      setState(() {
        hotelOffers = responseJson["data"];
        print(hotelOffers);
      });
    } catch(e){
        print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Get Hotel Offers'),),
        body: ListView(
          children: [
            TextButton(onPressed: getToken, child: Text('get Token!')),
            Text(token),
            TextButton(onPressed: getHotelOffers, child: Text('get Offers!')),
          ],
        )
      ),
    );
  }
}
