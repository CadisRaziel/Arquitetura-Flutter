import 'package:arquitetura/app/Pages/home/home_page.dart';
import 'package:arquitetura/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';


  //* Olhe que interessante como atribuimos um Tema dark e light usando ValueNotifier

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppController.instance.themeSwitch,
      builder: (context, isDart, child) {
        return MaterialApp(
          title: 'Arquitetura de software',
          theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primarySwatch: Colors.blue,
              brightness: isDart ? Brightness.dark : Brightness.light
              ),
              //*ThemeMode eu que implementei separadamente para um teste
              themeMode: ThemeMode.system,             
          home: MyHomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
