import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;
  final double width;
  bool? vertical;

  DottedLine({
    super.key,
    this.color = Colors.black,
    this.strokeWidth = 2.0,
    this.dashLength = 4.0,
    this.gapLength = 4.0,
    this.width = double.infinity,
    this.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CustomPaint(
        painter: DottedLinePainter(
          color: color,
          strokeWidth: strokeWidth,
          dashLength: dashLength,
          gapLength: gapLength,
          vertical: vertical ?? false,
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;
  bool vertical = false;

  DottedLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.gapLength,
    this.vertical = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    double startY = 0;
    final double endX = size.width;
    final double endY = size.height;
    if (vertical == false) {
      while (startX < endX) {
        canvas.drawLine(Offset(startX, size.height / 2),
            Offset(startX + dashLength, size.height / 2), paint);
        startX += dashLength + gapLength;
      }
    } else {
      while (startY < endY) {
        canvas.drawLine(Offset(size.width / 2, startY),
            Offset(size.width / 2, startY + dashLength), paint);
        startY += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
