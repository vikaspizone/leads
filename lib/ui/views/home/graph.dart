import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatelessWidget {
  const Graph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        height: 212,
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('Leads Trend',
                      style: TextStyle(
                          color: Color(0xff444444),
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Nexa-Bold')),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Lead Statics',
                          style: TextStyle(
                              color: Color(0xff69615E),
                              fontSize: 15,
                              fontFamily: 'Nexa-Bold')),
                      // SizedBox(height: 2),
                      Text('Last 12 Days',
                          style: TextStyle(
                              color: Color(0xffC4161C),
                              fontSize: 12,
                              fontFamily: 'Nexa-Bold')),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                height: 150,
                child: SfCartesianChart(
                    trackballBehavior: TrackballBehavior(
                        enable: true, lineWidth: 2, lineDashArray: [5, 5]),
                    enableAxisAnimation: true,
                    plotAreaBorderColor: Colors.transparent,
                    margin: EdgeInsets.zero,
                    primaryYAxis: NumericAxis(
                        majorGridLines: const MajorGridLines(
                            color: Color(0xffdad5ce),
                            width: 2,
                            dashArray: [4, 4]),
                        visibleMaximum: 40,
                        edgeLabelPlacement: EdgeLabelPlacement.hide,
                        axisLine: const AxisLine(color: Colors.transparent),
                        maximum: 30,
                        labelStyle: const TextStyle(color: Color(0xff956956)),
                        majorTickLines:
                            const MajorTickLines(color: Colors.transparent),
                        minorTickLines:
                            const MinorTickLines(color: Colors.transparent)),
                    primaryXAxis: CategoryAxis(
                        axisLine: const AxisLine(
                            color: Color(0xffC3B9B9), width: 1.5),
                        labelsExtent: double.infinity,
                        labelStyle: const TextStyle(color: Color(0xff959393)),
                        majorGridLines:
                            const MajorGridLines(color: Colors.transparent),
                        minorGridLines:
                            const MinorGridLines(color: Colors.transparent),
                        labelPlacement: LabelPlacement.onTicks,
                        majorTickLines:
                            const MajorTickLines(color: Colors.transparent),
                        minorTickLines:
                            const MinorTickLines(color: Colors.transparent)),
                    annotations: <CartesianChartAnnotation>[
                      CartesianChartAnnotation(
                          widget: Container(
                              height: 10,
                              width: 10,
                              decoration: const BoxDecoration(
                                  color: Color(0xffa15034),
                                  shape: BoxShape.circle)),
                          coordinateUnit: CoordinateUnit.point,
                          x: '6.9',
                          y: 30),
                      CartesianChartAnnotation(
                        widget: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xffdad5ce),
                            shape: BoxShape.circle,
                          ),
                        ),
                        coordinateUnit: CoordinateUnit.point,
                        x: '10.8',
                        y: 30,
                      ),
                      CartesianChartAnnotation(
                        widget: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xffdad5ce),
                            shape: BoxShape.circle,
                          ),
                        ),
                        coordinateUnit: CoordinateUnit.point,
                        x: '10.8',
                        y: 20,
                      ),
                      CartesianChartAnnotation(
                        widget: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xffdad5ce),
                            shape: BoxShape.circle,
                          ),
                        ),
                        coordinateUnit: CoordinateUnit.point,
                        x: '10.8',
                        y: 10,
                      ),
                      CartesianChartAnnotation(
                          widget: Container(
                              height: 79,
                              width: 1,
                              decoration: const BoxDecoration(
                                  color: Color(0xff9F9F9F))),
                          coordinateUnit: CoordinateUnit.point,
                          x: '6.9',
                          y: 14)
                    ],
                    series: [
                      SplineSeries(
                          onPointTap: (pointInteractionDetails) {},
                          animationDuration: 2,
                          color: const Color(0xffC8AB56),
                          dataSource: [
                            SalesData('01', 02),
                            SalesData('02', 20),
                            SalesData('03', 20),
                            SalesData('04', 10),
                            SalesData('05', 18),
                            SalesData('06', 15),
                            SalesData('07', 25),
                            SalesData('08', 30),
                            SalesData('09', 20),
                            SalesData('10', 06),
                            SalesData('11', 08),
                            SalesData('12', 02)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                    ])),
          ],
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;

  final double sales;
}
