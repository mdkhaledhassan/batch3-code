import 'package:batch3/provider/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var counterProvider = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(counterProvider.count.toString()),
            Text(context.watch<CounterProvider>().count.toString()),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  // counterProvider.inc();
                  context.read<CounterProvider>().inc();
                }, child: Text('+')),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(onPressed: (){
                  // counterProvider.dec();
                  context.read<CounterProvider>().dec();
                }, child: Text('-')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}