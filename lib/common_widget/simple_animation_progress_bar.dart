import 'package:flutter/material.dart';

class SimpleAnimationProgressBar extends StatefulWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color foregrondColor;
  final double ratio;
  final Axis direction;
  final Curve curve;
  final Duration duration;
  final BorderRadius borderRadius;
  final LinearGradient? gradientColor;

  const SimpleAnimationProgressBar({
    Key? key,
    required this.height,
    required this.width,
    required this.backgroundColor,
    required this.foregrondColor,
    required this.ratio,
    required this.direction,
    required this.curve,
    required this.duration,
    required this.borderRadius,
    this.gradientColor,
  }) : super(key: key);

  @override
  State<SimpleAnimationProgressBar> createState() =>
      _SimpleAnimationProgressBarState();
}

class _SimpleAnimationProgressBarState extends State<SimpleAnimationProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: widget.ratio).animate(
      CurvedAnimation(parent: _animationController, curve: widget.curve),
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
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: widget.borderRadius,
          ),
          child: widget.direction == Axis.vertical
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: widget.width,
                      height: widget.height * _animation.value,
                      decoration: BoxDecoration(
                        gradient: widget.gradientColor,
                        color: widget.gradientColor == null
                            ? widget.foregrondColor
                            : null,
                        borderRadius: widget.borderRadius,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: widget.width * _animation.value,
                      height: widget.height,
                      decoration: BoxDecoration(
                        gradient: widget.gradientColor,
                        color: widget.gradientColor == null
                            ? widget.foregrondColor
                            : null,
                        borderRadius: widget.borderRadius,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
