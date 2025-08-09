import 'package:flutter/material.dart';
import 'dart:math' as math;

class SimpleCircularProgressBar extends StatefulWidget {
  final double progressStrokeWidth;
  final double backStrokeWidth;
  final List<Color> progressColors;
  final Color backColor;
  final ValueNotifier<double> valueNotifier;
  final double startAngle;

  const SimpleCircularProgressBar({
    Key? key,
    required this.progressStrokeWidth,
    required this.backStrokeWidth,
    required this.progressColors,
    required this.backColor,
    required this.valueNotifier,
    required this.startAngle,
  }) : super(key: key);

  @override
  State<SimpleCircularProgressBar> createState() =>
      _SimpleCircularProgressBarState();
}

class _SimpleCircularProgressBarState extends State<SimpleCircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation =
        Tween<double>(
          begin: 0.0,
          end: widget.valueNotifier.value / 100,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: CircularProgressPainter(
            progressStrokeWidth: widget.progressStrokeWidth,
            backStrokeWidth: widget.backStrokeWidth,
            progressColors: widget.progressColors,
            backColor: widget.backColor,
            progress: _animation.value,
            startAngle: widget.startAngle,
          ),
        );
      },
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progressStrokeWidth;
  final double backStrokeWidth;
  final List<Color> progressColors;
  final Color backColor;
  final double progress;
  final double startAngle;

  CircularProgressPainter({
    required this.progressStrokeWidth,
    required this.backStrokeWidth,
    required this.progressColors,
    required this.backColor,
    required this.progress,
    required this.startAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - progressStrokeWidth) / 2;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = backColor
      ..strokeWidth = backStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..shader = LinearGradient(
        colors: progressColors,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = progressStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;
    final startAngleRad = (startAngle * math.pi) / 180;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngleRad,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
