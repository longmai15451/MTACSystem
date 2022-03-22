import 'package:flutter/material.dart';
import 'package:mtacsystem/models/schedule.dart';

class TaskTile extends StatelessWidget {
  final Schedule? schedule;
  TaskTile(this.schedule);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _getBGClr(schedule?.type ?? ''),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule?.title ?? "",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(width: 4),
                    Text(
                      schedule?.registerTime ?? "",
                      style: TextStyle(fontSize: 16, color: Colors.grey[100]),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  schedule!.address != null
                      ? "${schedule!.note} ${schedule!.address}"
                      : "",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 2,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              schedule!.type == null ? "COMPLETED" : "TODO",
              style: TextStyle(
                  fontSize: 14,
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
        return Colors.teal;
      case '1':
        return Colors.teal;
      default:
        return Colors.teal;
    }
  }
}
