import 'package:flutter/material.dart';
import 'editProf.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top: 6.0),
      color: Colors.blue.shade200,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 160,
                width: 160,
                color: Colors.white,
                child: Container(color: Colors.red, width:150, height:150,child: Image.asset('assets/images/An-example-of-QR-code.png')),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0,1.0),
                    blurRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50.0),
                )
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        shape: BoxShape.circle,
                        border: Border.all(color:Colors.white,width:1.5),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                          'assets/images/AVT.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0,top:3.0),
                    child: Text(
                      'Nguyen Van A',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0,bottom: 10.0),
                    child: Text('0123456789'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfile()));
                      },
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.black,width:1.5),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 30,height: 30,),
                            Text('Chỉnh sửa thông tin'),
                            Spacer(),
                            Icon(Icons.mode_edit_outline,size:20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.black,width:1.5),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 30,height: 30,),
                            Text('Kết quả xét nghiệm'),
                            Spacer(),
                            ImageIcon(
                              AssetImage('assets/images/pcr-test.png'),
                              size: 20.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.black,width:1.5),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 30,height: 30,),
                            Text('Kết quả tiêm phòng'),
                            Spacer(),
                            ImageIcon(
                              AssetImage('assets/images/safe.png'),
                              size: 20.0,
                              color: Colors.black
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.black,width:1.5),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 70,height: 30,),
                            Text('Cài đặt'),
                            Spacer(),
                            Icon(Icons.settings,size:20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.black,width:1.5),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 70,height: 30,),
                            Text('Trợ giúp'),
                            Spacer(),
                            Icon(Icons.help,size:20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: ()async{
                          Navigator.pop(context);
                      },
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.black,width:1.5),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 65,height: 30,),
                            Text('Đăng Xuất'),
                            Spacer(),
                            Icon(Icons.exit_to_app,size:20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}