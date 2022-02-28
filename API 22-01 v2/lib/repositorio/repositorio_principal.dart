
import 'package:proj/modelos/modelo_principal.dart';

abstract class RepositoryCentral{
  Future<List<PostProduto>> getList();
}