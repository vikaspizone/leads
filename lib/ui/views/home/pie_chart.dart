import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:leads/ui/common/ui_helpers.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Container(
              color: Colors.white,
              width: screenDimension(context) / 7.7,
              height: screenDimension(context) / 6.24,
              child: PieChart(PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  startDegreeOffset: 30,
                  sections: _generateSections(),
                  borderData: FlBorderData(show: false)))),
          const Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: screenDimension(context) / 46),
            const NameWidget(name: 'Suyama', color: Color(0xffFFC30D)),
            const NameWidget(name: 'Manoj Kumar', color: Color(0xff7A57B0)),
            const NameWidget(name: 'Seshadri', color: Color(0xffFF7012)),
            const NameWidget(name: 'Abhishek', color: Color(0xff84C0D8)),
            const NameWidget(name: 'Nirmal Raj', color: Color(0xffE33624))
          ])
        ],
      ),
    );
  }

  List<PieChartSectionData> _generateSections() {
    double size = 18;
    return [
      PieChartSectionData(
          color: const Color(0xff7A57B0),
          value: 5,
          radius: 85,
          title: '5',
          titlePositionPercentageOffset: 0.6,
          titleStyle: TextStyle(
              color: Colors.white,
              fontSize: size - 1,
              fontFamily: 'Nexa-Bold')),
      PieChartSectionData(
          color: const Color(0xffAA4011), title: '', value: 1, radius: 80),
      PieChartSectionData(
          color: const Color(0xffFCAC76),
          value: 15,
          radius: 80,
          title: '15',
          titlePositionPercentageOffset: 0.6,
          titleStyle: TextStyle(
              color: Colors.white, fontSize: size, fontFamily: 'Nexa-Bold')),
      PieChartSectionData(
          color: const Color(0xff317B8C), title: '', value: 1, radius: 75),
      PieChartSectionData(
          color: const Color(0xff84C0D8),
          value: 35,
          radius: 75,
          title: '35',
          titleStyle: TextStyle(
              color: Colors.white, fontSize: size, fontFamily: 'Nexa-Bold')),
      PieChartSectionData(
          color: const Color(0xffAA4011), title: '', value: 1, radius: 70),
      PieChartSectionData(
          color: const Color(0xffE77569),
          value: 15,
          radius: 70,
          title: '15',
          titlePositionPercentageOffset: 0.6,
          titleStyle: TextStyle(
              color: Colors.white, fontSize: size, fontFamily: 'Nexa-Bold')),
      PieChartSectionData(
        color: const Color(0xffFFC30D),
        value: 25,
        radius: 90,
        title: '30',
        titleStyle: TextStyle(
            fontFamily: 'Nexa-Bold', color: Colors.white, fontSize: size),
      ),
      PieChartSectionData(
          color: const Color(0xff49376D), title: '', value: 1, radius: 85),
    ];
  }
}

class NameWidget extends StatelessWidget {
  final String name;
  final Color? color;
  const NameWidget({
    required this.name,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            height: screenDimension(context) / 96,
            width: screenDimension(context) / 64,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(3)),
          ),
          SizedBox(width: screenDimension(context) / 96),
          Text(
            name,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: screenDimension(context) / 88,
                fontFamily: 'Nexa-Bold'),
          ),
        ],
      ),
    );
  }
}

class BackSide extends StatelessWidget {
  const BackSide({
    super.key,
    required this.gridDetail,
  });

  final List<GridItem> gridDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: screenDimension(context) / 3.20,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 5),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 50,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 8),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                    color: gridDetail[index].gridCol,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${gridDetail[index].text}",
                                  style: TextStyle(
                                      fontSize: screenDimension(context) / 96,
                                      color: Colors.black,
                                      fontFamily: 'Nexa-Bold')),
                              Text('${gridDetail[index].val}',
                                  style: TextStyle(
                                      fontSize:
                                          screenDimension(context) / 67.50,
                                      color: gridDetail[index].valCol,
                                      fontFamily: 'Nexa-Bold'))
                            ]))));
          },
        ));
  }
}

class GridItem {
  late Color? gridCol;
  late Color? valCol;
  late String? text;
  late String? val;
  GridItem({this.gridCol, this.valCol, this.text, this.val});
}

class PieSegment {
  final Color color;
  final double radius;
  final double angle;

  PieSegment({required this.color, required this.radius, required this.angle});
}

class PieChartPainter extends CustomPainter {
  final List<PieSegment> segments;

  PieChartPainter(this.segments);

  @override
  void paint(Canvas canvas, Size size) {
    double totalAngle = 0;

    for (var segment in segments) {
      final paint = Paint()..color = segment.color;
      final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: segment.radius,
      );

      canvas.drawArc(
        rect,
        totalAngle,
        segment.angle,
        true,
        paint,
      );

      totalAngle += segment.angle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
