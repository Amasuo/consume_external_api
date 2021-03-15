import 'package:consume_external_api/models/offers_fromJSON.dart';
import 'package:consume_external_api/services/remote_services.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  var isLoading = true;
  var offersList = List<OfferElement>().obs;

  static OffersController get to => Get.find();


  void fetchHotelOffers(String hotelId) async {
    try{
      isLoading=true;
      update();
      var offers = await RemoteServices.fetchHotelOffers(hotelId);
      if (offers != null){
        print('fetch returned items');
        offersList.assignAll(offers.data.offers);
      }
    } finally {
      print('terminated');
      isLoading=false;
      update();
    }
  }

}