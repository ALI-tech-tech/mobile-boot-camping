import 'dart:io';

class Connection {
  static late File _f;

  static late Connection con;
  Connection._Connection();
 
  static createfile(String path ,String filename){
    _f=File("${path}\\${filename}");
    if(!_f.existsSync())
    _f.create(recursive: true);

    return _f;
  }
}