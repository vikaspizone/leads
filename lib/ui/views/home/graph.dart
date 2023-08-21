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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        // height: 212,
        child: Column(
          children: [
            const Row(
              children: [
                Text('Leads Trend',
                    style: TextStyle(
                        color: Color(0xff444444),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1,
                        fontFamily: 'Nexa-Bold')),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Lead Statics',
                        style: TextStyle(
                            color: Color(0xff69615E),
                            fontSize: 12,
                            height: 1,
                            fontFamily: 'Nexa-Bold')),
                    // SizedBox(height: 2),
                    Text('Last 12 Days',
                        style: TextStyle(
                            color: Color(0xffC4161C),
                            fontSize: 10,
                            height: 1.1,
                            fontFamily: 'Nexa-Bold')),
                  ],
                ),
              ],
            ),
            SizedBox(
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
                            width: 1.5,
                            dashArray: [3, 3]),
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
                        axisLine:
                            const AxisLine(color: Color(0xffC3B9B9), width: 1),
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
                              height: 9,
                              width: 9,
                              decoration: const BoxDecoration(
                                  color: Color(0xffa15034),
                                  shape: BoxShape.circle)),
                          coordinateUnit: CoordinateUnit.point,
                          x: '6.9',
                          y: 30),
                      CartesianChartAnnotation(
                        widget: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xffdad5ce),
                            shape: BoxShape.circle,
                          ),
                        ),
                        coordinateUnit: CoordinateUnit.point,
                        x: '10.83',
                        y: 30,
                      ),
                      CartesianChartAnnotation(
                        widget: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xffdad5ce),
                            shape: BoxShape.circle,
                          ),
                        ),
                        coordinateUnit: CoordinateUnit.point,
                        x: '10.83',
                        y: 20,
                      ),
                      CartesianChartAnnotation(
                        widget: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xffdad5ce),
                            shape: BoxShape.circle,
                          ),
                        ),
                        coordinateUnit: CoordinateUnit.point,
                        x: '10.83',
                        y: 10,
                      ),
                      CartesianChartAnnotation(
                          widget: Container(
                              height: 90,
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
                          width: 1.2,
                          color: const Color(0xffC8AB56),
                          dataSource: [
                            SalesData('01', 2),
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
  final Widget x;
  final double y;
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
