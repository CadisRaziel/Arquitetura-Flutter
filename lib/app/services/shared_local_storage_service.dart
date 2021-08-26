// existem 3 packages bons para salvar dados localmente
// *SharedPreferences
// *Hive
// *Sqlite

// Serviços locais colocamos dentro do 'Services'

//! Aqui iremos utilizar o sharedPreferences
//*Iremos fazer o services aqui com a ajuda da pasta 'interfaces'

import 'package:arquitetura/app/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedLocalStorageService implements ILocalStorage {
  @override
  Future delete(String key) async {
    var shared = await SharedPreferences.getInstance();
    shared.remove(key);
  }

  @override
  Future get(String key) async {
    var shared = await SharedPreferences.getInstance();
    return shared.get(key);
  }

  @override
  Future put(String key, value) async {
    var shared = await SharedPreferences.getInstance();
    //*Aqui precisamos fazer esse if pois não sabemos que tipo de dados vamos adicionar
    if (value is bool) {
      shared.setBool(key, value);
    } else if (value is String) {
      shared.setString(key, value);
    } else if (value is int) {
      shared.setInt(key, value);
    } else if (value is double) {
      shared.setDouble(key, value);
    }
  }
}
