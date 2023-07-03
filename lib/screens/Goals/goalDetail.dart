import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../widgets/customProgressIndicator.dart';

class goalDetail extends StatefulWidget {
  const goalDetail({super.key});

  @override
  State<goalDetail> createState() => _goalDetailState();
}

class _goalDetailState extends State<goalDetail> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(onPressed: ()=>{},color: Colors.black,),
        title: Text('Goal Detail',style: TextStyle(fontSize:22,color: Colors.black),),
        centerTitle: true,
        actions: [Icon(Icons.app_registration,color: Colors.black,)],

      ),
body: Column(
  children: [
        SizedBox(
          height: 620,
          child: Stack(children: [
            CircularSlider(onAngleChanged: (angle) {  }, radius: 100, strokeWidth: 13,),
            Positioned(
              left: 145,
              top: 120,
              child: Column(
                children: [
                  Text("60%",style: TextStyle(color: Colors.black,fontSize: 44,fontWeight: FontWeight.bold),),
                
                  Text("3,000/4,000",style: TextStyle(color: Color.fromRGBO(132, 130, 130, 10)),),
                  SizedBox(height: 5,),
                  Text("USD",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),)
              
                ],
              
              ),),
               Positioned(
                left: 140,
                top:150,
                 child: Text(
                 'Last added amount',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Color(0xB5534747),
                   fontSize: 10,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w400,
                   height: 20,
                 ),
               ),
               ),
               Positioned(
                left: 148,
                top: 315,
                 child: Text(
                 'USD \$500',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 17,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w500,
                 ),
               ),
               ),
               Positioned(
                   left: 126,
                top: 205,
                 child: Text(
                 'Estimated time to reach goal',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   color: Color(0xB5534747),
                   fontSize: 10,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w400,
                   height: 20,
                 ),
               ),
               ),
               Positioned(
 left: 156,
                top: 370,
                 child: Text(
                 '26 Week',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 17,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w500,
                 ),
               ),
               ),

               Positioned(
                 left: 75,
                top: 430,
                 child: Container(
                 width: 216,
                 height: 48,
                 child: Center(
                   child: Text(
                   'Add Saved Amount',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 17,
                     fontFamily: 'DM Sans',
                     fontWeight: FontWeight.w400,
                   ),
                 ),
                 ),
                 decoration: ShapeDecoration(
                   color: Color(0xFF551FFF),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10),
                   ),
                   shadows: [
                     BoxShadow(
                       color: Color(0x0A8B8585),
                       blurRadius: 25,
                       offset: Offset(0, -10),
                       spreadRadius: 0,
                     ),BoxShadow(
                       color: Color(0x19A6A6A6),
                       blurRadius: 25,
                       offset: Offset(10, 10),
                       spreadRadius: 0,
                     )
                   ],
                 ),
               ),
               ),
               Positioned(
          left: 140,
          top: 360,
           child: Text(
             'Set Goal As Reached',
             textAlign: TextAlign.center,
             style: TextStyle(
               color: Color(0xF4551FFF),
               fontSize: 10,
               fontFamily: 'Inter',
               fontWeight: FontWeight.w400,
               height: 20,
             ),
           ),
               ),
          
              ]),
        ),
                     
  ],
)
      );

  
  }
}

