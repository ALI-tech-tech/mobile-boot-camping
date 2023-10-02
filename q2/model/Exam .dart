class Exam {
  String? name;
  DateTime? dateofexam;
  DateTime? registerdate;
  int? _totalmark;

  Exam({required this.name,required this.dateofexam,required this.registerdate});
 int? get totalmark => this._totalmark;

 set totalmark(int? value) => value!<100? this._totalmark = value:0;

}