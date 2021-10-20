import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';

class DeclarationH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Thông tin khai báo y tế",
          ),
          bottom: TabBar(tabs: <Widget>[
            Tab(child: Text('Khai báo y tế')),
            Tab(child: Text('Tờ khai báo y tế của tôi')),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          ListView(
            children: <Widget>[
              Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 5),
                alignment: Alignment.topCenter,
                child: Column( 
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Thông tin khai báo y tế',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),  
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 250,
                          child: Text(
                            'Khuyến cáo: Khai báo thông tin sai là vi phạm pháp luật Việt Nam và có thể xử lý hình sự',
                            style: TextStyle(
                              color: Colors.red, fontSize: 12, 
                              fontWeight: FontWeight.w600
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ), 
                        ),
                      ],
                    ),
                    
                    Container(
                      height: 200.0,
                      width: 365.0,
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 2))
                        ],
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey.shade100],
                            begin: FractionalOffset.bottomLeft,
                            end: FractionalOffset.topRight),
                      ),
                    ),
                    Container(
                      height: 140.0,
                      width: 365.0,
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 2))
                        ],
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey.shade100],
                            begin: FractionalOffset.bottomLeft,
                            end: FractionalOffset.topRight),
                      ),
                      child:  Column(
                        children: <Widget>[
                          Container(
                            child: new Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10,left: 10, top: 10),
                                  width: 330,
                                  child: Text(
                                    'Trong vòng 14 ngày qua, Anh/Chị có đến tỉnh/thành phố, quốc gia/vùng lãnh thổ nào (Có thể đi qua nhiều nơi)?',
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 15
                                    ),
                                  ),
                                ),
                              ],
                            ),
                             
                          ),
                          Container(
                          )
                        
                        ],
                      ),
                    ),
                    Container(
                      height: 140.0,
                      width: 365.0,
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 2))
                        ],
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey.shade100],
                            begin: FractionalOffset.bottomLeft,
                            end: FractionalOffset.topRight),
                      ),
                      child:  Column(
                        children: <Widget>[
                          Container(
                            child: new Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10,left: 10, top: 10),
                                  width: 330,
                                  child: Text(
                                    'Trong vòng 14 ngày qua, Anh/Chị có thấy xuất hiện ít nhất 1 trong các dấu hiệu: sốt, ho, khó thở, viêm phổi, đau họng, mệt mỏi không?',
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 15
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                          )
                        
                        ],
                      ),
                    ),
                    Container(
                      height: 250.0,
                      width: 365.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 2))
                        ],
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey.shade100],
                            begin: FractionalOffset.bottomLeft,
                            end: FractionalOffset.topRight),
                      ),
                      child:  Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10,left: 10, top: 10),
                                  width: 330,
                            child: Text(
                              'Trong vòng 14 ngày qua, Anh/Chị có tiếp xúc vơi.'
                            ),
                          ),
                          Container(
                            child: new Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 10,left: 20, top: 10),
                                  width: 330,
                                  child: Table(
                                    border: TableBorder.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 2
                                    ),
                                    columnWidths: {
                                      0: FlexColumnWidth(3),
                                      1: FlexColumnWidth(1),
                                      2: FlexColumnWidth(1),
                                    },
                                    children: [
                                      // TableRow(
                                      //   children: [
                                      //     Column(children: [Text('')]),
                                      //     Column(children: [Text('Có')],),
                                      //     Column(children: [Text('Không')],)
                                      //   ]
                                      // ),
                                      TableRow( 
                                        decoration: BoxDecoration(color: Colors.blue),
                                        children: [
                                          TableCell(child: SizedBox(height: 30,)),
                                          TableCell(child: SizedBox(height: 30, child: Center(child: Text('Có', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),),)),
                                          TableCell(child: SizedBox(height: 30, child: Center(child: Text('Không', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),),),)),
                                        ]
                                      ),
                                      TableRow( 
                                        children: [
                                          TableCell(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 8, top: 8),
                                              child: SizedBox(
                                                height: 50, 
                                                child: Text(
                                                  'Người bệnh hoặc nghi ngờ, mắc bệnh COVID-19',
                                                  style: TextStyle(
                                                    fontSize: 15
                                                  )
                                                ),
                                              )
                                            )
                                          ),
                                          TableCell(child: SizedBox(height: 50,)),
                                          TableCell(child: SizedBox(height: 50,)),
                                        ]
                                      ),
                                      TableRow( 
                                        children: [
                                          TableCell(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 8, top: 8),
                                              child: SizedBox(
                                                height: 50, 
                                                child: Text(
                                                  'Người từ nước có bệnh COVID-19',
                                                  style: TextStyle(
                                                    fontSize: 15
                                                  )
                                                ),
                                              )
                                            )
                                          ),
                                          TableCell(child: SizedBox(height: 50,)),
                                          TableCell(child: SizedBox(height: 50,)),
                                        ]
                                      ),
                                      TableRow( 
                                        children: [
                                          TableCell(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 8, top: 8),
                                              child: SizedBox(
                                                height: 50, 
                                                child: Text(
                                                  'Người có biểu hiện (Sốt, ho, khó thở, viêm phổi)',
                                                  style: TextStyle(
                                                    fontSize: 15
                                                  )
                                                ),
                                              )
                                            )
                                          ),
                                          TableCell(child: SizedBox(height: 50,)),
                                          TableCell(child: SizedBox(height: 50,)),
                                        ]
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ), 
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          child: RaisedButton(
                            onPressed: () {},
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
                                "Gửi tờ khai",
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
            ],
          ),
            ],
          ),
          
          Container()
        ]),
      ),
    );
  }
}