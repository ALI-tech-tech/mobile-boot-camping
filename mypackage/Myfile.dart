import 'dart:io';

Future<List<String>> readFileAsList(String filePath) async {
  // Read the file
  File file = File(filePath);
  List<String> lines;

  try {
    lines = await file.readAsLines();
  } catch (e) {
    print("Error reading file: $e");
    return[];
  }

  return lines;
}




Future<List<Map<String, dynamic>>> readFileAsListOfMaps(String filePath) async {
  // Read the file
  File file = File(filePath);
  List<Map<String, dynamic>> listOfMaps = [];

  try {
    List<String> lines = await file.readAsLines();

    for (String line in lines) {
      // Parse each line as a map
      Map<String, dynamic> map = Map();
      List<String> keyValuePairs = line.split(',');

      for (String pair in keyValuePairs) {
        List<String> keyValue = pair.split(':');
        String key = keyValue[0].trim();
        dynamic value = keyValue[1].trim();

        map[key] = value;
      }

      listOfMaps.add(map);
    }
  } catch (e) {
    print("Error reading file: $e");
    return [{"Error":"Error reading file: $e"}];
  }

  return listOfMaps;
}