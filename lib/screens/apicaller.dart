import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiCaller {
  // Get Api Calling
  static Future<dynamic> callTheGetApi(
      String sitename, String path, Map<String, String> map) async {
    final url = Uri.http(
        sitename, //"surevih.com",
        path, //link, or "/api/data",
        map);

    print(url);
    try {

      final response = await http.get(url);
      // final jsonResponse=convert.jsonDecode(response.body);
      if (response.statusCode != 200) throw Exception("Status Code not 200 ${response.statusCode}");

      dynamic data = response.body;
      return jsonDecode(data);
      
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // Get Post Calling
  static Future<dynamic> callThePostApi(
      String sitename, String path, Map<String, String> map) async {
    final url = Uri.http(
        sitename, //"surevih.com",
        path, //link, or "/api/data",
        map);

    print(url);
    try {
      final response = await http.post(url);
      // final jsonResponse=convert.jsonDecode(response.body);
      if (response.statusCode != 200) throw Exception("Status Code not 200 ${response.statusCode}");
      return response.body;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // Post MultiPastApi Calling
  static Future<dynamic> callTheUploadApi(String sitename, String path,
      Map<String, String> map, String imagepath) async {
    final url = Uri.http(
        sitename, //"surevih.com",
        path, //link, or "/api/data",
        map);

    print(url);
    try {
      var request = http.MultipartRequest('POST', url);
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
          'filecontents', imagepath); //RegisterOwner.cpath);
      request.files.add(multipartFile);

      print(url);
      var response = await request.send();
      //http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode != 200) throw Exception("Status Code not 200 ${response.statusCode}");
      return response.stream.bytesToString();
    }
    catch (e) {
      print(e);
      throw e;
    }
  }
}
