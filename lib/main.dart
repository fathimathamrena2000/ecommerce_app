import 'package:ecommerce_app/navbar.dart';
import 'package:ecommerce_app/screens/gotocartpro.dart';
//import 'package:ecommerce_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'api/newbornapi.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Newbornimg>(create: (_) => Newbornimg()),
        ChangeNotifierProvider<Cartprovider>(create: (_) => Cartprovider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent, //color set to transparent or set own color
      statusBarIconBrightness: Brightness
          .dark, //set brightness for icons, like dark bckgrnd light icons
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PersistentNavbarEg(),
    );
  }
}
