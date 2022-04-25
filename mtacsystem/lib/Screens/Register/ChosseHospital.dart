import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mtacsystem/Components/DateRegister.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Screens/Calendar/detail_vaccin_regis.dart';
import 'package:mtacsystem/controller/controllerData.dart';
import 'package:mtacsystem/controller/diseases_controller.dart';
import 'package:mtacsystem/controller/hospital_controller.dart';
import 'package:mtacsystem/controller/limit_controller.dart';
import 'package:mtacsystem/controller/notify_helper.dart';
import 'package:mtacsystem/controller/vaccine_controller.dart';
import 'package:mtacsystem/models/account.dart';
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/diseases.dart';
import 'package:mtacsystem/models/hospital.dart';
import 'package:mtacsystem/models/vaccine.dart';
import 'dart:async';
import 'dart:convert';
import '../../Network/location_service.dart';
import 'package:mtacsystem/server/Server.dart' as sver;
import 'package:mtacsystem/Components/process_method.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ChosseHospital extends StatefulWidget {
  final AccountProfile accountdata;
  final String userlocation;
  final bool locationc;
  const ChosseHospital({
    required this.accountdata,
    required this.userlocation,
    required this.locationc,
  });
  @override
  State<ChosseHospital> createState() => _ChosseHospital();
}

class _ChosseHospital extends State<ChosseHospital> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(16.069203, 108.193960),
    zoom: 13,
  );
  List<bool> availableCheck = List.filled(6, false, growable: true);
  var limitdata;
  Set<Polyline> _polylines = Set<Polyline>();
  Set<Marker> _markers = Set<Marker>();
  Completer<GoogleMapController> _controller = Completer();
  int _polylineIdCounter = 1;
  int markerId = 1;
  String? distance, duration;
  VacRegister regisdata = new VacRegister();
  late bool check1;
  late bool check2;
  int _thanhToan = 0;
  bool _ktLoaiBenh = false;
  bool chooseVac = false;
  late Future<List<Hospital>> hosData;
  late Future<List<Diseases>> diseaseData;
  late Future<List<Vaccine>> vaccine;
  List<bool> _isSelected = [true, false];
  late bool selectDisease;
  var direction;
  var notify;
  late List<bool> select = new List.filled(6, false, growable: false);
  int durationSeconds = 2100;
  var data;
  bool isLoading = false;

  @override
  initState() {
    _getVaccineAndHos();
    notify = NotifyHelper();
    super.initState();
    selectDisease = false;
    _loadMap();
  }

  Future<void> _gotoPlace(
    double orlat,
    double orlng,
    double desLat,
    double desLng,
    Map<String, dynamic> boundsNe,
    Map<String, dynamic> boundsSw,
  ) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngBounds(
      LatLngBounds(
        southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
        northeast: LatLng(boundsNe['lat'], boundsNe['lng']),
      ),
      25,
    ));
    _setMarker(LatLng(orlat, orlng));
    _setMarker(LatLng(desLat, desLng));
  }

  void _setMarker(LatLng point) {
    setState(() {
      if (markerId >= 3) markerId = 1;
      final String markerIdVal = 'marker_$markerId';
      markerId++;
      _markers.add(Marker(
        markerId: MarkerId(markerIdVal),
        icon: BitmapDescriptor.defaultMarker,
        position: point,
      ));
    });
  }

  void _setPolyline(List<PointLatLng> points) {
    if (_polylineIdCounter >= 2) _polylineIdCounter = 1;
    final String polylineIdVal = 'polyline_$_polylineIdCounter';
    _polylineIdCounter++;
    _polylines.add(Polyline(
      polylineId: PolylineId(polylineIdVal),
      width: 3,
      color: Colors.blue,
      points: points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList(),
    ));
  }

  void _loadMap() async {
    _gotoPlace(
      direction['start_location']['lat'],
      direction['start_location']['lng'],
      direction['end_location']['lat'],
      direction['end_location']['lng'],
      direction['bounds_ne'],
      direction['bounds_sw'],
    );
    _setPolyline(direction['polyline_decoded']);
    distance = direction['distance'];
    duration = direction['duration'];
    setState(() {});
  }

  void _getVaccineAndHos() async {
    hosData = HospitalController().fetchData();
    diseaseData = DiseaseController().fetchData();
    regisdata.registerDate = new TextEditingController(
        text: DateFormat("yyy-MM-dd").format(DateTime.now()));
    print(regisdata.registerDate.text);
    setState(() {
      check1 = check2 = false;
    });
  }

  void _getDis(String? id_hos) async{
    diseaseData = DiseaseController().fetch(id_hos!);
    setState(() {

    });
  }

  void _getVac(String? id_des, String? id_host) async{
    vaccine = VaccineController().fetchData(id_des!, id_host!);
    setState(() {

    });
}

  void _getControllerText(String text) {
    setState(() {
      regisdata.registerDate.text = text;
    });
  }

  void toast(String msg, Color textcolor) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[50],
        textColor: textcolor,
        fontSize: 16.0);
  }

  Future signup() async {
    int estimate = direction['duration_seconds'] + 300;
    var url = sver.serverip + "/CAP1_mobile/vaccination_register.php";
    print(regisdata.startTime);
    var response = await http.post(Uri.parse(url), body: {
      "id_card": widget.accountdata.idCard.toString(),
      "id_hos": regisdata.idHos.toString(),
      "id_dis": regisdata.idDes.toString(),
      "registerDate": regisdata.registerDate.text,
      "registerTime": regisdata.registerTime,
      "startTime": regisdata.startTime,
      "endTime": regisdata.endTime,
      "estimateTime": estimate.toString(),
      "idvac": regisdata.idVac.toString(),
      "proc":_thanhToan==1?"Chưa thanh toán":"Đã thanh toán",
    });
    data = json.decode(response.body);
    if (data != "Faild" && data != null) {
      await notify.scheduledNotification(
        0,
        int.parse(data['registerDate'].toString().split("-")[1]),
        int.parse(data['registerDate'].toString().split("-")[2]),
        int.parse(data['expected'].toString().split(":")[0]),
        int.parse(data['expected'].toString().split(":")[1]),
        'Lịch hẹn tiêm vaccine',
        'bạn có lịch hẹn tiêm vaccine tại địa chỉ: ${data['address']}',
        data['id'].toString(),
        widget.userlocation,
        data['address'].toString(),
        '1',
      );
    } else {
      toast('Đã có lỗi xảy ra. Vui lòng thử lại', Colors.red);
    }
  }

  Future cancelSchedule(String id) async {
    var url = sver.serverip + '/CAP1_mobile/vac_cancel.php';
    var response = await http.post(Uri.parse(url), body: {
      "regisID": id,
    });
    var data = json.decode(response.body);
    if (data == 'Success') {
      await notify.flutterLocalNotificationsPlugin.cancel(0);
      return;
    } else {
      toast('Hệ thống đang gặp sự cố!', Colors.red);
    }
  }

  timeSelected(
      int start, int end, List<bool> select, int index, bool availableCheck) {
    if (DateFormat("yyy-MM-dd").format(DateTime.now()) ==
        regisdata.registerDate.text) {
      int hour = int.parse(DateFormat('H').format(DateTime.now()));
      int minus = int.parse(DateFormat('m').format(DateTime.now()));
      if (hour == end - 1 && minus >= 50 || hour >= end) {
        availableCheck = false;
      }
    }
    return TextButton(
      onPressed: () {
        setState(() {
          if (availableCheck) {
            select[index] = true;
            ProcessingMethod().setSelect(index, select);
            regisdata.startTime = '$start:00';
            regisdata.endTime = '$end:00';
          } else {
            toast('Khung giờ hiện đang quá tải!', Colors.red);
          }
        });
      },
      child: Text('$start:00 - $end:00',
          style: TextStyle(fontSize: 14, color: Colors.black)),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(!availableCheck
              ? Colors.teal.shade100
              : select[index]
                  ? Colors.teal
                  : Colors.teal.shade300),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ))),
    );
  }

  Future<void> _dataProcessing(int i, List<Hospital> data, int index) async {
    direction = await LocationService()
        .getDirection(widget.userlocation, data[i].hosAddress.toString());
    regisdata.hos.text = '${data[index].hosName}';
    regisdata.idHos = data[i].idHos.toString();
    distance = direction['distance'];
    duration = direction['duration'];
    await _limitProcessing();
    _loadMap();
  }

  Future<void> _limitProcessing() async {
    print(regisdata.registerDate.text);
    limitdata = await LimitController().getLimitData(
        regisdata.idHos.toString(),
        regisdata.registerDate.text,
        "/CAP1_mobile/checkstatushospital_test.php");
    ProcessingMethod().setAvailible(limitdata, availableCheck);
    setState(() {});
  }

  void _getSeconds(Map<String, dynamic> direction) {
    durationSeconds = direction['duration_seconds'];
    durationSeconds <= 300
        ? durationSeconds += 420
        : durationSeconds <= 900
            ? durationSeconds += 600
            : durationSeconds = 2100;
    var today = DateTime.now();
    var estimate = today.add(Duration(seconds: durationSeconds));
    var timeFormat = DateFormat('Hms');
    regisdata.registerTime = timeFormat.format(estimate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Row(
          children: [
            SizedBox(width: 35),
            Container(child: Text("ĐẶT LỊCH TIÊM")),
            SizedBox(width: 50),
          ],
        ),
      ),
      body: Container(
        color: Colors.teal.shade50,
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 180,
                  width: 345,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        initialCameraPosition: _initialCameraPosition,
                        myLocationButtonEnabled: false,
                        markers: _markers,
                        polylines: _polylines,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                      Positioned(
                        top: 10,
                        child: Text(
                          distance != null && duration != null
                              ? '$distance, $duration'
                              : '',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        readOnly: true,
                        controller: regisdata.hos,
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            borderSide:
                            BorderSide(color: Colors.teal, width: 2),
                            headerAnimationLoop: false,
                            animType: AnimType.SCALE,
                            btnOkColor: Colors.blue.shade600,
                            body: Column(
                              children: [
                                Text('BỆNH VIỆN'),
                                FutureBuilder<List<Hospital>>(
                                  future: hosData,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<Hospital> data = snapshot.data!;
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 1,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                for (int i = 0;
                                                i < data.length;
                                                ++i)
                                                  TextButton(
                                                    onPressed: () async {
                                                      index = i;
                                                      await _dataProcessing(
                                                          i, data, index);
                                                      _getDis(data[i].idHos);
                                                      Navigator.pop(context);
                                                    },
                                                    child: ListTile(
                                                      title: Text(
                                                          '${data[i].hosName}'),
                                                      subtitle: Text(
                                                          '${data[i].hosAddress}'),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          });
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    // By default show a loading spinner.
                                    return CircularProgressIndicator();
                                  },
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                            buttonsTextStyle: TextStyle(fontSize: 15),
                          )..show();
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            hintText: 'Chọn bệnh viện',
                            hintStyle: TextStyle(color: Colors.black),
                            icon: Icon(Icons.local_hospital_sharp,
                                color: Colors.teal, size: 30)),
                      ),
                    ),
                    Container(
                      child: TextField(
                        readOnly: true,
                        controller: regisdata.des,
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            borderSide:
                                BorderSide(color: Colors.teal, width: 2),
                            headerAnimationLoop: false,
                            animType: AnimType.SCALE,
                            btnOkColor: Colors.teal,
                            body: Column(
                              children: [
                                Text('LOẠI BỆNH'),
                                FutureBuilder<List<Diseases>>(
                                  future: diseaseData,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<Diseases> data = snapshot.data!;
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: 1,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                for (int i = 0; i < data.length; ++i)
                                                  TextButton(
                                                    onPressed: () async {
                                                      index = i;
                                                      selectDisease = true;
                                                      setState(() {
                                                        regisdata.des.text =
                                                            '${data[i].diseaseName}';
                                                        regisdata.idDes =
                                                            data[i].idDiseases;
                                                        print(regisdata.idDes);
                                                        _getVac(regisdata.idDes, regisdata.idHos);
                                                        if(_ktLoaiBenh == false){
                                                          _ktLoaiBenh = true;
                                                        }
                                                        //mở chọn vaccine
                                                        Get.back();
                                                      });
                                                    },
                                                    child: ListTile(
                                                      title: Text(
                                                          '${data[i].diseaseName}'),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          });
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    // By default show a loading spinner.
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                            buttonsTextStyle: TextStyle(fontSize: 13),
                          )..show();
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          hintText: 'Chọn loại bệnh tiêm',
                          icon: Icon(Icons.sticky_note_2,
                              color: Colors.teal, size: 30),
                        ),
                      ),
                    ),
                    if(_ktLoaiBenh == true)
                      Container(
                        child: TextField(
                          readOnly: true,
                          controller: regisdata.vac,
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.NO_HEADER,
                              borderSide:
                              BorderSide(color: Colors.teal, width: 2),
                              headerAnimationLoop: false,
                              animType: AnimType.SCALE,
                              btnOkColor: Colors.teal,
                              body: Column(
                                children: [
                                  Text('CHỌN VẮC XIN'),
                                  FutureBuilder<List<Vaccine>>(
                                    future: vaccine,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        List<Vaccine> data = snapshot.data!;
                                        return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Column(
                                                children: [
                                                  for (int i = 0; i < data.length; ++i)
                                                    TextButton(
                                                      onPressed: () async {
                                                        index = i;
                                                        chooseVac = true;
                                                        setState(() {
                                                          regisdata.vac.text =
                                                          '${data[i].vacName}';
                                                          regisdata.idVac =
                                                              data[i].idVac;
                                                          print(regisdata.idVac);
                                                          //mở chọn vaccine
                                                          Get.back();
                                                        });
                                                      },
                                                      child: ListTile(
                                                        title: Text(
                                                            '${data[i].vacName}'),
                                                        subtitle: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text('Gía tiền: ${data[i].price} đồng'),
                                                            Text('Số lượng còn: ${data[i].quantity}'),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              );
                                            });
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }
                                      // By default show a loading spinner.
                                      return CircularProgressIndicator();
                                    },
                                  ),
                                ],
                              ),
                              buttonsTextStyle: TextStyle(fontSize: 13),
                            )..show();
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            hintText: 'Chọn vắc xin',
                            icon: Icon(Icons.sticky_note_2,
                                color: Colors.teal, size: 30),
                          ),
                        ),
                      ),
                    Container(
                      child: DateRegister(
                          getControllerText: _getControllerText,
                          dateUpdate: _limitProcessing),
                    ),
                    Container(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Chọn khung giờ có thể đến',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                          icon: Icon(Icons.timelapse,
                              color: Colors.teal, size: 30),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 50,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                SizedBox(width: 10),
                                timeSelected(
                                    7, 9, select, 0, availableCheck[0]),
                                SizedBox(width: 10),
                                timeSelected(
                                    9, 11, select, 1, availableCheck[1]),
                                SizedBox(width: 10),
                                timeSelected(
                                    13, 15, select, 2, availableCheck[2]),
                                SizedBox(width: 10),
                                timeSelected(
                                    15, 17, select, 3, availableCheck[3]),
                                SizedBox(width: 10),
                                timeSelected(
                                    17, 19, select, 4, availableCheck[4]),
                                SizedBox(width: 10),
                                timeSelected(
                                    19, 21, select, 5, availableCheck[5]),
                                SizedBox(width: 10),
                              ],
                            );
                          },
                        )),
                    SizedBox(height: 10),
                    Container(
                      child: Column(
                        children: [
                          ToggleSwitch(
                            minHeight: 60,
                            minWidth: 150,
                            totalSwitches: 2,
                            activeBgColor: [Colors.teal],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.white,
                            inactiveFgColor: Colors.grey[400],
                            borderColor: [Colors.teal],
                            labels: ['Thanh toán ZaloPay', 'Tiền mặt'],
                            initialLabelIndex: _thanhToan,
                            onToggle: (index) {
                              print('switched to: $index');
                              setState(() {
                                _thanhToan = index!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 1500,
                      alignment: Alignment.center,
                      // margin:
                      //     EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: ElevatedButton(
                        child: Text("XÁC NHẬN"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            padding: EdgeInsets.all(15),
                            side: BorderSide(color: Colors.teal, width: 1.0)),
                        onPressed: () async {
                          _getSeconds(direction);
                          if (isLoading) return;
                          setState(() => isLoading = true);
                          await signup();
                          setState(() => isLoading = false);

                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.QUESTION,
                              borderSide:
                              BorderSide(color: Colors.teal, width: 2),
                              headerAnimationLoop: false,
                              animType: AnimType.SCALE,
                              body: Column(
                                children: [
                                  Text(
                                    'THÔNG TIN ĐẶT LỊCH',
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                      'Loại bênh: ${data['Loai benh'].toString()}'),
                                  Text(
                                      'Loại vắc xin: ${data['Ten vacxin'].toString()}'),
                                  Text(
                                      'Giá tiền cần thanh toán: ${data['price'].toString()}'),
                                  Text(
                                      'Giờ hẹn dự kiến: ${data['registerTimed']
                                          .toString()
                                          .split(
                                          ':')[0]}:${data['registerTimed']
                                          .toString()
                                          .split(':')[1]}'),
                                  Text(
                                      'Thông báo trước giờ hẹn ${data['minutes']
                                          .toString()
                                          .split(':')[1]} phút.'),
                                ],
                              ),
                              btnCancelText: 'HỦY',
                              btnOkText: _thanhToan == 0?'THANH TOÁN':'ĐẶT',
                              btnOkColor: Colors.teal,
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                if(_thanhToan == 0){
                                  setState(() {
                                    toast('Đăng ký thành công', Colors.green);
                                    Get.to(Detail(
                                        adres: widget.userlocation,
                                        des: data['address'],
                                        id: data['id'],
                                        type: '1',
                                        res: true,
                                        locationc: widget.locationc));
                                  });
                                }else{
                                  setState(() {
                                    toast('Đăng ký thành công', Colors.green);
                                    Get.to(Detail(
                                        adres: widget.userlocation,
                                        des: data['address'],
                                        id: data['id'],
                                        type: '1',
                                        res: true,
                                        locationc: widget.locationc));
                                  });
                                }

                              },
                              onDissmissCallback: (type) {
                                if (type == DismissType.OTHER ||
                                    type == DismissType.BTN_CANCEL)
                                  cancelSchedule(data['id']);
                              },
                              buttonsTextStyle:
                              TextStyle(fontSize: 14, color: Colors.white),
                            )
                              ..show();
                          }
                      ),
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
