import '../models/m_user.dart';

abstract class RepositoryCentral{
  Future<List<PostProduto>> getList();
}