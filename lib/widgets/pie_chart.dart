import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    final List<PieData> chartData = [
      PieData(9000, 'Janeiro'),
      PieData(19000, 'Fevereiro'),
      PieData(50000, 'Março'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartesian Charts'),
      ),
      body: Container(
        height: 300,
        margin: const EdgeInsets.all(10),
        child: SfCircularChart(
          palette: const [
            Colors.red, Colors.green, Colors.blue
          ],
          series: [
            PieSeries<PieData, String>(
              explode: true,
              strokeWidth: 1,
              strokeColor: Colors.black12,
              explodeIndex: 0,
              dataSource: chartData,
              xValueMapper: (PieData data, _) => data.xData,
              yValueMapper: (PieData data, _) => data.yData,
              dataLabelSettings: const DataLabelSettings(isVisible: true)
            )
          ],
        )
      ),
    );
  }
}

class PieData {
  final num yData;
  final String xData;

  PieData(this.yData, this.xData);
}
