import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/Screens/Login/Login.dart';
import 'package:mtacsystem/Screens/Profile/test_result.dart';
import 'package:mtacsystem/Screens/Profile/vaccine_result.dart';
import 'editProf.dart';
import 'package:mtacsystem/models/account.dart';

class Profile extends StatefulWidget{
  final AccountProfile accountdata;
  final bool locationc;
  const Profile({
    required this.accountdata, required this.locationc,
  });
  @override
  _Profile createState() => new _Profile(accountdata: accountdata);
}

class _Profile extends State<Profile>{
  AccountProfile accountdata;
  _Profile({
    required this.accountdata,
  });
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      backgroundColor: Colors.blue.shade200,
      title: Padding(
        padding: const EdgeInsets.only(left: 280.0),
        child: Container(
          child: IconButton(
            onPressed: () async{
                 Get.offAll(LoginScreen());
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
            iconSize: 40.0,
          ),
        ),
      ),
    ),
    body: ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 6.0),
          color: Colors.blue.shade200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    color: Colors.white,
                    child: Container(color: Colors.red, width:160, height:160,child: Image.asset('assets/images/An-example-of-QR-code.png')),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                          accountdata.fullName.toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0,bottom: 10.0),
                        child: Text(accountdata.phone.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () async {
                            await Get.to(EditProfile(accountdata: accountdata,locationc: widget.locationc));
                            setState(() {
                            });
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
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: (){
                            Get.to(()=>TestResultScreen(account: accountdata,));
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
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: (){
                            Get.to(()=>VaccineResult(account: accountdata,));
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
                        padding: const EdgeInsets.all(4.0),
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
                        padding: const EdgeInsets.all(4.0),
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
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: ()async{
                             Get.offAll(LoginScreen());
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
        ),
      ],
    )
    );
  }
}