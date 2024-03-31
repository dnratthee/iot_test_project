import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:iot_test_project/models/room.dart';
import 'package:iot_test_project/services/call_api.dart';
import 'package:iot_test_project/widgets/my_app_bar.dart';
import 'package:iot_test_project/widgets/my_padding.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class InfoAirConUI extends StatefulWidget {
  final int? air;

  const InfoAirConUI({Key? key, this.air}) : super(key: key);

  @override
  State<InfoAirConUI> createState() => _InfoAirConUIState();
}

class _InfoAirConUIState extends State<InfoAirConUI> {
  Future getRoom(air) async {
    List<Room> rooms;
    if (air != null) {
      rooms = await CallApi.getRoom(air);
    } else {
      rooms = await CallApi.getAllRoom();
    }
    return ShowTableDetail(rooms);
  }

  List<GridColumn> createHeaderTable(columns) {
    return <GridColumn>[
      for (var col in columns)
        GridColumn(
          columnName: col,
          autoFitPadding: const EdgeInsets.all(8),
          label: Container(
            decoration: BoxDecoration(
              color: Colors.blue[900],
            ),
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(
              col,
              softWrap: false,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    var columns = ['A/C 1', 'A/C 2', 'A/C 3', 'Date', 'Time'];
    if (widget.air == 1) {
      columns = ['A/C 1', 'Date', 'Time'];
    } else if (widget.air == 2) {
      columns = ['A/C 2', 'Date', 'Time'];
    } else if (widget.air == 3) {
      columns = ['A/C 3', 'Date', 'Time'];
    }

    DateFormat dateFormat = DateFormat('EEE d MMMM y', 'th_TH');
    var dateTime = DateTime.now();
    var date = dateFormat.format(dateTime);

    return MyAppBar(
      title: 'Air Conditioners',
      child: Center(
        child: Column(
          children: [
            MyPadding(
              size: 0.03,
              isFirstChild: true,
              child: Text(
                (widget.air != null
                    ? 'Data of air conditioner ${widget.air}'
                    : 'Data of air conditioners with DateTime'),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: getRoom(widget.air),
              builder: (context, snapshot) => snapshot.hasData
                  ? SfDataGrid(
                      source: snapshot.data as ShowTableDetail,
                      gridLinesVisibility: GridLinesVisibility.both,
                      headerGridLinesVisibility: GridLinesVisibility.both,
                      columnWidthMode: (widget.air != null
                          ? ColumnWidthMode.fill
                          : ColumnWidthMode.auto),
                      columnWidthCalculationRange:
                          ColumnWidthCalculationRange.allRows,
                      columns: createHeaderTable(columns),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            )),
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

class ShowTableDetail extends DataGridSource {
  late List<DataGridRow> dataGridRow;
  late List<Room> rooms;

  ShowTableDetail(this.rooms) {
    dataGridRow = rooms
        .map<DataGridRow>((e) => DataGridRow(cells: [
              if (e.temp1 != null)
                (DataGridCell<String>(
                    columnName: 'A/C 1', value: '${e.temp1}°C')),
              if (e.temp2 != null)
                (DataGridCell<String>(
                    columnName: 'A/C 2', value: '${e.temp2}°C')),
              if (e.temp3 != null)
                (DataGridCell<String>(
                    columnName: 'A/C 3', value: '${e.temp3}°C')),
              DataGridCell<String>(
                  columnName: 'Date',
                  value: DateFormat('d MMM y', 'th_TH')
                      .format(DateTime.parse(e.datesave))),
              DataGridCell<String>(columnName: 'Time', value: e.timesave)
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
            padding: const EdgeInsets.all(8.0),
            child: Text(e.value.toString()));
      }).toList(),
    );
  }
}
