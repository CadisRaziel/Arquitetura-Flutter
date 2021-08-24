import 'package:arquitetura/app/models/appconfig_model.dart';
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
  //!passei o valueNofier para o 'AppConfigModel'
  // final themeSwitch = ValueNotifier<bool>(false);

  //*Utilizando o model aonde esta o valuenotifier
  final AppConfigModel config = AppConfigModel();

  //*Facilitação o acesso do config, themeSwitch, para não fica um caminho enorme
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  changeTheme(bool value){
    config.themeSwitch.value = value;
  }
}