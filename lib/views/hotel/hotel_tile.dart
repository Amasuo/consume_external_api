import 'package:consume_external_api/views/hotel/hotel_offers.dart';
import 'package:flutter/material.dart';
import 'package:consume_external_api/models/hotel_fromJSON.dart';
import 'package:get/get.dart';

class HotelTile extends StatelessWidget {
  final HotelClass hotel;

  const HotelTile(this.hotel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HotelOffers(hotel.hotelId)),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: Get.height / 6,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
          child: Padding(
              padding: EdgeInsets.all(7),
              child: ListTile(
                title: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hotel.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize:15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (hotel.rating != null)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                hotel.rating.toString(),
                                                style: TextStyle(color: Colors.white,fontSize: 12),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 10,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ) else
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'N/A',
                                                style: TextStyle(color: Colors.white,fontSize: 8),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 10,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
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
              )
          ),
        ),
      ),
    );
  }
}
