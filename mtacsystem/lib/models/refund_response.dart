class RefundResponse{
  final int returncode;
  final String returnmessage;
  final int subreturncode;
  final String subreturnmessage;
  final int refundid;

  RefundResponse(
      {
        required this.returncode,
        required this.returnmessage,
        required this.subreturncode,
        required this.subreturnmessage,
        required this.refundid,
  });

  factory RefundResponse.fromJson(Map<String, dynamic> json) {
    return RefundResponse(
      returncode: json['return_code'] as int,
      returnmessage: json['return_message'] as String,
      subreturncode: json['sub_return_code'] as int,
      subreturnmessage: json['sub_return_message'] as String,
      refundid: json['refund_id'] as int,
    );
  }

}