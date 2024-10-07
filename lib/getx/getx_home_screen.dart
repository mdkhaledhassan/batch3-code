import 'package:batch3/getx/controller/counter_controller.dart';
import 'package:batch3/getx/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxHomeScreen extends StatelessWidget {
  const GetxHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var counterConntroller = Get.put(CounterController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx((){
              return Text(counterConntroller.count.value.toString());
            } ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  counterConntroller.inc();
                }, child: Text('+')),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(onPressed: (){
                  counterConntroller.dec();
                }, child: Text('-')),
              ],
            ),
            ElevatedButton(onPressed: (){
                  Get.snackbar('Hi', 'Hello');
                  Get.dialog(Dialog(
                    child: Column(
                      children: [
                        Text('Hello')
                      ],
                    ),
                  ));
                  Get.to(()=> NextScreen(),transition: Transition.leftToRight);
                }, child: Text('Goto Next Page')),
          ],
        ),
      ),
    );
  }
}