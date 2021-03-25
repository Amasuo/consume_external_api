import 'package:consume_external_api/controllers/hotel_controller.dart';
import 'package:consume_external_api/views/flight/flight_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'hotel_tile.dart';


class HotelsPage extends StatefulWidget {
  String cityCode;

  @override
  _HotelsPageState createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  HotelController hotelController;

  @override
  void initState() {
    widget.cityCode = FlightsInput.destination;
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
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Hotels List',
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
            if(widget.cityCode != null && widget.cityCode != "destination")
            Expanded(
                child: GetBuilder<HotelController>(
                  init: Get.put(HotelController()),
                  initState: (_) => HotelController.to.fetchHotels(widget.cityCode),
                  builder: (controller) {
                    if (controller.isLoading)
                      return Center(child: CircularProgressIndicator());
                    else
                      if (controller.hotelList.length != 0)
                        return StaggeredGridView.countBuilder(
                          crossAxisCount: 2,
                          itemCount: controller.hotelList.length,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 8,
                          itemBuilder: (context, index) {
                            return HotelTile(controller.hotelList[index].hotel);
                          },
                          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      );
                      else
                        return Text("No Hotels Found");/*AlertDialog(
                          title: Text('No Hotels'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('No hotels found!'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true).pop();
                              },
                            ),
                          ],
                        );*/
                  },
                )
            )
            else
              Text('Provide destination please'),
          ],
        ),
      )
    );
  }
}



