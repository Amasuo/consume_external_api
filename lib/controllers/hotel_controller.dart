import 'package:consume_external_api/models/hotel_fromJSON.dart';
import 'package:consume_external_api/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class HotelController extends GetxController {
  var isLoading = true;
  var hotelList = List<Datum>().obs;

  static HotelController get to => Get.find();


  void fetchHotels(String cityCode, String checkInDate) async {
    try{
      isLoading=true;
      update();
      var hotels = await RemoteServices.fetchHotels(cityCode, checkInDate);
      if (hotels != null){
        hotelList.assignAll(hotels.data);
      }
    } finally {
      isLoading=false;
      update();
    }
  }

}