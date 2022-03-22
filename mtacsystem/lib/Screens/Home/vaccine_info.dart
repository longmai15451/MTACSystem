import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mtacsystem/controller/vaccine_controller.dart';
import 'package:mtacsystem/models/vaccine.dart';

class VaccineInfo extends StatefulWidget {
  const VaccineInfo({Key? key}) : super(key: key);

  @override
  _VaccineInfoState createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {
  final _vaccineController = VaccineController();
  bool isExpand = false;
  List<Vaccine> list = [];
  @override
  initState() {
    _getVaccine();
    super.initState();
  }

  void _getVaccine() async {
    _vaccineController.getSearchData();
    list = _vaccineController.vaccineList;
  }

  void _runFilter(String enteredKeyword) {
    List<Vaccine> results;
    if (enteredKeyword.isEmpty) {
      results = _vaccineController.vaccineList;
    } else {
      results = _vaccineController.vaccineList
          .where((vaccine) => vaccine.vacName
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
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
      appBar: AppBar(
          toolbarHeight: 70.0,
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text(
            'THÔNG TIN VACCINE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Roboto",
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          )),
      body: Container(
        color: Colors.teal.shade50,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) => _runFilter(value),
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    labelStyle: TextStyle(fontSize: 16, color: Colors.teal),
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search, color: Colors.teal, size: 40)),
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
                          color: Colors.teal,
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            onTap: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.NO_HEADER,
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 2),
                                headerAnimationLoop: true,
                                animType: AnimType.SCALE,
                                btnOkColor: Colors.teal,
                                body: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Xuất xứ: ${list[index].country.toString()}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Thông tin: ${list[index].description.toString()}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    ExpansionTile(
                                        collapsedTextColor: Colors.black,
                                        collapsedIconColor: Colors.black,
                                        iconColor: Colors.black,
                                        textColor: Colors.black,
                                        title: Text(
                                          "Dùng điều trị: ${list[index].diseaseName.toString()}",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        onExpansionChanged: (value) {
                                          setState(() {
                                            isExpand = value;
                                          });
                                        },
                                        children: [
                                          Text(
                                            "Triệu chứng: ${list[index].symptom.toString()}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ]),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        "Độ tuổi từ ${list[index].ageUseFrom.toString()} đến ${list[index].ageUseTo.toString()}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(height: 10)
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
                        style: TextStyle(fontSize: 24, color: Colors.teal),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
