import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:iot_test_project/models/room.dart';
import 'package:iot_test_project/services/call_api.dart';
import 'package:iot_test_project/widgets/my_app_bar.dart';
import 'package:iot_test_project/widgets/my_padding.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InfoChartUI extends StatefulWidget {
  final String? type;

  const InfoChartUI({Key? key, this.type}) : super(key: key);

  @override
  State<InfoChartUI> createState() => _InfoChartUIState();
}

var dateTime = DateTime(2024, 1, 1); // DateTime.now();

class _InfoChartUIState extends State<InfoChartUI> {
  Future<List<Room>?>? getRoom() async {
    List<Room> rooms;
    rooms = await CallApi.getAllRoomByDate(dateTime);
    if (rooms.isEmpty) {
      return null;
    }
    return rooms;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2024, 1, 1),
        lastDate: DateTime(2024, 1, 10));
    if (picked != null && picked != dateTime) {
      setState(() {
        dateTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('EEE d MMMM y', 'th_TH');
    DateFormat timeFormat = DateFormat('Hm');
    var date = dateFormat.format(dateTime);

    return MyAppBar(
      title: 'Air conditioners',
      child: Center(
        child: Column(
          children: [
            MyPadding(
              size: 0.01,
              isFirstChild: true,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Date : $date"),
                  IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 20, bottom: 50),
                  child: FutureBuilder(
                      future: getRoom(),
                      builder: (context, snapshot) => snapshot.hasData
                          ? SfCartesianChart(
                              primaryXAxis: const CategoryAxis(
                                title: AxisTitle(text: 'Time'),
                              ),
                              primaryYAxis: const NumericAxis(
                                title: AxisTitle(text: 'Temperature (°C)'),
                                labelFormat: '{value}°C',
                                interval: 5,
                              ),
                              title: const ChartTitle(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  text:
                                      ('Temperature Chart of Air Conditioners')),
                              legend: const Legend(isVisible: true),
                              series: (widget.type == 'Bar')
                                  ? <BarSeries<Room, String>>[
                                      for (var i = 1; i <= 3; i++)
                                        BarSeries<Room, String>(
                                          dataSource: snapshot.data!,
                                          xValueMapper: (Room room, _) =>
                                              timeFormat.format(DateTime.parse(
                                                  "${room.datesave} ${room.timesave}")),
                                          yValueMapper: (Room room, _) {
                                            if (i == 1) {
                                              return room.temp1 != null
                                                  ? double.parse(room.temp1!)
                                                  : null;
                                            } else if (i == 2) {
                                              return room.temp2 != null
                                                  ? double.parse(room.temp2!)
                                                  : null;
                                            } else {
                                              return room.temp3 != null
                                                  ? double.parse(room.temp3!)
                                                  : null;
                                            }
                                          },
                                          name: 'A/C $i',
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: true),
                                          markerSettings: const MarkerSettings(
                                              isVisible: true),
                                        )
                                    ]
                                  : <LineSeries<Room, String>>[
                                      for (var i = 1; i <= 3; i++)
                                        LineSeries<Room, String>(
                                          dataSource: snapshot.data!,
                                          xValueMapper: (Room room, _) =>
                                              timeFormat.format(DateTime.parse(
                                                  "${room.datesave} ${room.timesave}")),
                                          yValueMapper: (Room room, _) {
                                            if (i == 1) {
                                              return room.temp1 != null
                                                  ? double.parse(room.temp1!)
                                                  : null;
                                            } else if (i == 2) {
                                              return room.temp2 != null
                                                  ? double.parse(room.temp2!)
                                                  : null;
                                            } else {
                                              return room.temp3 != null
                                                  ? double.parse(room.temp3!)
                                                  : null;
                                            }
                                          },
                                          name: 'A/C $i',
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: true),
                                          markerSettings: const MarkerSettings(
                                              isVisible: true),
                                        )
                                    ],
                            )
                          : const Text('No data'))),
            ),
          ],
        ),
      ),
    );
  }
}
