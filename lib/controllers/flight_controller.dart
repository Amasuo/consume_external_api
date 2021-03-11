import 'package:consume_external_api/models/flight.dart';
import 'package:consume_external_api/services/remote_services.dart';
import 'package:get/state_manager.dart';

class FlightController extends GetxController {
  var isLoading = true.obs;
  var flightList = List<Datum>();

  @override
  void onInit() {
    fetchHotels();
    super.onInit();
  }

  void fetchHotels() async {
    try{
      isLoading(true);
      var flights = await RemoteServices.fetchFlights();
      if (flights != null){
        flightList.assignAll(flights.data.cast<Datum>());
      }
    } finally {
      isLoading(false);
    }
  }
}