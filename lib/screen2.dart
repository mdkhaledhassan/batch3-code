import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {

  final key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: Icon(Icons.menu)),
      ),
      drawer: Drawer(
        backgroundColor: Colors.teal,
        width: 200,
        child: Column(
          children: [
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            Text('influxdev'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.search)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: (){
              key.currentState!.closeDrawer();
            }, child: Text('Close'))
          ],
        ),
      ),
      body: Text('text')
      
      
      //row widget

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     Icon(Icons.home),
      //     Icon(Icons.menu),
      //     Icon(Icons.search),
      //     Icon(Icons.book),
      //     Icon(Icons.people),
      //   ],
      // )

      //column widget
      
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text('influxdev'),
      //     Text('influxdevinfluxdev'),
      //     Text('influxdevinfluxdevinfluxdev'),
      //     Text('influxdevinfluxdevinfluxdevinfluxdev'),
      //     Text('influxdevinfluxdevinfluxdevinfluxdevinfluxdev'),
      //   ],
      // ),
    );
  }
}