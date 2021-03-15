import 'package:consume_external_api/models/hotel_fromJSON.dart';
import 'package:consume_external_api/services/remote_services.dart';
import 'package:get/state_manager.dart';

class HotelController extends GetxController {
  var isLoading = true.obs;
  var hotelList = List<Datum>().obs;
  String cityCode;

  HotelController(this.cityCode);

  @override
  void onInit() {
    fetchHotels();
    super.onInit();
  }

  void fetchHotels() async {
    try{
      isLoading(true);
      var hotels = await RemoteServices.fetchHotels(cityCode);
      if (hotels != null){
        hotelList.assignAll(hotels.data);
      }
    } finally {
      isLoading(false);
    }
  }

}