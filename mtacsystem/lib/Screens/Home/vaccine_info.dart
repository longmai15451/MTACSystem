import 'package:awesome_dialog/awesome_dialog.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('THÔNG TIN VACCINE'),centerTitle: true,),
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
                        color: Colors.green.shade200,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          onTap: (){
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.INFO,
                              borderSide: BorderSide(color: Colors.blue, width: 2),
                              headerAnimationLoop: false,
                              animType: AnimType.BOTTOMSLIDE,
                              btnOkColor: Colors.blue.shade600,
                              body: 
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Xuất xứ: ${list[index].country.toString()}"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Thông tin: ${list[index].description.toString()}"),
                                ),
                                ExpansionTile(
                                  title: Text("Dùng điều trị: ${list[index].diseaseName.toString()}"),
                                  trailing: Icon(Icons.arrow_drop_down),
                                  onExpansionChanged: (value){
                                    setState((){
                                      isExpand = value;
                                    });
                                  },
                                  children: [
                                      Text("Triệu chứng: ${list[index].symptom.toString()}"),
                                  ]
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Độ tuổi từ ${list[index].ageUseFrom.toString()} đến ${list[index].ageUseTo.toString()}"),
                                ),
                                SizedBox(height:10)
                              ],
                            ),
                            buttonsTextStyle: TextStyle(fontSize: 13),
                          )..show();
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