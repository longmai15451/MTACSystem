import 'package:flutter/cupertino.dart';
import 'package:mtacsystem/Components/account.dart';
import 'package:mtacsystem/Components/genderSelect.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final AccountProfile accountdata;

  const EditProfile({Key? key, required this.accountdata}) : super(key: key);
  @override
  _EditProfile createState() => _EditProfile(accountdata);
}

class _EditProfile extends State<EditProfile> {
  final AccountProfile accountdata;
  bool _isObscure = false;
  late int check1;
  late int check2;
  late int check3;
  late int check4;
  late int check5;
  late int check6;
  late int check7;
  late int check8;
  late int check9;
  late int check10;
  late TextEditingController name;
  late TextEditingController birthdate;
  late TextEditingController phone = new TextEditingController(text: accountdata.phone.toString());
  late TextEditingController cccd = new TextEditingController(text: accountdata.idCard.toString());
  late TextEditingController job = new TextEditingController(text: accountdata.job.toString());
  _EditProfile(this.accountdata,);

  @override
  initState() {
    setState(() {
      //0 = Có , 1 = Không, 2 =...
      check1 = check2 = check3 = check4 =
          check5 = check6 = check7 = check8 = check9 = check10 = 1; //bỏ vào
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin cá nhân'),
          bottom: TabBar(tabs: <Widget>[
            Tab(child: Text('Thông tin cá nhân')),
            Tab(child: Text('Tiền sử bệnh')),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50.0),
                              )),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 1.5),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/images/Splash.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 20, top: 10),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text('Họ và tên '),
                                    new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: TextField(
                                  controller: name= new TextEditingController(text: accountdata.fullName.toString()),
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  // initialValue: 'Input text',
                                  decoration: InputDecoration(
                                    hintText: 'Họ và tên ',
                                    // errorText: 'Error message', ------ báo lỗi k nhập
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Ngày sinh '),
                                        new Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 130, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Giới tính '),
                                        new Text(
                                          "*",
                                          style: TextStyle(color: Colors.red),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 170,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            left: 20, right: 10),
                                        child: TextFormField(
                                          controller: birthdate = new TextEditingController(text: accountdata.birthDate.toString()),
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(fontSize: 15),
                                          readOnly: true,
                                          // initialValue: 'Input text',
                                          decoration: InputDecoration(
                                            hintText: 'Ngày sinh',
                                            // errorText: 'Error message', ------ báo lỗi k nhập
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            suffixIcon: Icon(
                                              Icons.calendar_today,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 21, vertical: 5),
                                        child: Gender(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              //Ngày Sinh Giới Tính
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 10),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text('Số điện thoại '),
                                    new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  // initialValue: 'Input text',
                                  decoration: InputDecoration(
                                    hintText: 'Số điện thoại',
                                    // errorText: 'Error message', ------ báo lỗi k nhập
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 10),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text('Sổ hộ chiếu/CMND/CCCD '),
                                    new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(fontSize: 15),
                                  // initialValue: 'Input text',
                                  decoration: InputDecoration(
                                    hintText: 'Sổ hộ chiếu/CMND/CCCD',
                                    // errorText: 'Error message', ------ báo lỗi k nhập
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Dân tộc '),
                                        new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Dân tộc',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Nghề nghiệp '),
                                        new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Nghề nghiệp',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Số thẻ BHYT '),
                                        new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Số thẻ BHYT',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Tỉnh/Thành phố '),
                                        new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Tỉnh/Thành phố',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Quận/Huyện '),
                                        new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Quận/Huyện',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Phường/Xã '),
                                        new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Phường/Xã',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Địa chỉ '),
                                        new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Địa chỉ',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20, top: 10),
                                    child: new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text('Quốc tịch '),
                                        new Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      style: TextStyle(fontSize: 15),
                                      // initialValue: 'Input text',
                                      decoration: InputDecoration(
                                        hintText: 'Quốc tịch',
                                        // errorText: 'Error message', ------ báo lỗi k nhập
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 10),
                                        child: RaisedButton(
                                            onPressed: () {},
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        70.0)),
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.all(0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 50.0,
                                              width: size.width * 0.5,
                                              decoration: new BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          70.0),
                                                  gradient: new LinearGradient(
                                                      colors: [
                                                        Colors.blue.shade600,
                                                        Colors.blue.shade300
                                                      ],
                                                      begin: FractionalOffset
                                                          .bottomLeft,
                                                      end: FractionalOffset
                                                          .topRight)),
                                              padding: const EdgeInsets.all(0),
                                              child: Text("Cập nhật",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          width: 360,
                          child: Table(
                            border: TableBorder.all(
                                color: Colors.black26,
                                style: BorderStyle.solid,
                                width: 1),
                            columnWidths: {
                              0: FlexColumnWidth(3),
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(color: Colors.blue),
                                  children: [
                                    TableCell(
                                        child: SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          'Tiền sử',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                                    TableCell(
                                        child: SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          'Có',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                                    TableCell(
                                        child: SizedBox(
                                      height: 30,
                                      child: Center(
                                        child: Text(
                                          'Không',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )),
                                  ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '1. Tiền sử phản vệ từ độ 2 trở lên',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check1 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check1 == 1 || check1 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check1 == 1 || check1 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check1 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check1 == 0 || check1 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check1 == 0 || check1 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '2. Tiền sử bị Covid-19 trong vòng 6 tháng',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check2 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check2 == 1 || check2 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check2 == 1 || check2 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check2 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check2 == 0 || check2 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check2 == 0 || check2 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '3. Tiền sử tiêm vắc xin khác trong 14 ngày qua',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check3 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check3 == 1 || check3 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check3 == 1 || check3 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check2 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check3 == 0 || check3 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check3 == 0 || check3 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 50,
                                          child: Text(
                                              '4. Tiền sử suy giảm miễn dịch, ung thư giai đoạn cuối, cắt lách, xơ gan mất bù...',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check4 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check4 == 1 || check4 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check4 == 1 || check4 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check4 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check4 == 0 || check4 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check4 == 0 || check4 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 100,
                                          child: Text(
                                              '5. Đang dùng thuốc ức chế miễn dịch, corticoid liều cao (tương đương hoặc hơn 2mg prednisonlon/kg/ngày trong ít nhất 7 ngày) hoặc điều trị hoá trị, xạ trị',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check5 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check5 == 1 || check5 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check5 == 1 || check5 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check5 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check5 == 0 || check5 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check5 == 0 || check5 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: SizedBox(
                                          height: 30,
                                          child: Text('6. Bệnh cấp tính',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check6 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check6 == 1 || check6 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check6 == 1 || check6 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check6 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check6 == 0 || check6 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check6 == 0 || check6 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '7. Tiền sử bệnh mã tính, đang tiến triển',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check7 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check7 == 1 || check7 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check7 == 1 || check7 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check7 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check7 == 0 || check7 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check7 == 0 || check7 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 40,
                                          child: Text(
                                              '8. Tiền sử bệnh mãn tính đang điều trị ổn',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check8 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check8 == 1 || check8 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check8 == 1 || check8 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check8 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check8 == 0 || check8 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check8 == 0 || check8 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 50,
                                          child: Text(
                                              '9. Tiền sử rối loạn đông máu/cầm máu hoặc đang dùng thuốc chống đông',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check9 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check9 == 1 || check9 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check9 == 1 || check9 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check9 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check9 == 0 || check9 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color: (check9 == 0 || check9 == 2)
                                                ? Colors.black
                                                : Colors.blue,
                                          ),
                                        ))),
                              ]),
                              TableRow(children: [
                                TableCell(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            left: 8, top: 8, right: 8),
                                        child: SizedBox(
                                          height: 50,
                                          child: Text(
                                              '10. Tiền sử dị ứng với các dị nguyên khác',
                                              style: TextStyle(fontSize: 13)),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check10 = 0;
                                              });
                                            },
                                            icon: Icon(
                                                (check10 == 1 || check10 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color:
                                                (check10 == 1 || check10 == 2)
                                                    ? Colors.black
                                                    : Colors.blue,
                                          ),
                                        ))),
                                TableCell(
                                    child: SizedBox(
                                        height: 50,
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                check10 = 1;
                                              });
                                            },
                                            icon: Icon(
                                                (check10 == 0 || check10 == 2)
                                                    ? Icons.radio_button_off
                                                    : Icons.radio_button_on),
                                            iconSize: 20,
                                            color:
                                                (check10 == 0 || check10 == 2)
                                                    ? Colors.black
                                                    : Colors.blue,
                                          ),
                                        ))),
                              ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
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
                                  colors: [
                                    Colors.blue.shade600,
                                    Colors.blue.shade300
                                  ],
                                  begin: FractionalOffset.bottomLeft,
                                  end: FractionalOffset.topRight)),
                          padding: const EdgeInsets.all(0),
                          child: Text("Cập nhật",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
