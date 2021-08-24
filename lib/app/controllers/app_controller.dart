import 'package:flutter/foundation.dart';

class AppController {
  //*Colocando static, final, e construtor privado _(), o singleton fica totalmente protegido de ser instanciado como classe e de ser reatribuido algo a ele 

  //*Fazendo um static ele fica disponivel para o app todo
  //? static -> singleton tem uma instancia só
  static final AppController instance = AppController._();

  //*Final -> para evitar que ao colocar ele em outra classe e fizemos isso 'AppController.instance = ', não seja permitido atribuir algo a ele com o =
  //? ou seja ele vai proibir de fazer isso por exemplo AppController.instance = true;

  //*Criando um construtor privado para ser acessado somente nessa classe !!
  //?Com isso ele não vai ser acessado fora daqui sendo instanciado
  AppController._();

  //*false -> valor de inicialização
  final themeSwitch = ValueNotifier<bool>(false);

  changeTheme(bool value){
    themeSwitch.value = value;
  }
}