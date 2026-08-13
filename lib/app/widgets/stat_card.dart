import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final String compareLabel;
  final List<double>? dataPoints;
  final List<String>? timeLabels;

  const StatCard({
    super.key,
    this.title = "Today's Earnings",
    this.value = "₹ 2,450",
    this.percentage = "+12%",
    this.compareLabel = "from yesterday",
    this.dataPoints,
    this.timeLabels,
  });

  @override
  Widget build(BuildContext context) {
    final points =
        dataPoints ?? [25.0, 45.0, 32.0, 55.0, 30.0, 42.0, 62.0, 58.0, 82.0];
    final labels = timeLabels ?? ['12 AM', '6 AM', '12 PM', '6 PM', '12 AM'];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowBlack12,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.textBlack87,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textBlack,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$percentage ',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.successGreen,
                      ),
                    ),
                    TextSpan(
                      text: compareLabel,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textGrey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 110,
            width: double.infinity,
            child: CustomPaint(painter: EarningsChartPainter(points: points)),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: labels
                .map(
                  (label) => Text(
                    label,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textGrey,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class EarningsChartPainter extends CustomPainter {
  final List<double> points;

  EarningsChartPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final gridPaint = Paint()
      ..color = AppColors.borderLight
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final double gridSpacing = size.height / 3;
    for (int i = 1; i <= 3; i++) {
      final double y = i * gridSpacing;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final double minVal = points.reduce((a, b) => a < b ? a : b);
    final double maxVal = points.reduce((a, b) => a > b ? a : b);
    final double range = maxVal - minVal == 0 ? 1 : maxVal - minVal;

    final List<Offset> offsets = [];
    final double stepX = size.width / (points.length - 1);
    const double paddingY = 12.0;
    final double availableHeight = size.height - (paddingY * 2);

    for (int i = 0; i < points.length; i++) {
      final double x = i * stepX;
      final double normalizedY = (points[i] - minVal) / range;
      final double y = size.height - paddingY - (normalizedY * availableHeight);
      offsets.add(Offset(x, y));
    }

    final path = Path();
    path.moveTo(offsets[0].dx, offsets[0].dy);

    for (int i = 0; i < offsets.length - 1; i++) {
      final p0 = offsets[i];
      final p1 = offsets[i + 1];
      final controlPoint1 = Offset(p0.dx + (p1.dx - p0.dx) / 2, p0.dy);
      final controlPoint2 = Offset(p0.dx + (p1.dx - p0.dx) / 2, p1.dy);
      path.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        p1.dx,
        p1.dy,
      );
    }

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.framecolor.withOpacity(0.30),
          AppColors.framecolor.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    canvas.drawPath(fillPath, fillPaint);

    final linePaint = Paint()
      ..color = AppColors.framecolor
      ..strokeWidth = 2.8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, linePaint);

    final dotFillPaint = Paint()
      ..color = AppColors.framecolor
      ..style = PaintingStyle.fill;

    final dotBorderPaint = Paint()
      ..color = AppColors.background
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (final offset in offsets) {
      canvas.drawCircle(offset, 4.5, dotFillPaint);
      canvas.drawCircle(offset, 4.5, dotBorderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
