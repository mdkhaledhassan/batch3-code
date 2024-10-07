import 'package:batch3/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'getx/getx_home_screen.dart';

final box = GetStorage();

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  await GetStorage.init();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    //for getx
    return ScreenUtilInit(
      designSize: Size(390,844),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        title: 'Flutter Batch 3',
        home: const GetxHomeScreen(),
      ),
    );

    //for provider
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => CounterProvider()),
    //   ],
    //   child: ScreenUtilInit(
    //     designSize: Size(390,844),
    //     builder: (context, child) => MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData(
    //         useMaterial3: true,
    //       ),
    //       title: 'Flutter Batch 3',
    //       home: const ProviderHomeScreen(),
    //     ),
    //   ),
    // );
  }
}