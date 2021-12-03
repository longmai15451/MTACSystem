import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtacsystem/controller/vaccine_controller.dart';
import 'package:mtacsystem/models/vaccine.dart';

class VaccineInfo extends StatefulWidget {
  const VaccineInfo({ Key? key }) : super(key: key);

  @override
  _VaccineInfoState createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {
  final _vaccineController = VaccineController();
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