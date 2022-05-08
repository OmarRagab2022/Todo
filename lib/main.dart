import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/helper/db_helper.dart';
import 'package:todo/helper/notif_helper.dart';
import 'package:todo/view/home_layout.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 
 tz.initializeTimeZones();
 final String? currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
 tz.setLocalLocation(tz.getLocation(currentTimeZone!));
 DBHelper().initDB();
 await NotifiHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const HomeLayout(),
    );
  }
}

