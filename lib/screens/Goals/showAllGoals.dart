import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:money_managment/widgets/sliderWidgets.dart';



class goalsList {
  final String name;
  final String imageSrc;

  goalsList(this.name, this.imageSrc);
}


class showAllGoals extends StatefulWidget {
  const showAllGoals({super.key});

  @override
  State<showAllGoals> createState() => _showAllGoalsState();
}

class _showAllGoalsState extends State<showAllGoals> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Color.fromRGBO(241, 242, 246, 1),
      body: Center(child: Column(
        children: [
        Text("All Goals", 
  style: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    height: 5,
  ),),
 
  Container(
  width: MediaQuery.of(context).size.width/1.05,
  height: 170,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20)
  ),
  
  child: Column(
    children: [
      ListTile(leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle
        ),
        child: Icon(Icons.home_outlined,color: Colors.white,)),
        title: Text("Startup"),
        subtitle: Text("50% Complete",style: TextStyle(color: Colors.blue),),
        ),


           ListTile(leading:Text("\$5000",style: TextStyle(fontWeight: FontWeight.bold),),
      
      trailing: Text("Target : \$10000 ",style: TextStyle(),),
        ),
     
      SliderWidget(max: 10, min: 0, sliderHeight: 30,fullWidth: true, width: 320.toDouble(),),
    ],
  ),

)
,
 
SizedBox(height: 20,),
  Container(
  width: MediaQuery.of(context).size.width/1.05,
  height: 170,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20)
  ),
  
  
  child: Column(
    children: [
      ListTile(leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle
        ),
        child: Icon(Icons.home_outlined,color: Colors.white,)),
        title: Text("Startup"),
        subtitle: Text("50% Complete",style: TextStyle(color: Colors.blue),),
        ),


           ListTile(leading:Text("\$5000",style: TextStyle(fontWeight: FontWeight.bold),),
      
      trailing: Text("Target : \$10000 ",style: TextStyle(),),
        ),
     
      SliderWidget(max: 10, min: 0, sliderHeight: 30,fullWidth: true, width: 320.toDouble(),),
    ],
  ),

)     
,
SizedBox(height: 20,),
  Container(
  width: MediaQuery.of(context).size.width/1.05,
  height: 170,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20)
  ),
  
  child: Column(
    children: [
      ListTile(leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle
        ),
        child: Icon(Icons.home_outlined,color: Colors.white,)),
        title: Text("Startup"),
        subtitle: Text("50% Complete",style: TextStyle(color: Colors.blue),),
        ),


           ListTile(leading:Text("\$5000",style: TextStyle(fontWeight: FontWeight.bold),),
      
      trailing: Text("Target : \$10000 ",style: TextStyle(),),
        ),
     
      SliderWidget(max: 10, min: 0, sliderHeight: 30,fullWidth: true, width: 320.toDouble(),),
    ],
  ),

)
        
        ],
      )),
    );
  }
}