//*Interface criado para ser usado no services
//*Fazemos ele para ser um contrato, e todo mundo que implementar essa interface tem que seguir esse contrato

abstract class ILocalStorage {
  Future get(String key);
  Future delete(String key);
  Future put(String key, dynamic value);
}
