import 'package:arquitetura/app/interfaces/local_storage_interface.dart';
import 'package:arquitetura/app/models/appconfig_model.dart';
import 'package:arquitetura/app/services/shared_local_storage_service.dart';
import 'package:flutter/foundation.dart';

class AppController {
  //====================================Utilizando Static e construtor privado======================================
  //*Colocando static, final, e construtor privado _(), o singleton fica totalmente protegido de ser instanciado como classe e de ser reatribuido algo a ele

  //*Fazendo um static ele fica disponivel para o app todo
  //? static -> singleton tem uma instancia só
  static final AppController instance = AppController._();

  //*Final -> para evitar que ao colocar ele em outra classe e fizemos isso 'AppController.instance = ', não seja permitido atribuir algo a ele com o =
  //? ou seja ele vai proibir de fazer isso por exemplo AppController.instance = true;

  //*Criando um construtor privado para ser acessado somente nessa classe !!
  //?Com isso ele não vai ser acessado fora daqui sendo instanciado
  AppController._() {
    //*.then -> checar se existe algo dentro dele, se existir nos implementamos
    storage.get('isDark').then((value) {
      //* if -> para dar uma segurança, se for diferente de nullo ele adiciona a implementação abaixo
      if (value != null) config.themeSwitch.value = value;
    });
  }
  //!Vamos utilizar o construtor vamos verificar se tem algum dado na base de dados quando inicializar a aplicação
  //==================================================================================================================

  //====================================Utilizando ValueNotifier=====================================================
  //*false -> valor de inicialização
  // final themeSwitch = ValueNotifier<bool>(false);
  // changeTheme(bool value){
  //   themeSwitch.value = value;
  // }
  //? Antes estava assim /\
  //!Depois passei o valueNofier para o 'AppConfigModel' e ficou assim \/

  //*Utilizando o model aonde esta o valuenotifier
  final AppConfigModel config = AppConfigModel();

  //*Facilitação o acesso do config, themeSwitch, para não fica um caminho enorme
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  //*Aqui vamos utilizar o service, mais não vamos pegar pela instancia e sim pela interface criada, e depois chamamos a instance
  final ILocalStorage storage = SharedLocalStorageService();

  changeTheme(bool value) {
    config.themeSwitch.value = value;
    //*Quando fechamos o app e abrimos novamente, ele não esta salvando o tema que o usuario coloca, para isso fizemos o Service e a interface
    //*Olhe abaixo como implementamos(com isso ele vai salvar offilne a preferencia do usuario e quando ele abrir o app novamente estara salvo como ele deixou)
    storage.put('isDark', value);
  }
  //==================================================================================================================
}
