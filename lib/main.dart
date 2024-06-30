import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/view/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Color.fromARGB(255, 250, 222, 253),
      ),
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      home: MainScreen(), // This line specifies the initial screen
    );
  }
}
