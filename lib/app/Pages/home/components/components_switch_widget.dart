import 'package:arquitetura/app/app_controller.dart';
import 'package:flutter/material.dart';

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({ Key? key }) : super(key: key);
  
  //* Quando criamos(componetizamos) widgets geralmente fazemos eles em stateless
  @override
  Widget build(BuildContext context) {
    return  Switch(
      //? Depois de colocar a facilitação la no app_controller veja como fica o código
      // value: AppController.instance.config.themeSwitch.value,

      //? Repare como diminuiu código e o caminho dele
      value: AppController.instance.isDark,
      onChanged: (value){
        AppController.instance.changeTheme(value);
      },
    );
  }
}