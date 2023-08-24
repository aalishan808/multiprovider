import 'package:flutter/material.dart';
import 'package:multiprovider/provider/example_one_provider.dart';
import 'package:multiprovider/provider/favourate_screen_Provider.dart';
import 'package:multiprovider/provider/theme_changer_provider.dart';
import 'package:multiprovider/view/dark_theme_screen.dart';
import 'package:multiprovider/view/example_one_screen.dart';
import 'package:multiprovider/view/favourate/favourate_screen.dart';
import 'package:multiprovider/view/statelessAsStateful/stateless_as_stateful.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ ChangeNotifierProvider(create:(_)=> ExampleOneProvider()),
        ChangeNotifierProvider(create:(_)=> FavourateScreenProvider()),
        ChangeNotifierProvider(create:(_)=> ThemeChangerProvider()),

      ],

      child: Builder(builder: (BuildContext context) {
        final themeChanger = Provider.of<ThemeChangerProvider>(context);
        return MaterialApp(
          themeMode: themeChanger.themeMode,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.purple,
            primaryColor: Colors.purple,
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal
            )
          ),


          home: NotifyListenerScreen(),
        );
      },),
    );
  }
}
