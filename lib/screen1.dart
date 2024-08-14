import 'package:flutter/material.dart';
import 'widgets/custom_text_widget.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //custom text
        //child: CustomTextWidget(text: 'influxdev',color: Colors.amber,fontSize: 30,fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis,maxLines: 2,)
        
        //container widget
        child: Stack(

          children: [
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                //   colors: [
                //   Colors.green.withOpacity(0.3),
                //   Colors.red.withOpacity(0.1),
                //   Colors.green.withOpacity(0.3)
                // ]),
                color: Colors.teal,
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                border: Border.all(
                  color: Colors.amber,
                  width: 2
                ),
            
              ),
               child: Padding(
                 padding: const EdgeInsets.only(left: 40,top: 50,right: 40),
                 child: CustomTextWidget(text: 'influxdev',color: Colors.amber,fontSize: 30,fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis,maxLines: 2,),
               ),
            ),

            //card
            // Card(
            //   margin: EdgeInsets.all(30),
            //   color: Colors.amber,
            //   child: Icon(Icons.home,size: 40,),
            // )


            //positioned
            // Positioned(
            //   right: 40,
            //   bottom: 40,
            //   child: Icon(Icons.home,size: 40,))
          ],
        ),
      ),
    );
  }
}