import 'package:flutter/material.dart';

class DottedDashedLine extends StatelessWidget {
  final double height;
  final double width;
  final Color dashColor;
  final Axis axis;
  final double dashWidth;
  final double dashSpace;

  const DottedDashedLine({
    Key? key,
    required this.height,
    required this.width,
    required this.dashColor,
    required this.axis,
    this.dashWidth = 2.0,
    this.dashSpace = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: DottedLinePainter(
        dashColor: dashColor,
        axis: axis,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color dashColor;
  final Axis axis;
  final double dashWidth;
  final double dashSpace;

  DottedLinePainter({
    required this.dashColor,
    required this.axis,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dashColor
      ..strokeWidth = 1.0;

    if (axis == Axis.horizontal) {
      double startX = 0;
      while (startX < size.width) {
        canvas.drawLine(
          Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2),
          paint,
        );
        startX += dashWidth + dashSpace;
      }
    } else {
      double startY = 0;
      while (startY < size.height) {
        canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashWidth),
          paint,
        );
        startY += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
