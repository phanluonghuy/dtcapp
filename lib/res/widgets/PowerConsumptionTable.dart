import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PowerConsumptionTable extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  PowerConsumptionTable({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Công suất tiêu thụ điện')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                    child: DataTable(
                      columnSpacing: 16.0,
                      headingRowHeight: 50.0,
                      dataRowHeight: 40.0,
                      columns: const [
                        DataColumn(
                          label: Expanded(
                            child: Text('Thiết bị', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text('Công suất\n điện (KW)', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text('Số lượng', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text('Tổng (KW)', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                      rows: data.map((item) {
                        bool isBold = item['isBold'] ?? false;
                        return DataRow(cells: [
                          DataCell(Text(item['device'], style: isBold ? TextStyle(fontWeight: FontWeight.bold) : null)),
                          DataCell(Text(item['power'] != null ? item['power'].toString() : '')),
                          DataCell(Text(item['quantity'] != null ? item['quantity'].toString() : '')),
                          DataCell(Text(item['total'] != null ? item['total'].toString() : '', style: isBold ? TextStyle(fontWeight: FontWeight.bold) : null)),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}