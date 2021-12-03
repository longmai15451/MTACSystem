
import 'package:flutter/material.dart';
import 'package:mtacsystem/models/schedule.dart';

class TaskTile extends StatelessWidget {
  final Schedule? schedule;
  TaskTile(this.schedule);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(schedule?.type??''),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule?.title??"",
                  style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey[200],
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      schedule?.registerTime??"",
                      style: 
                        TextStyle(fontSize: 13, color: Colors.grey[100]),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  schedule!.address!= null? "${schedule!.note} ${schedule!.address}":"",
                  style: TextStyle(fontSize: 15, color: Colors.grey[100]),
                  
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              "TODO",
              style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              
            ),
          ),
        ]),
      ),
    );
  }

  _getBGClr(String no) {
    switch (no) {
      case '0':
        return Colors.lightGreen.shade600;
      case '1':
        return Colors.lightBlue.shade600;
      default:
        return Colors.grey.shade600;
    }
  }
}