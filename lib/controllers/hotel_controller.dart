import 'package:consume_external_api/models/hotel.dart';
import 'package:consume_external_api/services/remote_services.dart';
import 'package:get/state_manager.dart';

class HotelController extends GetxController {
  var isLoading = true.obs;
  var hotelList = List<Datum>().obs;

  @override
  void onInit() {
    fetchHotels();
    super.onInit();
  }

  void fetchHotels() async {
    try{
      isLoading(true);
      var hotels = await RemoteServices.fetchHotels();
      if (hotels != null){
        hotelList.assignAll(hotels.data);
      }
    } finally {
      isLoading(false);
    }
  }
}