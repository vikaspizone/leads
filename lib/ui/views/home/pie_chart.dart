import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
          SizedBox(
            width: 170,
            height: 220,
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                startDegreeOffset: 30,
                sections: _generateSections(),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 45),
                NameWidget(
                  name: 'Suyama',
                  color: Color(0xffFFC30D),
                ),
                NameWidget(
                  name: 'Manoj Kumar',
                  color: Color(0xff7A57B0),
                ),
                NameWidget(
                  name: 'Seshadri',
                  color: Color(0xffFCAC76),
                ),
                NameWidget(
                  name: 'Abhishek',
                  color: Color(0xff84C0D8),
                ),
                NameWidget(
                  name: 'Nirmal Raj',
                  color: Color(0xffE77569),
                )
              ],
            ),
          )
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
        radius: 88,
        title: '5',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontFamily: 'NexaBold',
        ),
      ),
      PieChartSectionData(
          color: const Color(0xffAA4011), title: '', value: 1, radius: 80),
      PieChartSectionData(
        color: const Color(0xffFCAC76),
        value: 15,
        radius: 80,
        title: '15',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontFamily: 'NexaBold',
        ),
      ),
      PieChartSectionData(
          color: const Color(0xff317B8C), title: '', value: 1, radius: 75),
      PieChartSectionData(
        color: const Color(0xff84C0D8),
        value: 35,
        radius: 75,
        title: '35',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontFamily: 'NexaBold',
        ),
      ),
      PieChartSectionData(
          color: const Color(0xffAA4011), title: '', value: 1, radius: 70),
      PieChartSectionData(
        color: const Color(0xffE77569),
        value: 15,
        radius: 70,
        title: '15',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontFamily: 'NexaBold',
        ),
      ),
      PieChartSectionData(
        color: const Color(0xffFFC30D),
        value: 30,
        radius: 95,
        title: '30',
        titleStyle: TextStyle(
            fontFamily: 'NexaBold', color: Colors.white, fontSize: size),
      ),
      PieChartSectionData(
          color: const Color(0xff49376D), title: '', value: 1, radius: 88),
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
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            height: 15,
            width: 20,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(5)),
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontSize: 12, fontFamily: 'NexaBold'),
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
        width: 360,
        // height: 170,
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
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${gridDetail[index].text}",
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'NexaBold')),
                      Text('${gridDetail[index].val}',
                          style: TextStyle(
                              fontSize: 17,
                              color: gridDetail[index].valCol,
                              fontFamily: 'NexaBold'))
                    ],
                  ),
                ),
              ),
            );
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
