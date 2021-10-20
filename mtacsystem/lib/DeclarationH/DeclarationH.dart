import 'package:flutter/material.dart';
import 'package:mtacsystem/Components/background.dart';

class DeclarationH extends StatelessWidget {
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
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
                      height: 200.0,
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
                            child: new Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 10),
                                  width: 330,
                                  child: Text(
                                    'Trong vòng 14 ngày qua, Anh/Chị có đến tỉnh/thành phố, quốc gia/vùng lãnh thổ nào (Có thể đi qua nhiều nơi)?',
                                    maxLines: 3,
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