import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:mtacsystem/repo/payment.dart';
import 'package:mtacsystem/repo/zalo_pay_config.dart';
import 'package:sprintf/sprintf.dart';
import 'package:crypto/crypto.dart';

/// Function Format DateTime to String with layout string
String formatNumber(double value) {
  final f = new NumberFormat("#,###", "vi_VN");
  return f.format(value);
}

/// Function Format DateTime to String with layout string
String formatDateTime(DateTime dateTime, String layout) {
  return DateFormat(layout).format(dateTime).toString();
}

int transIdDefault = 1;
String getAppTransId() {
  if (transIdDefault >= 100000) {
    transIdDefault = 1;
  }

  transIdDefault += 1;
  var timeString = formatDateTime(DateTime.now(), "yyMMdd_hhmmss");
  return sprintf("%s%06d",[timeString, transIdDefault]);
}

String getTimestamp(){
  var timestamp = formatDateTime(DateTime.now(), "yyMMdd_hhmmss");
  return timestamp.toString().split('_')[0];
}

String getBankCode() => "zalopayapp";
String getDescription(String apptransid) => "Merchant Demo thanh toán cho đơn hàng  #$apptransid";

String getMacCreateOrder(String data) {
  var hmac =  new Hmac(sha256, utf8.encode(ZaloPayConfig.key1));
  return hmac.convert(utf8.encode(data)).toString();
}