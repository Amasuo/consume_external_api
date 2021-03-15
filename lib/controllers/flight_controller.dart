import 'package:consume_external_api/models/flight_fromJSON.dart';
import 'package:consume_external_api/services/remote_services.dart';
import 'package:get/state_manager.dart';

class FlightController extends GetxController {
  var isLoading = true.obs;
  var flightList = List<Datum>().obs;
  String originLocationCode, destinationLocationCode, departureDate, adults;

  FlightController(this.originLocationCode, this.destinationLocationCode, this.departureDate, this.adults);

  @override
  void onInit() {
    fetchFlights();
    super.onInit();
  }

  void fetchFlights() async {
    try{
      isLoading(true);
      var flights = await RemoteServices.fetchFlights(originLocationCode, destinationLocationCode, departureDate, adults);
      if (flights != null){
        flightList.assignAll(flights.data.cast<Datum>());
      }
    } finally {
      isLoading(false);
    }
  }
}