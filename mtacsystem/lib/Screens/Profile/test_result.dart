
import 'package:flutter/material.dart';
import 'package:mtacsystem/controller/result_controller.dart';
import 'package:mtacsystem/models/account.dart';
import 'package:mtacsystem/models/result.dart';

class TestResultScreen extends StatefulWidget{
  final AccountProfile account;

  const TestResultScreen({Key? key, required this.account}) : super(key: key);
	@override
	_TestResult createState() => _TestResult();
}

class _TestResult extends State<TestResultScreen>{
  late Future<List<TestResult>> resultdata;
  String? idDis;
  TextEditingController dis = new TextEditingController();
  @override
  initState() {
    super.initState();
    resultdata = ResultController().fetchTResultData(widget.account.idCard!);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
		appBar: AppBar(
			title: Text('KẾT QUẢ XÉT NGHIỆM'),
      centerTitle: true,
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
                      Text('Họ Tên:'),
                      Text('${widget.account.fullName}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ngày sinh:'),
                      Text('${widget.account.birthDate}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CCCD:'),
                      Text('${widget.account.idCard}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Số điện thoại:'),
                      Text('${widget.account.phone}'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BHYT:'),
                      Text('${widget.account.healthCard}'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder <List<TestResult>>(
                  future: resultdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<TestResult> data = snapshot.data!;
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
  
  Widget buildDataTable(List<TestResult> data){
    final columns = ['Ngày', 'Kết quả', 'Địa điểm xét nghiệm'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(data),
      horizontalMargin: 0,
      columnSpacing: 25,
    );
  }
  List<DataColumn> getColumns(List<String> columns) => columns
  .map((String column) => DataColumn(label: Text(column))).toList();
  List<DataRow> getRows(List<TestResult> results) => results
  .map((TestResult result){
    final cells = [result.datatime,result.diseaseName,result.address];
    return DataRow(cells: getCells(cells));
  }).toList();
  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data)=>DataCell(Text('$data'))).toList();
}