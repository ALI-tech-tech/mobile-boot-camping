abstract class DataRepo {
  Future<List<Map<String, dynamic>>> getAllData(String source);
  Future<int> storeData(String source, Map<String, dynamic> data);
  Future<int> removeData(String source, int id);
  Future<int> updateData(String source, Map<String, dynamic> data);
}
