import 'package:arquitetura/app/controllers/app_controller.dart';
import 'package:flutter/material.dart';

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({ Key? key }) : super(key: key);
  
  //* Quando criamos(componetizamos) widgets geralmente fazemos eles em stateless
  @override
  Widget build(BuildContext context) {
    return  Switch(
      value: AppController.instance.themeSwitch.value,
      onChanged: (value){
        AppController.instance.changeTheme(value);
      },
    );
  }
}