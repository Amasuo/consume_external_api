import 'dart:convert';
import 'package:consume_external_api/models/airline_fromJSON.dart';
import 'package:consume_external_api/models/city_fromJSON.dart';
import 'package:http/http.dart' as http;
import 'package:consume_external_api/models/flight_fromJSON.dart';
import 'package:consume_external_api/models/hotel_fromJSON.dart' as hotelModel;
import 'package:consume_external_api/models/offers_fromJSON.dart' as offerModel;


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

   static Future<hotelModel.Hotel> fetchHotels(String cityCode, String checkInDate) async{
    String token = await getToken();
    print(checkInDate);
    String url = "https://test.api.amadeus.com/v2/shopping/hotel-offers?cityCode=$cityCode&checkInDate=$checkInDate";
    Map<String, String> headers = {"Authorization": "Bearer "+token, };
    var response = await client.get(url,headers: headers);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return hotelModel.hotelFromJson(jsonString);
    } else{
      return null;
    }
  }

  static Future<offerModel.Offer> fetchHotelOffers(String hotelId, String checkInDate) async {
    String token = await getToken();
    String url = "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=$hotelId&checkInDate=$checkInDate";
    Map<String, String> headers = {"Authorization": "Bearer "+token, };
    var response = await client.get(url,headers: headers);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return offerModel.offerFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<Flight> fetchFlights(String originLocationCode, String destinationLocationCode, String departureDate, String adults) async {
    String token = await getToken();
    String url = "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$originLocationCode&destinationLocationCode=$destinationLocationCode&departureDate=$departureDate&adults=$adults";
    Map<String, String> headers = {"Authorization": "Bearer "+token, };
    var response = await client.get(url,headers: headers);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return flightFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<Airline> getAirline(String airlineCode) async {
    String token = await getToken();
    String url = "https://test.api.amadeus.com/v1/reference-data/airlines?airlineCodes="+airlineCode;
    Map<String, String> headers = {"Authorization": "Bearer "+token, };
    var response = await client.get(url,headers: headers);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return airlineFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<String> getCityCode(String location) async {
    var string = location.split('-');
    var city = string[0];
    var country = string[1];
    print(city);
    print(country);
    String token = await getToken();
    String url = "https://test.api.amadeus.com/v1/reference-data/locations?subType=CITY&keyword="+city+"&page[limit]=5";
    Map<String, String> headers = {"Authorization": "Bearer "+token, };
    var response = await client.get(url,headers: headers);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      try{
        var temp = cityFromJson(jsonString).data.firstWhere((element) => element.address.cityName==city.toUpperCase() , orElse: null);
        if (temp != null){
          return temp.address.cityCode;
        }
      } catch(e) {
        print("no city found");
      }
      return "";
    }
  }

}