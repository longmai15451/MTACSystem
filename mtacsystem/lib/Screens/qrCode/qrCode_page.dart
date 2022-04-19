import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Screens/qrCode/qrCode_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends GetWidget<QRCodeController> {
  var controller = Get.put(QRCodeController());
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
            SizedBox(height: 10),
            Container(
              child: Text("Mã QR của tôi",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal)),
            ),
            SizedBox(height: 10),
            QrImage(
              data:
                  'https://www.figma.com/file/mF7hGiZFz5O58TjpjXFnru/Paracel-CRM?node-id=0%3A1',
              version: QrVersions.auto,
              size: 310,
              embeddedImage: AssetImage('assets/images/logo.png'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(150, 150),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text(
                  "Scan QR Code",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
                onPressed: () {
                  controller.scanQR();
                  //Get.to(() => QRViewExample());
                })
          ],
        ),
      ),
    );
  }

  
}
