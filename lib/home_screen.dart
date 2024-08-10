import 'package:batch3/screen1.dart';
import 'package:batch3/screen2.dart';
import 'package:batch3/screen3.dart';
import 'package:batch3/screen4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screenns = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4()
  ];

  void onTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.home),),
              Tab(icon: Icon(Icons.people),),
            ]),
            elevation: 0,
            title: Text('Flutter batch 3'),
            centerTitle: true,
            // leading: Icon(Icons.home,size: 30,color: Colors.black,),
            leading: Icon(Icons.home,size: 30,color: Color(0XFFFFFFFF)),
            // leading: Text('Flutter batch 3'),
            // leadingWidth: 40,
            actions: [
              Icon(Icons.menu),
              Icon(Icons.menu),
              Icon(Icons.menu),
            ],
          ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
          // floatingActionButton: FloatingActionButton(
          //   onPressed: (){},
          //   backgroundColor: Colors.red,
          //   child: Icon(Icons.add),
          //   ),
          body: TabBarView(
            children: [
            Screen1(),
            Screen2()
          ]),
            // body: screenns[currentIndex],
          bottomNavigationBar: BottomAppBar(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                  child: Container(
                    child: Icon(Icons.home,color: currentIndex == 0 ? Colors.red : Colors.black,),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                  child: Container(
                    child: Icon(Icons.notifications,color: currentIndex == 1 ? Colors.red : Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 2;
                    });
                  },
                  child: Container(
                    child: Icon(Icons.gif_box,color: currentIndex == 2 ? Colors.red : Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                  child: Container(
                    child: Icon(Icons.people,color: currentIndex == 3 ? Colors.red : Colors.black),
                  ),
                ),
              ],
            ),
          )
          
          
          
          // BottomNavigationBar(
          //   onTap: onTapped,
          //   selectedItemColor: Colors.red,
          //   unselectedItemColor: Colors.black,
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          //     BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification'),
          //     BottomNavigationBarItem(icon: Icon(Icons.gif_box),label: 'Orders'),
          //     BottomNavigationBarItem(icon: Icon(Icons.people),label: 'Profile'),
          //   ],
          // currentIndex: currentIndex,
          // ),
        ),
      ),
    );
  }
}