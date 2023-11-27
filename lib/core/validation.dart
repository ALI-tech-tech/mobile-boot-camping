class MyValidate {
  
  static validateName(String name, int len, String msg) {
    int h = 0;
    if (name.length >= len) {
      for (var i = 0; i < name.length; i++) {
        if (name[i].isNotEmpty) {
          h++;
        }
      }
    }
    if (h >= len) {
      return null;
    }

    return msg;
  }

  static validatePass(String name, int len, String msg) {
    int h = 0;
    if (name.length >= len) {
      for (var i = 0; i < name.length; i++) {
        if (name[i].isEmpty) {
          return msg;
        }
        h++;
      }
    }
    if (h >= len) {
      return null;
    }

    return msg;
  }
}