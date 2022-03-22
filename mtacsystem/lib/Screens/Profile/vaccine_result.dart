

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/controller/result_controller.dart';
import 'package:mtacsystem/models/account.dart';
import 'package:mtacsystem/models/diseases.dart';
import 'package:mtacsystem/models/result.dart';

class VaccineResult extends StatefulWidget {
  final AccountProfile account;

  const VaccineResult({Key? key, required this.account}) : super(key: key);
	@override
	_VaccineResult createState() => _VaccineResult();
}

class _VaccineResult extends State<VaccineResult>{
  late Future<List<Diseases>> diseaseData;
  late bool selectDisease;
  late Future<List<VacResult>> resultdata;
  String? idDis;
  TextEditingController dis = new TextEditingController();
  @override
  initState() {
    _getDisease();
    super.initState();
    selectDisease = false;
  }

  _getDisease()async{
    diseaseData = ResultController().fetchData(widget.account.idCard!);
    setState((){});
  }


	@override
	Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        title: Expanded(child: Text('KẾT QUẢ TIÊM')),
		),
		body: SingleChildScrollView(
				padding: EdgeInsets.all(18),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
					children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Họ Tên:',
                              style: TextStyle(
                                fontSize: 16
                                
                              ),
                            ),
                            Text('${widget.account.fullName}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Ngày sinh:',style: TextStyle(fontSize: 16)),
                            Text('${widget.account.birthDate}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('CCCD:',style: TextStyle(fontSize: 16)),
                            Text('${widget.account.idCard}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Số điện thoại:',style: TextStyle(fontSize: 16)),
                            Text('${widget.account.phone}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('BHYT:',style: TextStyle(fontSize: 16)),
                            Text('${widget.account.healthCard}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,)),
                          ],
                        ),
                ],
              ),
            ),
            SizedBox(height: 10),
						Container(
                width: 150,
                height: 30,
                child: TextField(
                  controller: dis,
                  onTap: () {
                    showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Danh Sách bệnh',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        content: diseaseAlertDialogContainer(),
                      );
                    }
                  );
                    setState(() {
                    });
                  },
                  style: TextStyle(fontSize: 15),
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: ('Loại bệnh'),
                    hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.grey),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                   ),  
                  ),
                ),
            ),
            SizedBox(height: 5),
            if(selectDisease == false)
              Text('Vui lòng chọn loại bệnh.',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            if(selectDisease == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder <List<VacResult>>(
                  future: resultdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<VacResult> data = snapshot.data!;
                        return Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: buildDataTable(data)
                            ),
                          ),
                        );}
                    else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      // By default show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                ],
              ),
					]
				)
			)
	);
  
  Widget diseaseAlertDialogContainer(){
    return Container(
      height: 300,
      width: 300,
      child: FutureBuilder <List<Diseases>>(
            future: diseaseData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Diseases> data = snapshot.data!;
                return 
                ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index){
                  return Column(
                    children: [
                      for(int i=0; i<data.length; ++i)
                      TextButton(
                        onPressed: () async {
                            index = i;
                            resultdata = ResultController().fetchVResultData(widget.account.idCard!, data[i].idDiseases!);
                            selectDisease = true;
                            setState((){
                              dis.text = '${data[i].diseaseName}';
                              idDis = data[i].idDiseases;
                              print(idDis);
                              Get.back();
                            });
                          },
                        child: ListTile(
                          title: Text('${data[i].diseaseName}'),
                        ),
                      ),
                    ],
                  );
                }
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
    );
  }

  Widget buildDataTable(List<VacResult> data){
    final columns = ['Mũi số', 'Tên vaccine', 'Thời gian tiêm','Địa điểm tiêm'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(data),
      horizontalMargin: 0,
      columnSpacing: 25,
    );
  }
  List<DataColumn> getColumns(List<String> columns) => columns
  .map((String column) => DataColumn(label: Text(column,style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold),))).toList();
  List<DataRow> getRows(List<VacResult> results) => results
  .map((VacResult result){
    final cells = [result.injectionTime,result.vaccineName,result.datatime,result.address];
    return DataRow(cells: getCells(cells));
  }).toList();
  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data)=>DataCell(Text('$data',style: TextStyle(fontSize: 16)))).toList();
}