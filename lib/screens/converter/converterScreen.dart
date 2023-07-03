import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:money_managment/widgets/customAppBar.dart';

class converterScreen extends StatefulWidget {
  const converterScreen({super.key});

  @override
  State<converterScreen> createState() => _converterScreenState();
}

class ListItem{
  final String name;
  final Icon icon;
  final String Currency;
  ListItem(this.name,this.icon, this.Currency);
}

class _converterScreenState extends State<converterScreen> {

  
  List<ListItem> myList = [

    ListItem("United States", Icon(Icons.flag), "USD"),
    ListItem("Pakistan", Icon(Icons.flag), "PAK"),
    ListItem("Eurozone", Icon(Icons.face), "EUR"),
    ListItem("Japan", Icon(Icons.flag), "JPY"),
    ListItem("United Kingdom", Icon(Icons.flag), "GBP"),
    ListItem("Australia", Icon(Icons.flag), "AUD"),
    ListItem("Canada", Icon(Icons.flag), "CAD"),
    ListItem("Switzerland", Icon(Icons.flag), "CHF"),
    ListItem("China", Icon(Icons.flag), "CNY"),
    ListItem("Sweden", Icon(Icons.flag), "SEK"),
    ListItem("New Zealand", Icon(Icons.flag), "NZD"),
    ListItem("South Korea", Icon(Icons.flag), "KRW"),
    ListItem("Singapore", Icon(Icons.flag), "SGD"),
    ListItem("India", Icon(Icons.flag), "INR"),
    ListItem("Brazil", Icon(Icons.flag), "BRL"),
    ListItem("South Africa", Icon(Icons.flag), "ZAR"),
    ListItem("Russia", Icon(Icons.flag), "RUB"),
    ListItem("Mexico", Icon(Icons.flag), "MXN"),
    ListItem("Turkey", Icon(Icons.flag), "TRY"),
    ListItem("Norway", Icon(Icons.flag), "NOK"),
    ListItem("Poland", Icon(Icons.flag), "PLN"),
          
];

  String formattedDate = DateFormat('M/d/yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
    
      appBar: CustomAppBar(
        
        height: 320,
        child: 
      Column(
        children:[
          AppBar(
          
            toolbarHeight: 80,
            
            elevation: 0,
            backgroundColor: Colors.white,
            leading: BackButton(
              color: Colors.black87,
              onPressed: ()=>Navigator.pop(context),
            ),
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top:14.0),
              child: Container(
                width: 120,
            
                child: Column(
                  
                  children: [
                    Text("Currency",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                     SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    
                      
                      children: [
                      
                      Icon(Icons.calendar_month,color: Colors.black,size: 14,),
                      SizedBox(width: 3,),
                      Text(formattedDate,style: TextStyle(color: Colors.black,fontSize: 12),)
                      
                    ],)
                  ],
                ),
              ),
            ),
            actions: [Icon(Icons.check,color: Colors.black,),SizedBox(width: 10)],
            
          ),
          ListTile(leading: Container(
            width: 100,
            child: Row(children: [Text("PKR"),Icon(Icons.keyboard_arrow_down)
            ],)
            ),
            trailing: Container(height: 50,
            child: Column(children: [Text("500",style: TextStyle(fontSize:  20,fontWeight: FontWeight.bold),),Text("Pakistani Rupee",style: TextStyle(fontSize: 10  ),)],)

            ,)),
          
           ListTile(leading: Container(
            width: 100,
            child: GestureDetector(
              onTap: ()=>{

              showBottomModalSheet( context,myList )

              },
              child: Row(children: [Text("PKR"),Icon(Icons.keyboard_arrow_down)
              ],),
            )
            ),
            trailing: Container(height: 50,
            child: Column(children: [Text("500",style: TextStyle(fontSize:  20,fontWeight: FontWeight.bold),),Text("Pakistani Rupee",style: TextStyle(fontSize: 10  ),)],)

            ,)),
               ListTile(leading: Container(
            width: 100,
            child: Row(children: [Text("PKR"),Icon(Icons.keyboard_arrow_down)
            ],)
            ),
            trailing: Container(height: 50,
            child: Column(children: [Text("500",style: TextStyle(fontSize:  20,fontWeight: FontWeight.bold),),Text("Pakistani Rupee",style: TextStyle(fontSize: 10  ),)],)

            ,)),
        ]
      )),
  
    );
  }
}
void showBottomModalSheet(BuildContext context, List<ListItem> myList) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        minChildSize: 0.1,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragEnd: (_) {
              Navigator.of(context).pop();
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Select currency",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                  children:[  ListTile(
                          title: Container(
                            width: 100,
                            child: Row(
                              children: [
                        buildWallPapers(0),
                        
                        buildWallPapers(1),
                      
                        buildWallPapers(2 ),
                              ],
                            ),
                          ),
                        )
                  ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 9.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );

  
}
  Widget buildWallPapers(int index) {
    return GestureDetector(
      onTap: () {
        //marginLeft.value = (wallpaperWidth + wallpaperGap) * index;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red,
        ),
       
      ),
    );
  }