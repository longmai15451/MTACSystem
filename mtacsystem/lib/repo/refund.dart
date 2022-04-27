
import 'package:http/http.dart' as http;
import 'package:mtacsystem/models/refund_response.dart';
import 'dart:async';
import 'dart:convert';
import 'package:mtacsystem/utils/endpoints.dart';
import 'package:mtacsystem/utils/util.dart' as utils;
import 'package:sprintf/sprintf.dart';
import 'dart:math';
import 'zalo_pay_config.dart';



Future<RefundResponse?> refundOrder(String token, double price) async {
  var header = new Map<String, String>();
  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  var rand = Random();
  String uid = timestamp + "" + (111+rand.nextInt(888)).toString();
  String refundId = utils.getTimestamp()+'_'+ZaloPayConfig.appId+'_'+uid;
  String des = 'Đã hoàn tiền';
  header["Content-Type"] = "application/x-www-form-urlencoded";

  var body = new Map<String, String>();
  body['m_refund_id'] = refundId;
  body["app_id"] = ZaloPayConfig.appId;
  body["zp_trans_id"] = token;
  body["amount"] = price.toStringAsFixed(0);
  body["timestamp"] = DateTime.now().millisecondsSinceEpoch.toString();
  body["description"] = des;


  var dataGetMac = sprintf("%s|%s|%s|%s|%s", [
    body["app_id"],
    body["zp_trans_id"],
    body["amount"],
    body["description"],
    body["timestamp"]
  ]);
  body["mac"] = utils.getMacCreateOrder(dataGetMac);
  print("mac: ${body["mac"]}");
  String ss = Uri.encodeFull(Endpoints.refundUrl);
  http.Response response = await http.post(
    Uri.parse(ss),
    headers: header,
    body: body,
  );

  print("body_request: $body");
  if (response.statusCode != 200) {
    return null;
  }

  var data = jsonDecode(response.body);
  print("data_response: $data}");

  return RefundResponse.fromJson(data);
}
