import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';
import 'package:mtacsystem/Screens/Register/SignUpVaccin3.dart';

class SignUpVaccin2 extends StatelessWidget {
  final format = DateFormat("dd-MM-yyy");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng ký tiêm chủng"),
      ),
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 350,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Tiền sử tiêm",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                        width: 360,
                        child: Table(
                          border: TableBorder.all(
                            color: Colors.black26,
                            style: BorderStyle.solid,
                            width: 1
                          ),
                          columnWidths: {
                            0: FlexColumnWidth(3),
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                            3: FlexColumnWidth(1),
                          },
                          children: [
                            TableRow( 
                              decoration: BoxDecoration(color: Colors.blue),
                              children: [
                                TableCell(child: SizedBox(height: 30, child: Center(child: Text('Tiền sử', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),),),)),
                                TableCell(child: SizedBox(height: 30, child: Center(child: Text('Có', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),),),)),
                                TableCell(child: SizedBox(height: 30, child: Center(child: Text('Không', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),),),)),
                                TableCell(child: SizedBox(height: 30, child: Center(child: Text('Không nhớ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),),),)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 40, 
                                      child: Text(
                                        '1. Tiền sử phản vệ từ độ 2 trở lên',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 40, 
                                      child: Text(
                                        '2. Tiền sử bị Covid-19 trong vòng 6 tháng',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 40, 
                                      child: Text(
                                        '3. Tiền sử tiêm vắc xin khác trong 14 ngày qua',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 50, 
                                      child: Text(
                                        '4. Tiền sử suy giảm miễn dịch, ung thư giai đoạn cuối, cắt lách, xơ gan mất bù...',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 100,
                                      child: Text(
                                        '5. Đang dùng thuốc ức chế miễn dịch, corticoid liều cao (tương đương hoặc hơn 2mg prednisonlon/kg/ngày trong ít nhất 7 ngày) hoặc điều trị hoá trị, xạ trị',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: SizedBox(
                                      height: 30, 
                                      child: Text(
                                        '6. Bệnh cấp tính',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 40,
                                      child: Text(
                                        '7. Tiền sử bệnh mã tính, đang tiến triển',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 40,
                                      child: Text(
                                        '8. Tiền sử bệnh mãn tính đang điều trị ổn',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 50,
                                      child: Text(
                                        '9. Tiền sử rối loạn đông máu/cầm máu hoặc đang dùng thuốc chống đông',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            TableRow( 
                              children: [
                                TableCell(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: SizedBox(
                                      height: 50,
                                      child: Text(
                                        '10. Tiền sử dị ứng với các dị nguyên khác',
                                        style: TextStyle(
                                          fontSize: 13
                                        )
                                      ),
                                    )
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                                TableCell(
                                  child: Container(
                                    
                                  )
                                ),
                                TableCell(child: SizedBox(height: 50,)),
                              ]
                            ),
                            
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SignUpVaccin3()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(70.0),
                        gradient: new LinearGradient(
                          colors: [Colors.blue.shade600, Colors.blue.shade300],
                          begin: FractionalOffset.bottomLeft,
                          end: FractionalOffset.topRight
                        )
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "Tiếp tục",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
