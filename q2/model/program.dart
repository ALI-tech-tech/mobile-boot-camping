class Program {
  int? id;
  String? program_name;
  int? fees;

  Program fromjson(Map<String,dynamic> pro){
    this.id=pro["id"];
    this.program_name=pro["name"];
    this.fees=pro["fees"];
    return this;
  }
  Program fromapi(Map<String,dynamic> pro){
    this.id=pro["id"];
    this.program_name=pro["title"];
    this.fees=pro["fees"];
    return this;
  }

}