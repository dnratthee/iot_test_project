import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:iot_test_project/models/room.dart';
import 'package:iot_test_project/services/call_api.dart';
import 'package:iot_test_project/widgets/my_appbar.dart';
import 'package:iot_test_project/widgets/my_padding.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class InfoAirConUI extends StatefulWidget {
  const InfoAirConUI({super.key});

  @override
  State<InfoAirConUI> createState() => _InfoAirConUIState();
}

class _InfoAirConUIState extends State<InfoAirConUI> {
  Future CallApigetAllRoom() async {
    var rooms = await CallApi.getAllRoom();
    if (rooms.isNotEmpty) {
      return showTableDetail(rooms);
    }
  }

  List<GridColumn> createHeaderTable() {
    return <GridColumn>[
      GridColumn(
        columnName: 'temp1',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'A/C 1',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'temp2',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'A/C 2',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'temp3',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'A/C 3',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'datesave',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'Date',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      GridColumn(
        columnName: 'timesave',
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: const Text(
            'Time',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('EEE d MMMM y', 'th_TH');
    var dateTime = new DateTime.now();
    var date = dateFormat.format(dateTime);

    return MyAppBar(
      title: 'Air Conditioners',
      child: Center(
        child: Column(
          children: [
            const MyPadding(
              size: 0.03,
              isFirstChild: true,
              child: Text(
                '-- Data of air conditioners with DateTime --',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: CallApigetAllRoom(),
                builder: (context, snapshot) => snapshot.hasData
                    ? SfDataGrid(
                        source: snapshot.data as showTableDetail,
                        columns: createHeaderTable(),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
            MyPadding(
              size: 0.025,
              isLastChild: true,
              child: Text(
                'Date: $date',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class showTableDetail extends DataGridSource {
  late List<DataGridRow> dataGridRow;
  late List<Room> rooms;

  showTableDetail(this.rooms) {
    dataGridRow = rooms
        .map<DataGridRow>((room) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'temp1', value: room.temp1),
              DataGridCell<String>(columnName: 'temp2', value: room.temp2),
              DataGridCell<String>(columnName: 'temp3', value: room.temp3),
              DataGridCell<String>(
                  columnName: 'datesave', value: room.datesave),
              DataGridCell<String>(
                  columnName: 'timesave', value: room.timesave),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRow;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color:
          effectiveRows.indexOf(row) % 2 == 0 ? Colors.white : Colors.red[100],
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
