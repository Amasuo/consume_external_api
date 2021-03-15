import 'package:flutter/material.dart';
import 'package:consume_external_api/models/offers_fromJSON.dart';
import 'package:get/get.dart';


class OfferTile extends StatelessWidget {
  final OfferElement offer;
  const OfferTile(this.offer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: Get.height/7,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer.checkInDate.day.toString()+'-'+offer.checkInDate.month.toString()+'-'+offer.checkInDate.year.toString()+' - '+ offer.checkOutDate.day.toString()+'-'+offer.checkOutDate.month.toString()+'-'+offer.checkOutDate.year.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15
                                ),
                              ),
                              Text(
                                offer.room.typeEstimated.beds.toString()+' Bed(s)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                              offer.price.total+' '+offer.price.currency,
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                              ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
