import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCodeController extends GetxController {
  String scanQrCode = '';

  void _launchURL() async => await canLaunch(scanQrCode)
      ? await launch(scanQrCode)
      : throw 'Could not launch $scanQrCode';
  Future<void> scanQR() async {
    try {
      scanQrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      // Get.snackbar(
      //   "Result",
      //   "QR code" + scanQrCode,
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: Colors.green,
      //   colorText: Colors.white,
      // );
      _launchURL();
    } on PlatformException {}
  }
}
