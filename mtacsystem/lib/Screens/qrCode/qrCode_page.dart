import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Screens/qrCode/qrCode_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mtacsystem/models/account.dart';

class QRCodePage extends GetWidget<QRCodeController> {
  var controller = Get.put(QRCodeController());
  final AccountProfile accountdata;

  QRCodePage(this.accountdata);
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0,
          centerTitle: true,
          title: Text("QR CODE")),
      body: Container(
        width: screenSize.width,
        color: Colors.teal.shade50,
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              child: Text(accountdata.fullName.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(5),
              height: 250.0,
              width: 255.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.teal.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 15,
                      offset: Offset(0, 5))
                ],
                gradient: LinearGradient(
                    colors: [Colors.white70, Colors.white70, Colors.white70],
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight),
              ),
              //QR CODE
              child: Column(
                children: [
                  QrImage(
                    data: 'https://https://mtacs.000webhostapp.com/id=0%3A1',
                    version: 4,
                    size: 250,
                    embeddedImage: AssetImage('assets/images/logo.png'),
                    embeddedImageStyle: QrEmbeddedImageStyle(
                      size: Size(150, 150),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
              onPressed: () {
                controller.scanQR();
              },
              label: Text(
                "Scan QR Code",
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
