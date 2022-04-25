import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/Screens/Login/changePassword.dart';
import 'package:mtacsystem/Screens/Profile/test_result.dart';
import 'package:mtacsystem/Screens/Profile/vaccine_result.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'editProf.dart';
import 'package:mtacsystem/models/account.dart';

class Profile extends StatefulWidget {
  final AccountProfile accountdata;
  final bool locationc;
  const Profile({
    required this.accountdata,
    required this.locationc,
  });
  @override
  _Profile createState() => new _Profile(accountdata: accountdata);
}

class _Profile extends State<Profile> {
  AccountProfile accountdata;
  _Profile({
    required this.accountdata,
  });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: Colors.teal,
          title: Center(
              child: Text("THÔNG TIN",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ))),
        ),
        body: Container(
          child: ListView(
            children: [
              Container(
                //padding: EdgeInsets.only(top: 3.0),
                color: Colors.teal,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 170,
                          width: 170,
                          color: Colors.white,
                          child: QrImage(
                            data:
                                'https://https://mtacs.000webhostapp.com/id=0%3A1',
                            version: 4,
                            size: 250,
                            embeddedImage: AssetImage('assets/images/logo.png'),
                            embeddedImageStyle: QrEmbeddedImageStyle(
                              size: Size(150, 150),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.teal.shade100,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(50.0),
                            )),
                        child: Container(
                          height: 430,
                          child: Column(
                            children: <Widget>[
                              // Padding(
                              //   padding: const EdgeInsets.all(15.0),
                              //   child: Container(
                              //     height: 120,
                              //     width: 120,
                              //     decoration: BoxDecoration(
                              //       color: Colors.blue.shade100,
                              //       shape: BoxShape.circle,
                              //       border:
                              //           Border.all(color: Colors.white, width: 1.5),
                              //       image: DecorationImage(
                              //         fit: BoxFit.cover,
                              //         image: AssetImage(
                              //           'assets/images/AVT.jpg',
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, top: 3.0),
                                child: Text(accountdata.fullName.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2.0, bottom: 10.0),
                                child: Text(accountdata.phone.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () async {
                                    await Get.to(EditProfile(
                                        accountdata: accountdata,
                                        locationc: widget.locationc));
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 20),
                                        Text('Chỉnh sửa thông tin',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        SizedBox(width: 12),
                                        Icon(Icons.mode_edit_outline, size: 25),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => TestResultScreen(
                                          account: accountdata,
                                        ));
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 20),
                                        Text('Kết quả xét nghiệm',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        SizedBox(width: 15),
                                        ImageIcon(
                                          AssetImage(
                                              'assets/images/pcr-test.png'),
                                          size: 25.0,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => VaccineResult(
                                          account: accountdata,
                                        ));
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text('Kết quả tiêm phòng',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        SizedBox(width: 13),
                                        ImageIcon(
                                            AssetImage(
                                                'assets/images/safe.png'),
                                            size: 25.0,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.NO_HEADER,
                                      borderSide: BorderSide(
                                          color: Colors.teal, width: 2),
                                      headerAnimationLoop: false,
                                      animType: AnimType.BOTTOMSLIDE,
                                      body: Column(children: [
                                        ListTile(
                                            title: TextButton(
                                          onPressed: () {
                                            Get.to(
                                              ChangePassword(
                                                phone: accountdata.phone
                                                    .toString(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'ĐỔI MẬT KHẨU',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ))
                                      ]),
                                    )..show();
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Text(
                                          'Cài đặt',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 45),
                                        Icon(Icons.settings, size: 25),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Text(
                                          'Trợ giúp',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(width: 40),
                                        Icon(Icons.help, size: 25),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  onTap: () async {
                                    Get.offAll(LoginScreen());
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 65,
                                        ),
                                        Text('Đăng Xuất',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            )),
                                        SizedBox(width: 33),
                                        Icon(Icons.exit_to_app, size: 25),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
