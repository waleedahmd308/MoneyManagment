import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;
  final width;

  SliderWidget(
      {required this.sliderHeight ,
      required this.max ,
      required this.min ,
      this.fullWidth = false,required this.width});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return  Center(
        child: Container(
          width: widget.width,

      
        
          height: (this.widget.sliderHeight),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular((this.widget.sliderHeight * .3)),
            ),
                
        color: Colors.transparent
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(this.widget.sliderHeight * paddingFactor,
                2, this.widget.sliderHeight * paddingFactor, 2),
            child: Row(
              children: <Widget>[
                // Text(
                //   '${this.widget.min}',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: this.widget.sliderHeight * .3,
                //     fontWeight: FontWeight.w700,
                //     color: Color.fromRGBO(85, 31, 255, 1)
          
                //   ),
                // ),
                SizedBox(
                  width: this.widget.sliderHeight *0.01,
                ),
                Expanded(
                  child: Center(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Color.fromRGBO(85, 31, 255, 1),
                        inactiveTrackColor: Colors.grey.withOpacity(.5),
          
                        trackHeight: 4.0,
                        thumbShape: CustomSliderThumbCircle(
                          thumbRadius: this.widget.sliderHeight * .3,
                          min: this.widget.min,
                          max: this.widget.max,
                        ),
                        overlayColor: Colors.white.withOpacity(.4),
                        //valueIndicatorColor: Colors.white,
                        activeTickMarkColor: Colors.white,
                        inactiveTickMarkColor: Colors.red.withOpacity(.7),
                      ),
                      child: Slider(
                          value: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                    ),
                  ),
                ),
                
                // Text(
                //   '${this.widget.max}',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: this.widget.sliderHeight * .3,
                //     fontWeight: FontWeight.w700,
                //     color: Color.fromRGBO(85, 31, 255, 1),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
  }
}
class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white       //Thumb Background Color
      ..style = PaintingStyle.fill;

  
    final borderPaint = Paint()
          ..color = Color.fromRGBO(85, 31, 255, 1)
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius * .6, paint);
    canvas.drawCircle(center, thumbRadius*.6, borderPaint);
 
  }

  String getValue(double value) {
    return (min+(max-min)*value).round().toString();
  }
}