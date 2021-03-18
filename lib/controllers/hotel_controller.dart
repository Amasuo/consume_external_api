import 'package:consume_external_api/models/hotel_fromJSON.dart';
import 'package:consume_external_api/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class HotelController extends GetxController {
  var isLoading = true;
  var hotelList = List<Datum>().obs;
  String cityCode;

  static HotelController get to => Get.find();


  void fetchHotels(cityCode) async {
    try{
      isLoading=true;
      update();
      var hotels = await RemoteServices.fetchHotels(cityCode);
      if (hotels != null){
        hotelList.assignAll(hotels.data);
      }
    } finally {
      isLoading=false;
      update();
    }
  }

}