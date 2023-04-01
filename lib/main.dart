import 'package:animaciones/src/pages/launcher_page.dart';
import 'package:animaciones/src/theme/theme.dart';
// import 'package:animaciones/src/pages/pinterest_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeChanger(2)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: appTheme.currentTheme,
      home: const LauncherPage(),
    );
  }
}
