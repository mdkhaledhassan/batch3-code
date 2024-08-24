import 'package:batch3/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:page_transition/page_transition.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        itemCount: 10,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Screen2(
                index: index.toString(),
              )));
            },
            child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.teal,
                  child: Center(
                    child: Text(index.toString(),style: TextStyle(color: Colors.white),),
                  ),
                ),
          );
              
        },
      ),
      
      
      // StaggeredGrid.count(crossAxisCount: 3,
      // mainAxisSpacing: 10,
      // crossAxisSpacing: 10,
      // children: List.generate(5, (index) => Container(
      //     height: 100,
      //     width: 100,
      //     color: Colors.teal,
      //     child: Center(
      //       child: Text(index.toString(),style: TextStyle(color: Colors.white),),
      //     ),
      //   )
      //   ),
      // )
      
      
      //gridview count widget
      // GridView.count(crossAxisCount: 4,mainAxisSpacing: 10,crossAxisSpacing: 10,
      // children: List.generate(5, (index) => Container(
      //     // height: 100,
      //     // width: 100,
      //     color: Colors.teal,
      //     child: Center(
      //       child: Text(index.toString(),style: TextStyle(color: Colors.white),),
      //     ),
      //   )
      //   ),
      //   )
      
      
      
      // GridView.count(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10,
      // children: [
      //   Container(
      //     // height: 100,
      //     // width: 100,
      //     color: Colors.black,
      //     child: Center(
      //       child: Text('demo 1',style: TextStyle(color: Colors.white),),
      //     ),
      //   ),
      //   Container(
      //     // height: 100,
      //     // width: 100,
      //     color: Colors.teal,
      //     child: Center(
      //       child: Text('demo 2',style: TextStyle(color: Colors.white),),
      //     ),
      //   ),
      //   Container(
      //     // height: 100,
      //     // width: 100,
      //     color: Colors.black,
      //     child: Center(
      //       child: Text('demo 3',style: TextStyle(color: Colors.white),),
      //     ),
      //   ),
      //   Container(
      //     // height: 100,
      //     // width: 100,
      //     color: Colors.teal,
      //     child: Center(
      //       child: Text('demo 4',style: TextStyle(color: Colors.white),),
      //     ),
      //   ),
      // ],
      // )
      
      
      //gridview builder widget
      // GridView.builder(
      //   itemCount: 10,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 10,crossAxisSpacing: 10), 
      //   itemBuilder: (context, index){
      //   return Container(
      //     // height: 100,
      //     // width: 100,
      //     color: Colors.teal,
      //     child: Center(
      //       child: Text(index.toString(),style: TextStyle(color: Colors.white),),
      //     ),
      //   );
      // })
      
      
      //listview widget
      // SizedBox(
      //   height: 100,
      //   child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: 5,
      //     shrinkWrap: true,
      //     physics: AlwaysScrollableScrollPhysics(),
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.only(right: 15),
      //         child: Container(
      //           height: 100,
      //           width: 100,
      //           decoration: BoxDecoration(
      //             color: Colors.teal,
      //             borderRadius: BorderRadius.circular(15),
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.black.withOpacity(0.25),
      //                 blurRadius: 10
      //               )
      //             ]
      //           ),
      //           child: Center(child: Text(index.toString(),style: TextStyle(color: Colors.white),)),
      //         ),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}