import 'package:f_on/component/layouts/default.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScheduleStatScreen extends StatefulWidget {
  @override
  _ScheduleStatScreenState createState() => _ScheduleStatScreenState();
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class _ScheduleStatScreenState extends State<ScheduleStatScreen> {
  @override
  Widget build(BuildContext context) {
    
    return DefaultLayout(
        child: Column(children: <Widget>[
      RaisedButton(child: Text("开始批改"), onPressed: () {
        
      }),
      Card(
          child: SfCartesianChart(
              // Initialize category axis
              primaryXAxis: CategoryAxis(),
              series: <LineSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
                // Bind data source
                dataSource: <SalesData>[
                  SalesData('Jan', 35),
                  SalesData('Feb', 28),
                  SalesData('Mar', 34),
                  SalesData('Apr', 32),
                  SalesData('May', 40)
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales)
          ]))
    ]));
  }
}
