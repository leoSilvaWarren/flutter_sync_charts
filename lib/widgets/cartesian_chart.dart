import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChartWidget extends StatefulWidget {
  const CartesianChartWidget({Key? key}) : super(key: key);

  @override
  State<CartesianChartWidget> createState() => _CartesianChartWidgetState();
}

class _CartesianChartWidgetState extends State<CartesianChartWidget> {
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(2022, 25000, Colors.red),
      SalesData(2021, 33000, Colors.blue),
      SalesData(2020, 28000, Colors.green),
      SalesData(2019, 44000, Colors.green),
      SalesData(2018, 12000, Colors.green),
    ];

    final List<SalesData> chartData2 = [
      SalesData(2022, 15000, Colors.red),
      SalesData(2021, 23000, Colors.blue),
      SalesData(2020, 12000, Colors.green),
      SalesData(2019, 4000, Colors.green),
      SalesData(2018, 2000, Colors.green),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartesian Charts'),
      ),
      body: Container(
        height: 300,
        margin: const EdgeInsets.all(10),
        child: SfCartesianChart(
          legend: Legend(isVisible: false),
          title: ChartTitle(text: 'Sales Data', alignment: ChartAlignment.near),
          series: <ChartSeries>[
            SplineSeries<SalesData, int>(
                color: Colors.red.withOpacity(0.3),
                // pointColorMapper: (SalesData sales, _) => sales.color,
                // dashArray: const <double>[5, 5],
                // legendItemText: 'Vendas',
                enableTooltip: true,
                dataSource: chartData,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales),

                SplineSeries<SalesData, int>(
                color: Colors.green.withOpacity(0.3),
                // pointColorMapper: (SalesData sales, _) => sales.color,
                // dashArray: const <double>[5, 5],
                // legendItemText: 'Vendas',
                enableTooltip: true,
                dataSource: chartData2,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final int year;
  final double sales;
  final Color color;

  SalesData(this.year, this.sales, this.color);
}
