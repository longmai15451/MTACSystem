import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mtacsystem/models/schedule.dart';
import '../../Network/sign_up_info.dart';

class HisDetail extends StatefulWidget {
  final Schedule schedule;
  final double lat, lng;
  HisDetail({
    Key? key,
    required this.schedule,
    required this.lat,
    required this.lng,
  }) : super(key: key);
  @override
  _HisDetail createState() => _HisDetail();
}

class _HisDetail extends State<HisDetail> {
  static var data;
  Completer<GoogleMapController> _controller = Completer();

  @override
  initState() {
    _getData();
    super.initState();
  }

  void _getData() async {
    data = await SignUpInfo()
        .getVacRegisterData(widget.schedule.regisID.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70.0,
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text(
            'CHI TIẾT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Roboto",
              fontSize: 26,
            ),
            textAlign: TextAlign.center,
          )),
      body: Container(
        color: Colors.teal.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 225,
                width: 365,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(widget.lat, widget.lng),
                        zoom: 15,
                      ),
                      myLocationButtonEnabled: false,
                      markers: {
                        Marker(
                          markerId: MarkerId('destination'),
                          icon: BitmapDescriptor.defaultMarker,
                          position: LatLng(widget.lat, widget.lng),
                        )
                      },
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      zoomControlsEnabled: false,
                      scrollGesturesEnabled: false,
                      zoomGesturesEnabled: false,
                      rotateGesturesEnabled: false,
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
              child: SingleChildScrollView(
                child: ListTile(
                  title: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: [
                            Text('Họ Tên: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${data != null ? data['full_name'] : ""}',
                                style: TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Số Điện Thoại:  '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text('${data != null ? data['phone'] : ""}',
                                      style: TextStyle(
                                        fontSize: 16,fontWeight: FontWeight.bold,
                                      )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('CCCD: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text('${data != null ? data['id_card'] : ""}',
                                      style: TextStyle(
                                        fontSize: 16,fontWeight: FontWeight.bold,
                                      )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Cơ sở y tế:  '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  '${data != null ? data['hos_name'] : ""}',
                                  style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Tiêm phòng bệnh: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text('${data != null ? data['disease'] : ""}',
                                      style: TextStyle(
                                        fontSize: 16,fontWeight: FontWeight.bold,
                                      )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Loại vaccine: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text('${data != null ? data['vaccine'] : ""}',
                                      style: TextStyle(
                                        fontSize: 16,fontWeight: FontWeight.bold,
                                      )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Ngày Hẹn: '),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  '${data != null ? data['register_date'] : ""}',
                                  style: TextStyle(
                                    fontSize: 16,fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Giờ Hẹn: '),
                            Text(
                                '  ${data != null ? "${data['register_time'].toString().split(':')[0]}:${data['register_time'].toString().split(':')[1]}" : ""}',
                                style: TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Địa Chỉ Bệnh Viện:',
                                style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold,
                                )),
                            SizedBox(height: 5),
                            Text('${data != null ? data['hos_address'] : ""}',
                                style: TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'Đã Tiêm: ${data != null ? datedCal(data['register_date'], data['register_time']) : ""}',
                                    style: TextStyle(
                                      fontSize: 18,fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                        SizedBox(height: 10)
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String datedCal(String date, String time) {
  final year = int.parse(date.split('-')[0]);
  final month = int.parse(date.split('-')[1]);
  final day = int.parse(date.split('-')[2]);
  final hour = int.parse(time.split(':')[0]);
  final minutes = int.parse(time.split(':')[1]);
  final regisdate = DateTime(year, month, day, hour, minutes);
  final today = DateTime.now();
  int dif = today.difference(regisdate).inMinutes;
  if (dif > 59) {
    dif = today.difference(regisdate).inHours;
    if (dif > 23) {
      dif = today.difference(regisdate).inDays;
      return dif.toString() + ' ngày trước.';
    }
    return dif.toString() + ' giờ trước.';
  } //inHours /24.round()
  return dif.toString() + ' phút trước.';
}
