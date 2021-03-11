import 'dart:convert';

import 'package:consume_external_api/models/flight.dart';
import 'package:http/http.dart' as http;
import 'package:consume_external_api/models/hotel.dart';

class RemoteServices{
  static var client = http.Client();

  static Future<String> getToken() async{
    try {
      String url = "https://test.api.amadeus.com/v1/security/oauth2/token";
      Map<String, String> body = {"client_id": "Jf3tV1WPHh73BsZShbxCUI3qnu5SNU91", "client_secret": "0X4dK2JI8I3U7VU2", "grant_type": "client_credentials"};
      Map<String, String> headers = {"content-Type": "application/x-www-form-urlencoded"};
      var response = await http.post(url,body: body, headers: headers);
      final responseJson = jsonDecode(response.body);
      return responseJson["access_token"];
    } catch(e) {
      print(e);
    }
  }

   static Future<Hotel> fetchHotels() async{
    String token = await getToken();
    String url = "https://test.api.amadeus.com/v2/shopping/hotel-offers?cityCode=LON";
    Map<String, String> headers = {"Authorization": "Bearer "+token, };
    var response = await client.get(url,headers: headers);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return hotelFromJson(jsonString);
    } else{
      return null;
    }
  }

  static Future<Flight> fetchFlights() async {
    String token = await getToken();
    String url = "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=SYD&destinationLocationCode=BKK&departureDate=2021-11-01&adults=1";
    Map<String, String> headers = {"Authorization": "Bearer "+token, };
    var response = await client.get(url,headers: headers);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return flightFromJson(jsonString);
    } else {
      return null;
    }
  }

}