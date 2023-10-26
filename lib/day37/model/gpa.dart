// ignore_for_file: public_member_api_docs, sort_constructors_first
class GPA {
  int? min_percent_grade;
  int? max_percent_grade;
  double? gpa_scale;
  String? letter;

  GPA({
    required this.min_percent_grade,
    required this.max_percent_grade,
    required this.gpa_scale,
    required this.letter,
  });

  GPA.fromjson(Map<String,dynamic> Json){
    min_percent_grade=Json['min_percent_grade'];
    max_percent_grade=Json['max_percent_grade'];
    gpa_scale=Json['gpa_scale'];
    letter=Json['letter'];
  }
}
