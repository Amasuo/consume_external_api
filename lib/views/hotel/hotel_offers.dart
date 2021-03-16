import 'package:consume_external_api/controllers/offers_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'offer_tile.dart';


class HotelOffers extends StatefulWidget {
  String hotelId;
  HotelOffers(this.hotelId);

  @override
  _HotelOffersState createState() => _HotelOffersState();
}

class _HotelOffersState extends State<HotelOffers> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Hotel Offers',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<OffersController>(
              init: Get.put(OffersController()),
              initState: (_) => OffersController.to.fetchHotelOffers(widget.hotelId),
              builder: (controller) {
                if (controller.isLoading)
                  return Center(child: CircularProgressIndicator());
                else
                  return ListView.builder(
                      itemCount: controller.offersList.length,
                      itemBuilder: (context, index) {
                        return OfferTile(controller.offersList[index]);
                      }
                  );
              },
            ),
              /*child:Obx((){
                if (offersController.isLoading.value)
                  return Center(child: CircularProgressIndicator());
                else
                  return ListView.builder(
                      itemCount: offersController.offersList.length,
                      itemBuilder: (context, index) {
                        return OfferTile(offersController.offersList[index]);
                      }
                  );
              })*/
          ),
        ],
      )
    );
  }
}
