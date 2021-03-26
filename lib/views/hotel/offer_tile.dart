import 'package:flutter/material.dart';
import 'package:consume_external_api/models/offers_fromJSON.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class OfferTile extends StatefulWidget {
  final OfferElement offer;
  final List currencies;
  const OfferTile(this.offer,this.currencies);

  @override
  _OfferTileState createState() => _OfferTileState();
}

class _OfferTileState extends State<OfferTile> {
  int indCurr;

  @override
  void initState() {
    indCurr = widget.currencies.indexWhere((element) {
      return element['cc'] == widget.offer.price.currency;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.offer.room.typeEstimated.beds!=null)
      return Padding(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Container(
          width: Get.width,
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(14)
              )
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.hotel, color: Colors.orange,size: 32),
                  SizedBox(width: Get.width/12),
                  Container(
                    width: Get.width/3.5,
                    child:
                    Row(
                      children: [
                        Text(
                          widget.offer.room.typeEstimated.beds.toString()+' Bed',
                          style: TextStyle(fontSize: 19, fontWeight:FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '(s)',
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: Get.width/10),
                  Expanded(
                    child: Text(
                        widget.offer.price.total+' '+ widget.currencies[indCurr]['symbol'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                    ),
                  ),
                  Icon(Icons.trending_flat,color: Colors.black,size: 15)
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _itemDepartment(widget.offer),
                  _locationPlane(),
                  _itemDepartment2(widget.offer)
                ],
              )
            ],
          ),
        ),
      );
    else
      return Container();
  }
}

Widget _itemDepartment(OfferElement offer){
  DateFormat dateformatter = DateFormat('Md');
  String checkIn = dateformatter.format(offer.checkInDate);
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("check In", style: TextStyle(color: Colors.black54)),
        SizedBox(height: 10),
        Text(checkIn, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget _itemDepartment2(OfferElement offer){
  DateFormat dateformatter = DateFormat('Md');
  String checkOut = dateformatter.format(offer.checkOutDate);
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("check Out", style: TextStyle(color: Colors.black54)),
        SizedBox(height: 10),
        Text(checkOut, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget _locationPlane(){
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.input, color: Colors.blue,size: 21),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.blue,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.fiber_manual_record,color: Colors.green,size: 8),
            Icon(Icons.outbond_outlined, color: Colors.blue,size: 21),
          ],
        ),
      ],
    ),
  );
}

