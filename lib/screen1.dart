import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            //expanded, flexiable, fittedbox
            // Text('hello'),
            // Row(
            //   children: [
            //     // Flexible(child: Text('jshfbsdhfkjfbgdjffhdjfhdjhfjdhfjdhijfhgijhgjhsjfhsojdfhfjhfjdhfjdhfjhjidshfijsdhjfhdsjhfjdshfijbsvkbncnxkjdbijhfjbjfkhkfjhskjfhdskfhskfhksdhfkbvkcb'))
            //   ],
            // ),
            // FittedBox(child: Text('jshfbsdhfkjfbgdjffhdjfhdjhfjdhfjdhijfhgijhgjhsjfhsojdfhfjhfjdhfjdhfjhjidshfijsdhjfhdsjhfjdshfijbsvkbncnxkjdbijhfjbjfkhkfjhskjfhdskfhskfhksdhfkbvkcb')),
        
            // Expanded(
            //   child: Container(
            //     // width: double.infinity,
            //     color: Colors.green,
            //   ),
            // ),


            //dialog box
        
            // ElevatedButton(onPressed: (){
            //   showDialog(context: context, builder: (context)=> 
            //   AlertDialog(
            //     title: Text('Hello'),
            //     content: Text('influxdev'),
            //   ));
            // }, child: Text('Open'))


            //modal bottom sheet

            // ElevatedButton(onPressed: (){
            //   showModalBottomSheet(context: context, 
            //   backgroundColor: Colors.transparent,
            //   isDismissible: true,
            //   builder: (context){
            //     return Container(
            //       height: 400,
            //      decoration: BoxDecoration(
            //        color: Colors.amber,
            //        borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(30),
            //         topRight: Radius.circular(30)
            //        )
            //      ),
            //     );
            //   });
            // }, child: Text('Open'))

            // //flutter toast
            // ElevatedButton(onPressed: (){
            //   showToast('Successfully');
            // }, child: Text('Show Toast')),

            // //sackbar
            // ElevatedButton(onPressed: (){
            //   showSnackBar('Successfully', context);
            // }, child: Text('Show Snackbar'))

            // Container(
            //   height: height * 0.6,
            //   width: width * 0.9,
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //     borderRadius: BorderRadius.circular(15.sp)
            //   ),
            //   child: Text('influxdev',style: TextStyle(fontSize: 20.sp),),
            // )


            //get storage

            // ElevatedButton(onPressed: (){
            //   box.write('name', 'Khaled');
            // }, child: Text('Save')),
            // Text(name),
            // ElevatedButton(onPressed: (){
            //    name = box.read('name');

            //    print(name);

            //    setState(() {
                 
            //    });
            // }, child: Text('Get')),

            // ElevatedButton(onPressed: (){
            //    box.remove('name');

            //    print(name);

            //    setState(() {
                 
            //    });
            // }, child: Text('Remove')),


          ],
        ),
      )
      
      
      
      // Center(
      //   //custom text
      //   //child: CustomTextWidget(text: 'influxdev',color: Colors.amber,fontSize: 30,fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis,maxLines: 2,)
        
      //   //container widget
      //   child: Stack(

      //     children: [
      //       Container(
      //         height: 200,
      //         width: 200,
      //         margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      //         decoration: BoxDecoration(
      //           // gradient: LinearGradient(
      //           //   begin: Alignment.centerLeft,
      //           //   end: Alignment.centerRight,
      //           //   colors: [
      //           //   Colors.green.withOpacity(0.3),
      //           //   Colors.red.withOpacity(0.1),
      //           //   Colors.green.withOpacity(0.3)
      //           // ]),
      //           color: Colors.teal,
      //           // shape: BoxShape.rectangle,
      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
      //           border: Border.all(
      //             color: Colors.amber,
      //             width: 2
      //           ),
            
      //         ),
      //          child: Padding(
      //            padding: const EdgeInsets.only(left: 40,top: 50,right: 40),
      //            child: CustomTextWidget(text: 'influxdev',color: Colors.amber,fontSize: 30,fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis,maxLines: 2,),
      //          ),
      //       ),

      //       //card
      //       // Card(
      //       //   margin: EdgeInsets.all(30),
      //       //   color: Colors.amber,
      //       //   child: Icon(Icons.home,size: 40,),
      //       // )


      //       //positioned
      //       // Positioned(
      //       //   right: 40,
      //       //   bottom: 40,
      //       //   child: Icon(Icons.home,size: 40,))
      //     ],
      //   ),
      // ),
    );
  }
}