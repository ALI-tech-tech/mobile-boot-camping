abstract class Crud {
  display();
  displayOne({required String name});
  addNew({required String name, int? no,  double? fee});
  update({required String oldname, required String name, int? no,  double? fee});
  delete({required String name});
}