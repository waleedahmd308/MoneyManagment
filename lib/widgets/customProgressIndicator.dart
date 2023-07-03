import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../utils/utils.dart';


class CircularSlider extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;
  
final double radius;
final double  strokeWidth;
  const CircularSlider({
    Key? key,
    required this.onAngleChanged,
    required this.radius,
    required this.strokeWidth,
  }) : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Offset _currentDragOffset = Offset.zero;

  double currentAngle = 10;

  double startAngle = toRadian(90);

  double totalAngle = toRadian(360);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width -35);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(center-Offset(widget.strokeWidth, widget.strokeWidth),
        currentAngle + startAngle, widget.radius);

    return Stack(
      children: [
        Positioned(
          
          child: CustomPaint(
            size: canvasSize,
            
            painter: SliderPainter(
              startAngle: startAngle,
              currentAngle: currentAngle, radius: widget.radius, strokeWidth: widget.strokeWidth,
            ),
          ),
        ),
        Positioned(
            left: knobPos.dx,
        top: knobPos.dy-5,
          
          child: GestureDetector(
            onPanStart: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              _currentDragOffset = getBox.globalToLocal(details.globalPosition);
            },
            onPanUpdate: (details) {
              var previousOffset = _currentDragOffset;
              _currentDragOffset += details.delta;
              var angle = currentAngle +
                  toAngle(_currentDragOffset, center) -
                  toAngle(previousOffset, center);
              currentAngle = normalizeAngle(angle);
              widget.onAngleChanged(currentAngle);
              setState(() {});
            },
            child:  _Knob(strokeWidth: widget.strokeWidth),
          ),
        ),
      ],
    );
  }
}

class SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;
  final double radius;
  final double strokeWidth;

  SliderPainter({required this.startAngle, required this.currentAngle,required this.radius,required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
    ..color=Color.fromARGB(255, 46, 66, 219)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..color=Colors.white
        ..strokeWidth = strokeWidth,
    );

    canvas.drawArc(rect, startAngle, currentAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Knob extends StatelessWidget {
  final double strokeWidth;
  const _Knob({required this.strokeWidth}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: strokeWidth+20,
      width: strokeWidth+15,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Color.fromARGB(255, 46, 66, 219), width: 5.0)),
    );
  }
}