import 'package:consume_external_api/models/airline_fromJSON.dart' as AirLine;
import 'package:consume_external_api/models/flight_fromJSON.dart' as Flight;
import 'package:consume_external_api/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class FlightController extends GetxController {
  var isLoading = true;
  var flightList = List<Flight.Datum>().obs;
  var airLineList = List<AirLine.Datum>().obs;

  static FlightController get to => Get.find();


  void fetchFlights(String originLocationCode, String destinationLocationCode, String departureDate, String adults) async {
    try{
      isLoading=true;
      update();
      var flights = await RemoteServices.fetchFlights(originLocationCode, destinationLocationCode, departureDate, adults);
      if (flights != null){
        flightList.assignAll(flights.data.cast<Flight.Datum>());
      }
    } finally {
      isLoading=false;
      update();
    }
  }

  void getAirline(String airlineCode) async {
    try{
      isLoading = true;
      update();
      var airLine = await RemoteServices.getAirline(airlineCode);
      if(airLine != null){
        airLineList.assignAll(airLine.data);
      }
    } finally {
      isLoading = false;
      update();
    }
  }
}