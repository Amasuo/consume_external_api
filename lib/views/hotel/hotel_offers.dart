import 'dart:convert';

import 'package:consume_external_api/controllers/offers_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'offer_tile.dart';
//import 'offer_tile_test.dart';


class HotelOffers extends StatefulWidget {
  String hotelId,checkInDate;
  HotelOffers(this.hotelId,this.checkInDate);

  @override
  _HotelOffersState createState() => _HotelOffersState();
}

class _HotelOffersState extends State<HotelOffers> {
  List currencies;

  Future<String> loadCurrencies() async {
    var jsonText = await rootBundle.loadString('assets/currencies.json');
    setState(() {
      currencies = json.decode(jsonText);
      return 'success' ;
    });
  }

  @override
  void initState() {
    this.loadCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16,36,16,0),
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
                initState: (_) => OffersController.to.fetchHotelOffers(widget.hotelId, widget.checkInDate),
                builder: (controller) {
                  if (controller.isLoading)
                    return Center(child: CircularProgressIndicator());
                  else
                    if (controller.offersList.length != 0)
                      return ListView.builder(
                          itemCount: controller.offersList.length,
                          itemBuilder: (context, index) {
                            return OfferTile(controller.offersList[index],currencies);
                          }
                      );
                    else
                      return AlertDialog(
                        title: Text('No Offers'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('No offers found!'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}

