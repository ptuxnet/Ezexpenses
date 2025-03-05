import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ezexpense/model/expense_model.dart';

class Syncfusionchart extends StatefulWidget {
  final List<Expense> expenses;

  const Syncfusionchart({super.key, required this.expenses});

  @override
  State<Syncfusionchart> createState() => _SyncfusionchartState();
}

class _SyncfusionchartState extends State<Syncfusionchart> {
  late List<ExpenseBucket> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    // This will Update chartData every time the widget rebuilds
    _chartData = getChartData();

    return SfCircularChart(
      title: const ChartTitle(text: 'Expense Distribution'),
      legend: const Legend(
          isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      tooltipBehavior: _tooltipBehavior,
      series: <CircularSeries>[
        PieSeries<ExpenseBucket, String>(
          animationDuration: kThemeAnimationDuration,
          dataSource: _chartData,
          xValueMapper: (ExpenseBucket data, _) => data.category.name,
          yValueMapper: (ExpenseBucket data, _) => data.totalExpenses,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          enableTooltip: true,
        ),
      ],
    );
  }

  List<ExpenseBucket> getChartData() {
    return Category.values
        .map((category) => ExpenseBucket.forCategory(widget.expenses, category))
        .where((bucket) => bucket.totalExpenses > 0)
        .toList();
  }
}

double kThemeAnimationDuration = 1200;
