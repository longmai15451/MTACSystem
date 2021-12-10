import 'package:flutter/material.dart';
import 'package:mtacsystem/controller/vaccine_controller.dart';
import 'package:mtacsystem/models/vaccine.dart';

class VaccineInfo extends StatefulWidget {
  const VaccineInfo({ Key? key }) : super(key: key);

  @override
  _VaccineInfoState createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {
  final _vaccineController = VaccineController();
  bool isExpand = false;
  List<Vaccine> list=[];
  @override
  initState() {
    _getVaccine();
    super.initState();
  }

  void _getVaccine() async{
    _vaccineController.getSearchData();
    list = _vaccineController.vaccineList;
  }

    void _runFilter(String enteredKeyword) {
    List<Vaccine> results;
    if (enteredKeyword.isEmpty) {
      results = _vaccineController.vaccineList;
    } else {
      results =  _vaccineController.vaccineList
          .where((vaccine) =>
              vaccine.vacName.toString().toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      list = results;
    });
  }

  alertDialog(Vaccine vaccine){
    return Container(
      height: 300,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Xuất xứ: ${vaccine.country.toString()}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Thông tin: ${vaccine.description.toString()}"),
            ),
            ExpansionTile(
              title: Text("Dùng điều trị: ${vaccine.diseaseName.toString()}"),
              trailing: Icon(Icons.arrow_drop_down),
              onExpansionChanged: (value){
                setState((){
                  isExpand = value;
                });
              },
              children: [
                  Text("Triệu chứng: ${vaccine.symptom.toString()}"),
              ]
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Độ tuổi từ ${vaccine.ageUseFrom.toString()} đến ${vaccine.ageUseTo.toString()}"),
            ),
          ],
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thông Tin Vaccine'),centerTitle: true,),
      body:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: list.isNotEmpty
                  ? ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(list[index].idVac),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text(list[index].vacName.toString()),
                                  content: alertDialog(list[index]),
                                );
                              }
                            );
                          },
                          leading: Text(
                            list[index].idVac.toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(list[index].vacName.toString()),
                          subtitle: Text(
                              'Xuất xứ: ${list[index].country.toString()}'),
                        ),
                      ),
                    )
                  : const Text(
                      'Không tìm thấy kết quả',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}